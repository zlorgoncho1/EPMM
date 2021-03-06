# Generated by Django 3.2.5 on 2021-07-19 18:33

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('classes', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Professeur',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nom', models.CharField(default='None', max_length=10)),
                ('prenom', models.CharField(default='None', max_length=30)),
                ('adresse', models.CharField(blank=True, max_length=30, null=True)),
                ('telephone', models.IntegerField(blank=True, null=True)),
                ('salaire', models.IntegerField()),
                ('matiere', models.CharField(max_length=30)),
                ('classes', models.ManyToManyField(blank=True, default='None', related_name='professeurs', to='classes.AnneeClasse')),
            ],
        ),
    ]
