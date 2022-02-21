from django.contrib import admin
from .models import *

admin.site.register(Niveau)
admin.site.register(Indice)
admin.site.register(Serie)

@admin.register(Classe)
class ClasseAdmin(admin.ModelAdmin):
	list_display = ('niveau', 'serie', 'indice')
	list_filter = ('niveau', 'serie', 'indice')

@admin.register(AnneeScolaire)
class AnneeScolaireAdmin(admin.ModelAdmin):
	list_display = ('anneeDebut', 'anneeFin')

@admin.register(AnneeClasse)
class AnneeClasseAdmin(admin.ModelAdmin):
	list_display = ('annee', 'classe')
	list_filter = ('annee', 'classe')