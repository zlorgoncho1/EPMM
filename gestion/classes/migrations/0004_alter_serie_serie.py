# Generated by Django 3.2.5 on 2021-08-08 10:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('classes', '0003_alter_indice_indice'),
    ]

    operations = [
        migrations.AlterField(
            model_name='serie',
            name='serie',
            field=models.CharField(max_length=30, null=True),
        ),
    ]
