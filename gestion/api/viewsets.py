from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response

from rest_framework import mixins
from rest_framework import generics

from rest_framework.permissions import IsAuthenticated

from rest_framework import status
from .serializers import *
from eleves.models import *


""" ELEVE """

class EleveList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
	"""Liste l'ensemble des élèves ou ajoute un élève."""

	queryset = Eleve.objects.all()
	serializer_class = ElevesSerializer
	filterset_fields = ['id','nom', 'prenom']
	search_fields = ['nom', 'prenom', 'lieuNaissance']

	def get(self, request):
		return self.list(request)

	def post(self, request, format=None):
		serializer = EleveSerializer(data=request.data)
		if serializer.is_valid():
			try:
				serializer.save()
			except:
				return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class EleveDetail(APIView):
	"""Détailler, Mettre à jour ou supprimer les informations d'un élève"""
	permission_classes = [IsAuthenticated]

	def get_object(self, pk):
		try:
			return Eleve.objects.get(pk=pk)
		except Eleve.DoesNotExist:
			raise Http404

	def get(self, request, pk, format=None):
		eleve = self.get_object(pk)
		serializer = EleveSerializer(eleve)
		return Response(serializer.data)

	def put(self, request, pk, format=None):
		eleve = self.get_object(pk)
		serializer = EleveSerializer(eleve, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def patch(self, request, pk, format=None):
		eleve = self.get_object(pk)
		serializer = EleveSerializer(eleve, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def delete(self, request, pk, format=None):
		eleve = self.get_object(pk)
		eleve.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)

""" ELEVE """



""" CLASSE """

class ClasseList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
	"""Liste l'ensemble des élèves ou ajoute un élève."""

	queryset = Classe.objects.all()
	serializer_class = ClassesSerializer
	filterset_fields = ['niveau','serie', 'indice']
	search_fields = ['niveau', 'serie', 'indice']

	def get(self, request):
		return self.list(request)

	def post(self, request, format=None):
		serializer = ClasseSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ClasseDetail(APIView):
	"""Détailler, Mettre à jour ou supprimer les informations d'un élève"""
	permission_classes = [IsAuthenticated]

	def get_object(self, pk):
		try:
			return Classe.objects.get(pk=pk)
		except Classe.DoesNotExist:
			raise Http404

	def get(self, request, pk, format=None):
		classe = self.get_object(pk)
		serializer = ClasseSerializer(classe)
		return Response(serializer.data)

	def put(self, request, pk, format=None):
		classe = self.get_object(pk)
		serializer = ClasseSerializer(classe, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def patch(self, request, pk, format=None):
		classe = self.get_object(pk)
		serializer = ClasseSerializer(classe, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def delete(self, request, pk, format=None):
		classe = self.get_object(pk)
		classe.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)

""" CLASSE """



""" PAIEMENTS """

class PaiementList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
	"""Liste l'ensemble des élèves ou ajoute un élève."""

	queryset = Paiement.objects.all()
	serializer_class = PaiementsSerializer
	filterset_fields = ['typeDePaiement', 'montant', 'dateDePaiement', 'mois', 'eleve']
	search_fields = ['eleve','typeDePaiement', 'montant', 'dateDePaiement', 'mois']

	def get(self, request):
		return self.list(request)

class PaiementEleveList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
	permission_classes = [IsAuthenticated]
	queryset = Paiement.objects.all()
	serializer_class = PaiementsSerializer
	filterset_fields = ['typeDePaiement', 'montant', 'dateDePaiement', 'mois']
	search_fields = ['typeDePaiement', 'montant', 'dateDePaiement', 'mois']

	def get_object(self, pk):
		try:
			eleve = Eleve.objects.get(pk=pk)
		except Eleve.DoesNotExist:
			raise Http404
		eleveClasse = EleveClasse.objects.filter(eleve=eleve)
		paiements = []
		for eleve in eleveClasse:
			paiementsQ = Paiement.objects.filter(eleve=eleve)
			for paiement in paiementsQ:
				paiements.append(paiement)
		return paiements


	def get(self, request, pk, format=None):
		paiements = self.get_object(pk)
		serializer = PaiementsSerializer(paiements, many=True)
		return Response(serializer.data)

""" PAIEMENTS """



""" PROFESSEUR """

class ProfesseurList(mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView):
	"""Liste l'ensemble des élèves ou ajoute un élève."""

	queryset = Professeur.objects.all()
	serializer_class = ProfesseursSerializer
	filterset_fields = ['id','nom', 'prenom']
	search_fields = ['nom', 'prenom', 'lieuNaissance']

	def get(self, request):
		return self.list(request)

	def post(self, request, format=None):
		serializer = ProfesseurSerializer(data=request.data)
		if serializer.is_valid():
			try:
				serializer.save()
			except:
				return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProfesseurDetail(APIView):
	"""Détailler, Mettre à jour ou supprimer les informations d'un élève"""
	permission_classes = [IsAuthenticated]

	def get_object(self, pk):
		try:
			return Professeur.objects.get(pk=pk)
		except Professeur.DoesNotExist:
			raise Http404

	def get(self, request, pk, format=None):
		professeur = self.get_object(pk)
		serializer = ProfesseurSerializer(professeur)
		return Response(serializer.data)

	def put(self, request, pk, format=None):
		professeur = self.get_object(pk)
		serializer = ProfesseurSerializer(professeur, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def patch(self, request, pk, format=None):
		professeur = self.get_object(pk)
		serializer = ProfesseurSerializer(professeur, data=request.data, partial=True)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def delete(self, request, pk, format=None):
		professeur = self.get_object(pk)
		professeur.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)

""" PROFESSEUR """