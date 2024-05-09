from django.shortcuts import render, redirect, get_object_or_404
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate, login, logout
from rest_framework.views import APIView
from rest_framework.pagination import PageNumberPagination
from django.contrib.auth.decorators import login_required
from .models import Quiz, Question, Answer, UserQuizAttempt, QuizUser
from .serializers import QuizSerializer, QuestionSerializer, UserRegistrationSerializer
from random import sample
from django.db import models
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt




class UserRegistrationViewSet(viewsets.ModelViewSet):
    """API endpoint for user registration and login."""
    queryset = QuizUser.objects.all()  # Update with your user model queryset if applicable
    serializer_class = UserRegistrationSerializer

    def create(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True) # raise exception if provided data is invalid
        user = serializer.save()
        return Response({'id': user.pk, 'email': user.email,'user': user.get_full_name()}, status=status.HTTP_201_CREATED)



class LoginView(APIView):
    """API endpoint for user login."""
    permission_classes = []  # Allow unauthenticated users to login

    # Define a simple get that allows login 
    def get(self, request): # Added lately so that logout could redirect
        """Allow logout to redirect to get"""
        return Response(status=status.HTTP_200_OK)

    def post(self, request):
        username = request.data.get('username')
        password = request.data.get('password')

        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            token, _ = Token.objects.get_or_create(user=user)
            return Response({'token': token.key}, status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Invalid username or password'}, status=status.HTTP_401_UNAUTHORIZED)


class QuizViewSet(viewsets.ModelViewSet):
    """API endpoint for managing quizzes."""
    permission_classes = [IsAuthenticated]  # Require authentication for all actions
    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer

    def get_queryset(self):
        """Filter quizzes all quizzes for non-admin users."""
        return self.queryset

    def perform_create(self, serializer):
        """Set the current user as the author of the quiz during creation."""
        user = self.request.user
        if user.is_superuser:
            # Admins can see all quizzes
            serializer.save(author=self.request.user)
        else:
            # Only admins can create quizzes
            raise PermissionError('Only admins can create quizzes.')

class TakeQuizView(APIView):
    permission_classes = [IsAuthenticated]
    page_size = 50

    def get(self, request, quiz_pk=None):
        quiz = get_object_or_404(Quiz, pk=quiz_pk)
        user = request.user

        # Check attempt limit and remaining attempts
        attempted_quiz, _ = UserQuizAttempt.objects.get_or_create(user=user, quiz=quiz)
        remaining_attempts = max(0, quiz.max_attempts - attempted_quiz.attempt_count) # avoiding use of filter on the UserQuizAttempt for efficiency
        if remaining_attempts <= 0:
            return Response({'error': f'You have already taken this quiz {quiz.max_attempts} time(s). Maximum attempts reached.'}, status=status.HTTP_403_FORBIDDEN)

        selected_questions = self.select_questions(quiz)

        serializer = QuestionSerializer(selected_questions, many=True)

        return Response({
            'message': 'Available quiz questions',
            'quiz_data': serializer.data,
            'remaining_attempts': remaining_attempts,
        }, status=status.HTTP_200_OK)

    def select_questions(self, quiz):
        questions = quiz.questions.order_by('last_displayed')

        # Prioritize questions least displayed since last attempt
        now = timezone.now()
        questions = questions.annotate(last_displayed_diff=now - models.F('last_displayed')).order_by('last_displayed_diff')

        # Randomly shuffle the questions
        selected_questions = sample(list(questions), min(self.page_size, questions.count()))

        return selected_questions

    def post(self, request, quiz_pk=None):
        quiz = get_object_or_404(Quiz, pk=quiz_pk)
        user = request.user
        print(user.is_authenticated)

        # Check attempt limit and remaining attempts
        attempted_quiz, _ = UserQuizAttempt.objects.get_or_create(user=user, quiz=quiz)
        remaining_attempts = max(0, quiz.max_attempts - attempted_quiz.attempt_count)
        if remaining_attempts <= 0:
            return Response({'error': f'You have already taken this quiz {quiz.max_attempts} time(s). Maximum attempts reached.'}, status=status.HTTP_403_FORBIDDEN)

        score, questions = self.calculate_score(request.data.get('answers', {}), quiz)

        # Update user quiz attempt data
        attempted_quiz.score = score
        attempted_quiz.total_questions = questions.count()
        attempted_quiz.completed = True
        attempted_quiz.attempt_count += 1

        # Update user quiz progress
        user.total_quizzes_taken += 1
        user.highest_score = max(user.highest_score, score)

        # Update last_displayed for answered questions
        now = timezone.now()
        for question in questions:
            answer_id_str = str(question.id)
            answer_id = request.data.get(answer_id_str)
            if answer_id:  # Update last_displayed if an answer was submitted for the question
                question.last_displayed = now

        # Save user quiz attempt, user model, and update question last_displayed fields
        attempted_quiz.save()
        user.save()
        Question.objects.bulk_update(questions, ['last_displayed'])

        return Response({
            'message': 'Quiz submitted successfully!',
            'score': score,
            'total_questions': questions.count(),
            'remaining_attempts': remaining_attempts,
            # 'quiz_data': QuestionSerializer(questions, many=True).data # Uncomment to return all questions in response, it was used for testing
        }, status=status.HTTP_200_OK)

    def calculate_score(self, submitted_answers, quiz):
        score = 0
        questions = quiz.questions.prefetch_related('answers')

        for question in questions:
            answer_id_str = str(question.id)
            answer_id = submitted_answers.get(answer_id_str)
            if answer_id:
                correct_answer = question.answers.filter(pk=answer_id, is_correct=True).first()
                if correct_answer:
                    score += question.points

        return score, questions


@login_required
def logout_view(request):
    """Logout view to clear the session and log out the user."""
    logout(request)
    return redirect('login')
