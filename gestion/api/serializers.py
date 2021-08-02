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
        if len(parent) == 3:
            parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'])
        elif len(parent) == 4:
            try:
                parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'], adresse=parent['adresse'])
            except:
                parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'], telephone=parent['telephone'])
        elif len(parent) == 5:
            try:
                parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'], telephone=parent['telephone'], adresse=parent['adresse'])
            except Exception as e:
                raise e
        else:
            parent = Tuteur(nom=parent['nom'], prenom=parent['prenom'], parent=parent['parent'])
        parent.save()
        if len(validated_data) == 6:
            eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
        elif len(validated_data) == 7:
            try:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, adresse=validated_data['adresse'])
            except:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, telephone=validated_data['telephone'])
        elif len(validated_data) == 8:
            try:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, adresse=validated_data['adresse'], telephone=validated_data['telephone'])
            except Exception as e:
                raise e
        else:
            eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
        eleve.save()
        return eleve
    
    def update(self, instance, validated_data):
        instance.nom = validated_data.get('nom', instance.nom)
        instance.prenom = validated_data.get('prenom', instance.prenom)
        instance.dateNaissance = validated_data.get('dateNaissance', instance.dateNaissance)
        instance.lieuNaissance = validated_data.get('lieuNaissance', instance.lieuNaissance)
        instance.adresse = validated_data.get('adresse', instance.adresse)
        instance.telephone = validated_data.get('telephone', instance.telephone)
        return instance

""" Eleves"""