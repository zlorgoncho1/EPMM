from django.contrib import admin
from .models import *

admin.site.register(TypeDePaiement)

@admin.register(Paiement)
class PaiementAdmin(admin.ModelAdmin):
	list_display = ('eleve', 'typeDePaiement', 'montant', 'dateDePaiement', 'mois', 'numero')
	list_filter = ('typeDePaiement', 'dateDePaiement', 'mois', 'numero', 'eleve__classe__classe__niveau')
	search_fields = ('eleve__eleve__prenom', 'eleve__eleve__nom')