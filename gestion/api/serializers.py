from rest_framework import serializers
from eleves.models import *
from classes.models import *
from professeurs.models import *
from paiements.models import *


class AnneeScolairesSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = AnneeScolaire
        fields = '__all__'

class AnneeScolaireSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnneeScolaire
        fields = '__all__'
        depth = 1

class AnneeScolaireJrSerializer(serializers.ModelSerializer):
    class Meta:
        model = AnneeScolaire
        fields = ['anneeDebut', 'anneeFin']
        depth = 1

class ClassesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classe
        fields = '__all__'
        depth = 1

class ClassesLinkedSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Classe
        fields = '__all__'
        depth = 1

class ClasseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classe
        fields = '__all__'
        depth = 1

class AnneeClasseSerializer(serializers.ModelSerializer):
    annee = AnneeScolaireJrSerializer()
    class Meta:
        model = AnneeClasse
        fields = ['classe', 'annee']
        depth = 2

class TuteurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tuteur
        fields = '__all__'
        depth  = 1


""" Eleves"""

class ElevesSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Eleve
        fields = ['id', 'prenom', 'nom', 'dateNaissance', 'lieuNaissance']


class EleveSerializer(serializers.ModelSerializer):

    classes = AnneeClasseSerializer(many=True)
    parent = TuteurSerializer()
    class Meta:
        model = Eleve
        fields = ['nom', 'prenom', 'dateNaissance', 'lieuNaissance', 'adresse', 'parent', 'telephone', 'classes']
        depth = 1

    def create(self, validated_data):
        parent = validated_data['parent']
        parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'])
        parent.save()
        eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
        eleve.save()
        return eleve

""" Eleves"""