from gestion.settings import *
import dj_database_url
import os

DEBUG = False
TEMPLATE_DEBUG= False

DATABASES['default'] = dj_database_url.config()

MIDDLEWARE += ['whitenoise.middleware.WhiteNoiseMiddleware']
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

ALLOWED_HOSTS = ['epmm.herokuapp.com']