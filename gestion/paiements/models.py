from django.db import models
from eleves.models import EleveClasse


class TypeDePaiement(models.Model):
	libelle = models.CharField(max_length=30)

	def __str__(self):
		return str(self.libelle)


class Paiement(models.Model):
	eleve = models.ForeignKey(EleveClasse, on_delete=models.CASCADE)
	typeDePaiement = models.ForeignKey(TypeDePaiement, on_delete=models.CASCADE)
	montant = models.IntegerField()
	dateDePaiement = models.DateField(auto_now=True)
	numero = models.IntegerField(null=True, blank=True)
	mois = models.CharField(max_length=12, null=True, blank=True)

	def __str__(self):
		return str(self.typeDePaiement) + ' | ' + str(self.eleve) + ' | ' + str(self.montant) + ' | ' + str(self.dateDePaiement)
