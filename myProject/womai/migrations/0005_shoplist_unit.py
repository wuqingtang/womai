# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-14 11:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('womai', '0004_shoplist'),
    ]

    operations = [
        migrations.AddField(
            model_name='shoplist',
            name='unit',
            field=models.CharField(default='tang', max_length=5),
            preserve_default=False,
        ),
    ]