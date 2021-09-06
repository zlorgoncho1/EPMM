from django.contrib import admin
from .models import *

@admin.register(Professeur)
class ProfesseurAdmin(admin.ModelAdmin):
	list_display = ('nom', 'prenom', 'matiere', 'salaire', 'adresse', 'telephone')
	list_filter = ('matiere',)
	search_fields = ('nom', 'prenom', 'matiere')