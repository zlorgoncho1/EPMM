from rest_framework import serializers
from eleves.models import *
from classes.models import *
from professeurs.models import *
from paiements.models import *
from pprint import pprint


class NiveauSerializer(serializers.ModelSerializer):
    class Meta:
        model = Niveau
        fields = ['niveau']

class IndiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Indice
        fields = ['indice']

class SerieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Serie
        fields = ['serie']

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
    niveau = NiveauSerializer()
    serie = SerieSerializer()
    indice = IndiceSerializer()
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
        fields = ['niveau', 'serie', 'indice']
        depth = 1

class AnneeClasseSerializer(serializers.ModelSerializer):
    annee = AnneeScolaireJrSerializer()
    classe = ClassesSerializer()
    class Meta:
        model = AnneeClasse
        fields = ['classe', 'annee']
        depth = 2

class TuteurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tuteur
        fields = '__all__'
        depth  = 1

    def update_tuteur(instance, validated_data):
        instance.nom = validated_data.get('nom', instance.nom)
        instance.prenom = validated_data.get('prenom', instance.prenom)
        instance.adresse = validated_data.get('adresse', instance.adresse)
        instance.telephone = validated_data.get('telephone', instance.telephone)
        instance.parent = validated_data.get('parent', instance.parent)
        return instance


""" Eleves """

class ElevesSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Eleve
        fields = ['id', 'prenom', 'nom', 'dateNaissance', 'lieuNaissance', 'adresse', 'telephone']

    def update(self, instance, validated_data):
        instance.nom = validated_data.get('nom', instance.nom)
        instance.prenom = validated_data.get('prenom', instance.prenom)
        instance.dateNaissance = validated_data.get('dateNaissance', instance.dateNaissance)
        instance.lieuNaissance = validated_data.get('lieuNaissance', instance.lieuNaissance)
        instance.adresse = validated_data.get('adresse', instance.adresse)
        instance.telephone = validated_data.get('telephone', instance.telephone)
        instance.classes.set(validated_data['classes'])
        return instance


class EleveSerializer(serializers.ModelSerializer):

    # Sérialisation des Foreign Key ou des Many-To-Many fields
    classes = AnneeClasseSerializer(many=True)
    parent = TuteurSerializer()

    class Meta:
        model = Eleve
        fields = ['nom', 'prenom', 'dateNaissance', 'lieuNaissance', 'adresse', 'parent', 'telephone', 'classes']
        depth = 1

    def create(self, validated_data):

        # Création de l'objet parent
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

        # Création de l'attribut classes ( Relation many to many )
        classes = []
        for anneeClasse in validated_data['classes']:
            
            # Récupération de la classe
            classe = anneeClasse['classe']
            niveau = Niveau.objects.filter(niveau=classe['niveau']['niveau'])
            try:
                serie = Serie.objects.filter(serie=classe['serie']['serie'])
            except KeyError:
                serie = [None]
            try:
                indice = Indice.objects.filter(indice=classe['indice']['indice'])
            except KeyError:
                indice = [None]

            if list(niveau) == []:
                return None
            else:
                try:
                    classe = [classe for classe in Classe.objects.filter(indice=indice[0], serie=serie[0], niveau=niveau[0])]
                except:
                    if list(indice) == []:
                        classe = [classe for classe in Classe.objects.filter(indice=None, serie=serie[0], niveau=niveau[0])]
                    if list(serie) == []:
                        classe = [classe for classe in Classe.objects.filter(indice=indice[0], serie=None, niveau=niveau[0])]
                    if list(indice) == [0] and list(serie) == [0]:
                        classe = [classe for classe in Classe.objects.filter(indice=None, serie=None, niveau=niveau[0])]
                    classe = classe[0]

            # Récupération de l'année scolaire
            annee = anneeClasse['annee']
            annee1 = [annee for annee in AnneeScolaire.objects.filter(anneeDebut=annee['anneeDebut'])]
            annee2 = [annee for annee in AnneeScolaire.objects.filter(anneeFin=annee['anneeFin'])]
            if list(annee1) == [] or list(annee2) == []:
                return None
            else:
                if annee1==annee2[0]:
                    annee = annee1
                else:
                    return None

            # Récupération de AnneeClasse
            anneeClasse = [anneeClasse for anneeClasse in AnneeClasse.objects.filter(annee=annee, classe=classe)]
            if list(anneeClasse) == []:
                return None
            else:
                anneeClasse = anneeClasse[0]

            classes.append(anneeClasse)

        # Création de l'objet élève
        try:
            if len(validated_data) == 6:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
            elif len(validated_data) == 7:
                try:
                    eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, adresse=validated_data['adresse'])
                except:
                    eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, telephone=validated_data['telephone'])
            elif len(validated_data) == 8:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent, adresse=validated_data['adresse'], telephone=validated_data['telephone'])
            else:
                eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
        except:
            eleve = Eleve(nom=validated_data['nom'], prenom=validated_data['prenom'], dateNaissance=validated_data['dateNaissance'], lieuNaissance=validated_data['lieuNaissance'], parent=parent)
        eleve.save()
        eleve.classes.set(classes)
        return eleve

    def update(self, instance, validated_data):
        instance.nom = validated_data.get('nom', instance.nom)
        instance.prenom = validated_data.get('prenom', instance.prenom)
        instance.dateNaissance = validated_data.get('dateNaissance', instance.dateNaissance)
        instance.lieuNaissance = validated_data.get('lieuNaissance', instance.lieuNaissance)
        instance.adresse = validated_data.get('adresse', instance.adresse)
        instance.parent = TuteurSerializer.update_tuteur(instance=instance.parent, validated_data = validated_data['parent'])
        instance.telephone = validated_data.get('telephone', instance.telephone)
        return instance

""" Eleves"""