from rest_framework import serializers
from eleves.models import *
from classes.models import *
from professeurs.models import *
from paiements.models import *
from pprint import pprint


""" Annee Scolaire """

class AnneeScolairesSerializer(serializers.ModelSerializer):
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

""" Annee Scolaire """


""" Classes """

# Niveau
class NiveauSerializer(serializers.ModelSerializer):

    class Meta:
        model = Niveau
        fields = ['niveau']

    def update_niveau(instance, validated_data):
        instance.niveau = validated_data.get('niveau', instance.niveau)
        instance.save()
        return instance

# Indice
class IndiceSerializer(serializers.ModelSerializer):

    class Meta:
        model = Indice
        fields = ['indice']

    def update_indice(instance, validated_data):
        instance.indice = validated_data.get('indice', instance.indice)
        instance.save()
        return instance

# Serie
class SerieSerializer(serializers.ModelSerializer):

    class Meta:
        model = Serie
        fields = ['serie']

    def update_serie(instance, validated_data):
        instance.serie = validated_data.get('serie', instance.serie)
        instance.save()
        return instance

# Classe List
class ClassesSerializer(serializers.ModelSerializer):

    niveau = NiveauSerializer()
    serie = SerieSerializer()
    indice = IndiceSerializer()

    class Meta:
        model = Classe
        fields = '__all__'
        depth = 1

# Classe Details
class ClasseSerializer(serializers.ModelSerializer):

    niveau = NiveauSerializer()
    serie = SerieSerializer()
    indice = IndiceSerializer()

    class Meta:
        model = Classe
        fields = ['niveau', 'serie', 'indice', 'annees']
        depth = 1

    def create(self, validated_data):
        niveau = Niveau.objects.filter(niveau=validated_data['niveau']['niveau'])
        try:
            serie = Serie.objects.filter(serie=validated_data['serie']['serie'])
        except KeyError:
            serie = [None]
        try:
            indice = Indice.objects.filter(indice=validated_data['indice']['indice'])
        except KeyError:
            indice = [None]

        if list(niveau) == []:
            return None
        else:
            try:
                classe = [classe for classe in Classe.objects.filter(indice=indice[0], serie=serie[0], niveau=niveau[0])]
                classe = classe[0]
            except:
                classe = Classe(niveau=niveau[0], indice=indice[0], serie=serie[0])
                classe.save()
        return classe

    def update(self, instance, validated_data):
        try:
            instance.niveau = NiveauSerializer.update_niveau(instance=instance.niveau, validated_data = validated_data['niveau'])
        except KeyError:
            pass
        try:
            instance.serie = SerieSerializer.update_serie(instance=instance.serie, validated_data = validated_data['serie'])
        except KeyError:
            pass
        try:
            instance.indice = IndiceSerializer.update_indice(instance=instance.indice, validated_data = validated_data['indice'])
        except KeyError:
            pass
        return instance

""" Classes """


""" AnneeClasse """

# Table Annee-Classe S??rialiseur
class AnneeClasseSerializer(serializers.ModelSerializer):

    annee = AnneeScolaireJrSerializer()
    classe = ClassesSerializer()

    class Meta:
        model = AnneeClasse
        fields = ['classe', 'annee']
        depth = 2

class AnneeClasse2Serializer(serializers.ModelSerializer):

    classe = ClassesSerializer()

    class Meta:
        model = AnneeClasse
        fields = ['classe']
        depth = 2

""" AnneeClasse """


""" Eleves """

# Tuteur 
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
        instance.save()
        return instance

# Eleve List
class ElevesSerializer(serializers.ModelSerializer):

    class Meta:
        model = Eleve
        fields = ['id', 'prenom', 'nom', 'dateNaissance', 'lieuNaissance', 'adresse', 'telephone']

# Eleve List for other
class Eleves2Serializer(serializers.ModelSerializer):

    class Meta:
        model = Eleve
        fields = ['id', 'prenom', 'nom']

