from django.shortcuts import render, redirect, get_object_or_404
from rest_framework import viewsets, status, generics
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate, login, logout
from rest_framework.views import APIView
from django.contrib.auth.decorators import login_required
from .models import Quiz, Question, Answer, UserQuizAttempt, QuizUser
from .serializers import UserSerializer, QuizSerializer, QuestionSerializer, AnswerSerializer




class UserViewSet(viewsets.ModelViewSet):
    """API endpoint for user registration."""
    queryset = QuizUser.objects.all()
    serializer_class = UserSerializer

    def create(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True) # raise exception if the client-data is not valid
        user = serializer.save()
        login(request, user)  # Login user after registration
        token, _ = Token.objects.get_or_create(user=user)
        return Response({'token': token.key}, status=status.HTTP_201_CREATED)


class LoginView(APIView):
    """API endpoint for user login."""
    permission_classes = []  # Allow unauthenticated users to login

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



class QuizViewSet(generics.RetrieveUpdateDestroyAPIView, generics.ListCreateAPIView):
    """API endpoint for managing quizzes (listing, retrieval, creation, update, delete)."""
    permission_classes = [IsAuthenticated]  # Require authentication for all actions

    queryset = Quiz.objects.all()
    serializer_class = QuizSerializer

    def get_queryset(self):
        """Filter quizzes based on user permissions."""
        user = self.request.user
        if user.is_superuser:
            # Admins can see all quizzes
            return self.queryset
        else:
            # Non-admins can only see quizzes they authored
            return self.queryset.filter(author=user)

    def perform_create(self, serializer):
        """Set the current user as the author of the quiz during creation."""
        serializer.save(author=self.request.user)

    def perform_update(self, serializer):
        """Override to handle any additional logic during update (optional)."""
        # You can add custom logic here if needed, e.g., updating related objects.
        serializer.save()


class TakeQuizView(APIView):
    """API endpoint for taking a quiz (answering questions, submitting)."""
    permission_classes = [IsAuthenticated]

    def post(self, request, quiz_pk=None):
        # Check quiz ID and retrieve quiz object (404 handling)
        quiz = get_object_or_404(Quiz, pk=quiz_pk)

        # Check attempt limit and remaining attempts
        user = request.user
        attempted_quiz, _ = UserQuizAttempt.objects.get_or_create(user=user, quiz=quiz)
        remaining_attempts = max(0, quiz.max_attempts - attempted_quiz.count())

        # Perform attempt checks and exit before fetching more data from the db if attempts are exhausted
        if remaining_attempts <= 0:
            return Response({'error': f'You have already taken this quiz {quiz.max_attempts} time(s). Maximum attempts reached.'}, status=status.HTTP_403_FORBIDDEN)

        # Validate and process user-submitted answers
        submitted_answers = request.data.get('answers', {})
        score = 0
        questions = quiz.questions.prefetch_related('answers')  # Prefetch answers

        for question in questions:
            answer_id_str = str(question.id)  # Convert question ID to string for dictionary lookup
            answer_id = submitted_answers.get(answer_id_str)
            if answer_id:
                correct_answer = question.answers.filter(pk=answer_id, is_correct=True).first()
                if correct_answer:
                    score += question.points

        # Update user quiz attempt data
        attempted_quiz.score = score
        attempted_quiz.total_questions = questions.count()
        attempted_quiz.completed = True

        # Update user quiz progress
        user.total_quizzes_taken += 1
        user.highest_score = max(user.highest_score, score)

        # Save user quiz attempt and user model
        attempted_quiz.save()
        user.save()

        return Response({
            'message': 'Quiz submitted successfully!',
            'score': score,
            'total_questions': questions.count(),
            'remaining_attempts': remaining_attempts,
            'quiz_data': QuestionSerializer(questions, many=True).data  # Serialize questions
        }, status=status.HTTP_200_OK)



@login_required
def logout_view(request):
    """Logout view to clear the session and log out the user."""
    logout(request)
    return redirect('login')
