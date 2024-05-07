from rest_framework import serializers
from .models import Quiz, Question, Answer, QuizUser


class UserSerializer(serializers.ModelSerializer):
    """Serializer for user model data."""
    class Meta:
        model = QuizUser  # Use QuizUser instead of User (custom user model)
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'total_score', 'highest_score',
                  'total_quizzes_taken', 'average_score')
        read_only_fields = ('total_score', 'highest_score', 'total_quizzes_taken', 'average_score')


class QuizSerializer(serializers.ModelSerializer):
    """Serializer for quiz model data."""
    class Meta:
        model = Quiz
        fields = ('id', 'title', 'description', 'total_questions', 'total_score',
                  'difficulty', 'time_limit', 'author', 'created_at', 'updated_at')
        #  same as '__all__' but listed them for readability
        read_only_fields = ('total_score', 'author', 'created_at', 'updated_at')


class QuestionSerializer(serializers.ModelSerializer):
    """Serializer for question model data."""
    class Meta:
        model = Question
        fields = ('id', 'quiz', 'text', 'question_type', 'points', 'last_displayed', 'created_at', 'updated_at')
        read_only_fields = ('quiz', 'last_displayed', 'created_at', 'updated_at')


class AnswerSerializer(serializers.ModelSerializer):
    """Serializer for answer model data."""
    is_correct = serializers.BooleanField(read_only=True)  # Don't expose correct answer in API response

    class Meta:
        model = Answer
        fields = ('id', 'question', 'text', 'is_correct')

# Path: quiz_api/quiz_app/serializers.py