# Eleve Details
class EleveSerializer(serializers.ModelSerializer):

    # S??rialisation des Foreign Key ou des Many-To-Many fields
    classes = AnneeClasseSerializer(many=True)
    parent = TuteurSerializer()

    class Meta:
        model = Eleve
        fields = ['nom', 'prenom', 'dateNaissance', 'lieuNaissance', 'adresse', 'parent', 'telephone', 'classes']
        depth = 1

    def create(self, validated_data):

        # Cr??ation de l'objet parent
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

        # Cr??ation de l'attribut classes ( Relation many to many )
        classes = []
        for anneeClasse in validated_data['classes']:
            
            # R??cup??ration de la classe
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

            # R??cup??ration de l'ann??e scolaire
            annee = anneeClasse['annee']
            annee1 = [annee for annee in AnneeScolaire.objects.filter(anneeDebut=annee['anneeDebut'])]
            annee2 = [annee for annee in AnneeScolaire.objects.filter(anneeFin=annee['anneeFin'])]
            if list(annee1) == [] or list(annee2) == []:
                return None
            else:
                if annee1[0]==annee2[0]:
                    annee = annee1[0]
                else:
                    return None

            # R??cup??ration de AnneeClasse
            anneeClasse = [anneeClasse for anneeClasse in AnneeClasse.objects.filter(annee=annee, classe=classe)]
            if list(anneeClasse) == []:
                return None
            else:
                anneeClasse = anneeClasse[0]

            classes.append(anneeClasse)

        # Cr??ation de l'objet ??l??ve
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
        try:
            instance.parent = TuteurSerializer.update_tuteur(instance=instance.parent, validated_data = validated_data['parent'])
        except KeyError:
            pass
        try:
            classes = []
            for anneeClasse in validated_data['classes']:
                
                # R??cup??ration de la classe
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

                # R??cup??ration de l'ann??e scolaire
                annee = anneeClasse['annee']
                annee1 = [annee for annee in AnneeScolaire.objects.filter(anneeDebut=annee['anneeDebut'])]
                annee2 = [annee for annee in AnneeScolaire.objects.filter(anneeFin=annee['anneeFin'])]
                if list(annee1) == [] or list(annee2) == []:
                    return None
                else:
                    if annee1[0]==annee2[0]:
                        annee = annee1[0]
                    else:
                        return None

                # R??cup??ration de AnneeClasse
                anneeClasse = [anneeClasse for anneeClasse in AnneeClasse.objects.filter(annee=annee, classe=classe)]
                if list(anneeClasse) == []:
                    return None
                else:
                    anneeClasse = anneeClasse[0]

                classes.append(anneeClasse)
            instance.classes.set(classes)
        except KeyError:
            pass
        instance.telephone = validated_data.get('telephone', instance.telephone)
        instance.save()
        return instance

# Eleve Classe
class EleveClasseSerializer(serializers.ModelSerializer):

    eleve = Eleves2Serializer()
    classe = AnneeClasse2Serializer()

    class Meta:
        model = EleveClasse
        fields = ['eleve', 'classe']
        depth = 2

""" Eleves """


""" Paiements """
# Type de Paiements
class TypeDePaiementSerializer(serializers.ModelSerializer):

    class Meta:
        model = TypeDePaiement
        fields = ['libelle']

    def update_typeDePaiement(instance, validated_data):
        instance.libelle = validated_data.get('libelle', instance.libelle)
        instance.save()
        return instance

# Paiements list
class PaiementsSerializer(serializers.ModelSerializer):

    typeDePaiement = TypeDePaiementSerializer()
    eleve = EleveClasseSerializer()

    class Meta:
        model = Paiement
        fields = ['id', 'eleve','typeDePaiement', 'dateDePaiement']
        depth = 2

# Paiement Details
class PaiementSerializer(serializers.ModelSerializer):

    # S??rialisation des Foreign Key ou des Many-To-Many fields
    typeDePaiement = TypeDePaiementSerializer()
    eleve = EleveClasseSerializer()

    class Meta:
        model = Paiement
        fields = ['eleve','typeDePaiement', 'mois', 'dateDePaiement', 'montant', 'numero']
        depth = 1
