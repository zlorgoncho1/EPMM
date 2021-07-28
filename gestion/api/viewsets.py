from django.http import Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import *
from eleves.models import *


""" ELEVE """
class EleveList(APIView):
	"""Liste l'ensemble des élèves ou ajoute un élève."""
	filter_fields = ['nom']

	def get(self, request, format=None):
		eleves = Eleve.objects.all()
		serializer = ElevesSerializer(eleves, many=True)
		return Response(serializer.data)

	def post(self, request, format=None):
		serializer = EleveSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class EleveDetail(APIView):
	"""Détailler, Mettre à jour ou supprimer les informations d'un élève"""
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
		serializer = ElevesSerializer(eleve, data=request.data)
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

	def delete(self, request, pk, format=None):
		eleve = self.get_object(pk)
		eleve.delete()
		return Response(status=status.HTTP_204_NO_CONTENT)
""" ELEVE """