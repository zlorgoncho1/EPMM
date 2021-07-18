from django.db import models
from classes.models import Classe


class Personne(models.Model):
	nom = models.CharField(max_length=10)
	prenom = models.CharField(max_length=30)
	adresse = models.CharField(blank=True, null=True, max_length=30)
	telephone = models.IntegerField(blank=True, null=True)

	def __str__(self):
		return str(self.prenom) + ' ' + str(self.nom)


class Tuteur(Personne):
	pass


class Eleve(Personne):
	dateNaissance = models.DateField()
	lieuNaissance = models.CharField(max_length=30)
	parent = models.ForeignKey(Tuteur, on_delete=models.CASCADE)


class AnneeScolaire(models.Model):
	anneeDebut = models.IntegerField()
	anneeFin = models.IntegerField()

	def __str__(self):
		return str(self.anneeDebut) + '/' + str(self.anneeFin)


class EleveClasse(models.Model):
	eleve = models.ForeignKey(Eleve, on_delete=models.CASCADE)
	classe = models.ForeignKey(Classe, on_delete=models.CASCADE)
	anneeScolaire = models.ForeignKey(AnneeScolaire, on_delete=models.CASCADE)

	def __str__(self):
		return str(self.eleve) + ' | ' + str(self.classe) + ' | ' + str(self.anneeScolaire)
