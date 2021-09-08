from django.contrib import admin
from .models import *

admin.site.site_header = 'EPMM Administration'
admin.site.site_title = 'EPMM Administration'
admin.site.index_title = 'EPMM Administration'

admin.site.register(Eleve)
admin.site.register(Tuteur)
admin.site.register(EleveClasse)
