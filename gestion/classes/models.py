from django.db import models


class Niveau(models.Model):
	niveau = models.CharField(max_length=30)

	def __str__(self):
		return str(self.niveau)


class Serie(models.Model):
	serie = models.CharField(max_length=30)

	def __str__(self):
		return str(self.serie)


class Indice(models.Model):
	indice = models.CharField(max_length=30)

	def __str__(self):
		return str(self.indice)


class Classe(models.Model):
	niveau = models.ForeignKey(Niveau, on_delete=models.CASCADE)
	serie = models.ForeignKey(Serie, on_delete=models.CASCADE, null=True, blank=True)
	indice = models.ForeignKey(Indice, on_delete=models.CASCADE, null=True, blank=True)

	def __str__(self):
		niveau = self.niveau
		serie = self.serie
		if serie is None:
			serie = ""
		indice = self.indice
		if indice is None:
			indice = ""
		return str(niveau) + ' ' + str(serie) + ' ' + str(indice)
