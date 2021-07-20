from django.db import models
from classes.models import Classe, AnneeScolaire, AnneeClasse


class Personne(models.Model):
	nom = models.CharField(max_length=10)
	prenom = models.CharField(max_length=30)
	adresse = models.CharField(blank=True, null=True, max_length=30)
	telephone = models.IntegerField(blank=True, null=True)

	def __str__(self):
		return str(self.prenom) + ' ' + str(self.nom)


class Tuteur(Personne):
	parent = models.BooleanField()


class Eleve(Personne):
	dateNaissance = models.DateField()
	lieuNaissance = models.CharField(max_length=30)
	parent = models.ForeignKey(Tuteur, on_delete=models.CASCADE)
	classes = models.ManyToManyField(AnneeClasse, related_name='eleves', blank=True)


class EleveClasse(models.Model):
	eleve = models.ForeignKey(Eleve, on_delete=models.CASCADE)
	classe = models.ForeignKey(AnneeClasse, on_delete=models.CASCADE)

	def __str__(self):
		return str(self.eleve) + ' | ' + str(self.classe)
