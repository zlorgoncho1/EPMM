# Generated by Django 3.2.5 on 2021-07-25 11:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0002_alter_anneescolaire_classes'),
        ('eleves', '0002_alter_eleve_classes'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eleve',
            name='classes',
            field=models.ManyToManyField(blank=True, related_name='eleves', to='classes.AnneeClasse'),
        ),
    ]