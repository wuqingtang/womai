# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-10 13:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('pwd', models.CharField(max_length=20)),
                ('emph', models.CharField(max_length=50)),
                ('phonenum', models.PositiveIntegerField()),
                ('token', models.CharField(max_length=255)),
            ],
        ),
    ]
