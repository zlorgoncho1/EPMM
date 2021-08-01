from django.db import models
from classes.models import AnneeClasse, Classe


class Professeur(models.Model):
	nom = models.CharField(max_length=10, default='None')
	prenom = models.CharField(max_length=30,default='None')
	adresse = models.CharField(blank=True, null=True, max_length=30)
	telephone = models.IntegerField(blank=True, null=True)
	salaire = models.IntegerField()
	matiere = models.CharField(max_length=30)
	classes = models.ManyToManyField(AnneeClasse, related_name='professeurs', blank=True, default='None')

	def __str__(self):
		classes = self.classes.all()
		return str(self.prenom) + ' ' + str(self.nom) + ' ' + str(classes)

