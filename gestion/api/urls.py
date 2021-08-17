from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import viewsets


urlpatterns = [
    path('eleves/', viewsets.EleveList.as_view()),
    path('eleves/<int:pk>/', viewsets.EleveDetail.as_view()),

    path('classes/', viewsets.ClasseList.as_view()),
    path('classes/<int:pk>/', viewsets.ClasseDetail.as_view()),
]


urlpatterns = format_suffix_patterns(urlpatterns)