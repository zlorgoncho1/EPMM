from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import action
from .serializers import *
from eleves.models import *
from classes.models import *
from professeurs.models import *


class AnneeScolaireViewSet(viewsets.ModelViewSet):
	queryset = AnneeScolaire.objects.all()
	serializer_class = AnneeScolaireSerializer

class EleveViewSet(viewsets.ModelViewSet):
	queryset = Eleve.objects.all()
	serializer_class = EleveSerializer

class ClasseViewSet(viewsets.ModelViewSet):
	queryset = Classe.objects.all()
	serializer_class = ClasseSerializer

class ProfesseurViewSet(viewsets.ModelViewSet):
	queryset = Professeur.objects.all()
	serializer_class = ProfesseurSerializer

class PaiementViewSet(viewsets.ModelViewSet):
	queryset = Paiement.objects.all()
	serializer_class = PaiementSerializer
