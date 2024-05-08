from django.urls import path, include
from rest_framework.routers import DefaultRouter

from .views import UserRegistrationViewSet, LoginView, QuizViewSet, TakeQuizView, logout_view

# Create a router and register our viewsets with it.
router = DefaultRouter()
router.register(r'quizzes', QuizViewSet, basename='quiz')

urlpatterns = [
    # Authentication
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', logout_view, name='logout'),

    # User Registration
    path('users/', UserRegistrationViewSet.as_view({'post': 'create'}), name='register'),  # Only the 'post' method for registration

    # Quiz Endpoints
    path('', include(router.urls)),
    path('quizzes/<int:pk>/take/', TakeQuizView.as_view(), name='take-quiz'),
    path('quizzes/<int:pk>/submit/', TakeQuizView.as_view(), name='submit-quiz'),  # Use POST for submitting quiz
]
