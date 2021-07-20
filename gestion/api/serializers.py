from rest_framework import serializers
from eleves.models import *
from classes.models import *
from professeurs.models import *
from paiements.models import *


class EleveSerializer(serializers.ModelSerializer):
    class Meta:
        model = Eleve
        fields = '__all__'
        depth = 1

class ClasseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classe
        fields = '__all__'
        depth = 1

class AnneeScolaireSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnneeScolaire
        fields = '__all__'
        depth = 1

class ProfesseurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Professeur
        fields = '__all__'
        depth = 1

class PaiementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Paiement
        fields = '__all__'
        depth = 1
