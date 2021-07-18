from django.db import models
from eleves.models import Personne, AnneeScolaire, Classe


class Professeur(Personne):
	salaire = models.IntegerField()
	matiere = models.CharField(max_length=30)


class ProfesseurClasse(models.Model):
	professeur = models.ForeignKey(Professeur, on_delete=models.CASCADE)
	classe = models.ForeignKey(Classe, on_delete=models.CASCADE)
	anneeScolaire = models.ForeignKey(AnneeScolaire, on_delete=models.CASCADE)

	def __str__(self):
		return str(self.professeur) + ' : ' + str(self.professeur.matiere) + ' | ' + str(self.classe) + ' | ' + str(self.anneeScolaire)
