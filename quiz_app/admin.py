from django.contrib import admin
from .models import Quiz, Question, Answer, QuizUser

class QuizAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'difficulty', 'author',)
    list_filter = ('difficulty', 'author')
    search_fields = ('title', 'description')

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('quiz', 'text', 'question_type', 'created_at')
    list_filter = ('quiz', 'question_type')
    search_fields = ('text',)

class AnswerAdmin(admin.ModelAdmin):
    """ Define the display options for Answer model"""
    list_display = ('question', 'text', 'is_correct')
    list_filter = ('question', 'is_correct')
    search_fields = ('text',)

class QuizUserAdmin(admin.ModelAdmin):
    """ Define the display options for QuizUser model"""
    list_display = ('username', 'is_superuser', 'total_score', 'highest_score')
    search_fields = ('username', 'total_score', 'highest_score')

admin.site.register(QuizUser, QuizUserAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Answer, AnswerAdmin)
admin.site.register(Quiz, QuizAdmin)
