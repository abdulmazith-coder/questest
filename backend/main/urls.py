from django.urls import path
from main.register.auth import *
from main.register.refreash_token import *
from main.ai_automation.generate import Generate
from main.ai_automation.getinstitutiondata import GetInstitutionData

urlpatterns = [
    path('signup', Signup.as_view()),
    path('login', Login.as_view()),
    path('questest-ai',Generate.as_view()),
    path('refresh-token',RefreshToken.as_view()),
    path('getinstitutiondata/<str:pk>',GetInstitutionData.as_view()),
    
]