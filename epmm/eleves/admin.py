from django.contrib import admin
from .models import *

admin.site.site_header = 'EPMM Administration'
admin.site.site_title = 'EPMM Administration'
admin.site.index_title = 'EPMM Administration'


@admin.register(Eleve)
class EleveAdmin(admin.ModelAdmin):
	list_display = ('nom', 'prenom', 'dateNaissance', 'lieuNaissance', 'parent', 'adresse', 'telephone')
	list_filter = ('nom',)
	search_fields = ('nom', 'prenom', 'lieuNaissance', 'parent__prenom', 'adresse', 'telephone')

@admin.register(EleveClasse)
class EleveClasseAdmin(admin.ModelAdmin):
	list_display = ('eleve', 'classe')
	list_filter = ('classe',)
	search_fields = ('eleve__prenom', 'eleve__nom')

@admin.register(Tuteur)
class TuteurAdmin(admin.ModelAdmin):
	list_display = ('nom', 'prenom', 'adresse', 'telephone', 'parent')
	search_fields = ('nom', 'prenom')
	list_filter = ('parent',)