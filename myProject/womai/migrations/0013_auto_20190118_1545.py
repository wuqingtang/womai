# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-18 15:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('womai', '0012_order_ordergoods'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='status',
            field=models.IntegerField(default=0),
        ),
    ]
