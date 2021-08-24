from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from . import viewsets


urlpatterns = [
    path('classes/', viewsets.ClasseList.as_view()),
    path('classes/<int:pk>/', viewsets.ClasseDetail.as_view()),

    path('eleves/', viewsets.EleveList.as_view()),
    path('eleves/<int:pk>/', viewsets.EleveDetail.as_view()),

    path('paiements/', viewsets.PaiementList.as_view()),
    path('eleves/<int:pk>/paiements', viewsets.PaiementEleveList.as_view()),

    path('professeurs/', viewsets.ProfesseurList.as_view()),
    path('professeurs/<int:pk>/', viewsets.ProfesseurDetail.as_view()),
]


urlpatterns = format_suffix_patterns(urlpatterns)