"""
    def create(self, validated_data):

        # R??cup??ration de l'??l??ve
        pprint (validated_data)
        return 0
"""

""" Paiements """


# Professeur List
class ProfesseursSerializer(serializers.ModelSerializer):

    class Meta:
        model = Professeur
        fields = ['id', 'prenom', 'nom', 'matiere']


# Professeur Details
class ProfesseurSerializer(serializers.ModelSerializer):

    # S??rialisation des Foreign Key ou des Many-To-Many fields
    classes = AnneeClasseSerializer(many=True)

    class Meta:
        model = Professeur
        fields = ['nom', 'prenom', 'matiere', 'adresse', 'telephone', 'salaire', 'classes']
        depth = 1

    def create(self, validated_data):
        
        # Cr??ation de l'attribut classes ( Relation many to many )
        classes = []
        for anneeClasse in validated_data['classes']:
            
            # R??cup??ration de la classe
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

            # R??cup??ration de l'ann??e scolaire
            annee = anneeClasse['annee']
            annee1 = [annee for annee in AnneeScolaire.objects.filter(anneeDebut=annee['anneeDebut'])]
            annee2 = [annee for annee in AnneeScolaire.objects.filter(anneeFin=annee['anneeFin'])]
            if list(annee1) == [] or list(annee2) == []:
                return None
            else:
                if annee1[0]==annee2[0]:
                    annee = annee1[0]
                else:
                    return None

            # R??cup??ration de AnneeClasse
            anneeClasse = [anneeClasse for anneeClasse in AnneeClasse.objects.filter(annee=annee, classe=classe)]
            if list(anneeClasse) == []:
                return None
            else:
                anneeClasse = anneeClasse[0]

            classes.append(anneeClasse)

        # Cr??ation de l'objet ??l??ve
        try:
            if len(validated_data) == 4:
                professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'])
            elif len(validated_data) == 5:
                try:
                    professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'], adresse=validated_data['adresse'])
                except:
                    professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'], telephone=validated_data['telephone'])
            elif len(validated_data) == 6:
                professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'], adresse=validated_data['adresse'], telephone=validated_data['telephone'])
            else:
                professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'])
        except:
            professeur = Professeur(nom=validated_data['nom'], prenom=validated_data['prenom'], matiere=validated_data['matiere'], salaire=validated_data['salaire'])
        professeur.save()
        professeur.classes.set(classes)
        return professeur

    def update(self, instance, validated_data):
        instance.nom = validated_data.get('nom', instance.nom)
        instance.prenom = validated_data.get('prenom', instance.prenom)
        instance.matiere = validated_data.get('matiere', instance.matiere)
        instance.salaire = validated_data.get('salaire', instance.salaire)
        instance.adresse = validated_data.get('adresse', instance.adresse)
        try:
            classes = []
            for anneeClasse in validated_data['classes']:
                
                # R??cup??ration de la classe
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

                # R??cup??ration de l'ann??e scolaire
                annee = anneeClasse['annee']
                annee1 = [annee for annee in AnneeScolaire.objects.filter(anneeDebut=annee['anneeDebut'])]
                annee2 = [annee for annee in AnneeScolaire.objects.filter(anneeFin=annee['anneeFin'])]
                if list(annee1) == [] or list(annee2) == []:
                    return None
                else:
                    if annee1[0]==annee2[0]:
                        annee = annee1[0]
                    else:
                        return None

                # R??cup??ration de AnneeClasse
                anneeClasse = [anneeClasse for anneeClasse in AnneeClasse.objects.filter(annee=annee, classe=classe)]
                if list(anneeClasse) == []:
                    return None
                else:
                    anneeClasse = anneeClasse[0]

                classes.append(anneeClasse)
            instance.classes.set(classes)
        except KeyError:
            pass
        instance.telephone = validated_data.get('telephone', instance.telephone)
        instance.save()
        return instance
