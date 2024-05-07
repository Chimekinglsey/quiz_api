from django.db import models
from django.contrib.auth.models import AbstractUser, User, Group, Permission


class QuizUser(AbstractUser):
    """Custom user model to store user-specific data related to quizzes."""
    total_score = models.PositiveIntegerField(default=0, help_text="Total score accumulated across all quizzes.")
    highest_score = models.PositiveIntegerField(default=0, help_text="Track user's highest score in a quiz.")
    total_quizzes_taken = models.PositiveIntegerField(default=0, help_text="Total number of quizzes taken.")
    average_score = models.FloatField(default=0, help_text="Average score across all quizzes taken.")
    groups = models.ManyToManyField(Group, blank=True, help_text="Groups to which the user belongs.")
    user_permissions = models.ManyToManyField(Permission, blank=True, help_text="Specific permissions for the user.")
    is_superuser = models.BooleanField(default=False)


    def __str__(self):
        return self.username


class Quiz(models.Model):
    """Model to store quiz details."""
    title = models.CharField(max_length=255)
    description = models.TextField()
    total_questions = models.PositiveIntegerField(default=0, help_text="Total number of questions in the quiz.")
    total_score = models.PositiveIntegerField(default=100, help_text="Total score for the quiz. 100%\\ by default.")
    difficulty = models.CharField(max_length=20, help_text="Difficulty level of the quiz.")
    time_limit = models.PositiveIntegerField(default=0, help_text="Time limit for completing the quiz (in minutes).")
    max_attempts = models.PositiveIntegerField(default=1, help_text="Maximum number of attempts allowed for the quiz.")
    author = models.ForeignKey(QuizUser, on_delete=models.CASCADE, help_text="User who created the quiz.", related_name='quizzes')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title


class Question(models.Model):
    """Model to store question details."""
    QUESTION_TYPE_CHOICES = [
        ('MCQ', 'Multiple Choice Question'),
        ('TF', 'True/False'),
        ('FIB', 'Fill in the Blanks')
    ]
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, help_text="Quiz to which the question belongs.", related_name='questions')
    text = models.TextField(help_text="Text content of the question.")
    question_type = models.CharField(max_length=20, choices=QUESTION_TYPE_CHOICES, default='MCQ',
                                      help_text="Type of the question.")
    # For Quizes where questions that do no have equal points, we can use this field to assign points to each question
    points = models.PositiveIntegerField(default=1, help_text="Points awarded for answering this question correctly.")
    last_displayed = models.DateTimeField(blank=True, null=True, help_text="Last time the question was displayed.")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.text[:50]


class Answer(models.Model):
    """Model to store answer details."""
    question = models.ForeignKey(Question, on_delete=models.CASCADE, help_text="Question to which the answer belongs.", related_name='answers')
    text = models.TextField(help_text="Text of the answer.")
    is_correct = models.BooleanField(default=False, help_text="Indicates if the answer is correct.")

    def __str__(self):
        return self.text[:50]
    

class UserQuizAttempt(models.Model):
    """Model to store user's attempt details for a quiz."""
    user = models.ForeignKey(QuizUser, on_delete=models.CASCADE, help_text="User who attempted the quiz.", related_name='quiz_attempts')
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, help_text="Quiz attempted by the user.", related_name='user_attempts')
    score = models.PositiveIntegerField(default=0, help_text="Score obtained by the user in the quiz.")
    total_questions = models.PositiveIntegerField(default=0, help_text="Total number of questions in the quiz.")
    completed = models.BooleanField(default=False, help_text="Indicates if the user has completed the quiz.")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.user.username} - {self.quiz.title}"