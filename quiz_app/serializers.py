from rest_framework import serializers
from .models import Quiz, Question, Answer, QuizUser


# Serializer for user registration and login
class UserRegistrationSerializer(serializers.ModelSerializer):
    """Serializer for user registration data."""

    class Meta:
        model = QuizUser  # Use QuizUser instead of User (custom user model)
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'password')
        extra_kwargs = {'password': {'write_only': True}}  # Hide password in response

    def create(self, validated_data):
        user = QuizUser.objects.create_user(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user


class QuizSerializer(serializers.ModelSerializer):
    """Serializer for quiz model data."""
    class Meta:
        model = Quiz
        fields = ('id', 'title', 'description', 'total_questions', 'total_score',
                  'difficulty', 'time_limit')
        #  same as '__all__' but listed them for readability
        read_only_fields = ('total_score', 'total_questions')


class QuestionSerializer(serializers.ModelSerializer):
    """Serializer for question model data."""
    class Meta:
        model = Question
        fields = ('id', 'quiz', 'text', 'question_type', 'points')
        read_only_fields = ('quiz',)


class AnswerSerializer(serializers.ModelSerializer):
    """Serializer for answer model data."""
    is_correct = serializers.BooleanField(read_only=True)  # Don't expose correct answer in API response

    class Meta:
        model = Answer
        fields = ('id', 'question', 'text', 'is_correct')

# Path: quiz_api/quiz_app/serializers.py