from django.urls import path
from main.register.auth import *

urlpatterns = [
    path('signup', Signup.as_view()),
    path('login', Login.as_view())
]