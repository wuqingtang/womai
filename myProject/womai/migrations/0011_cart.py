# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-16 08:15
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('womai', '0010_auto_20190115_1004'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.PositiveIntegerField()),
                ('isselect', models.BooleanField(default=True)),
                ('goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='womai.Shoplist')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='womai.User')),
            ],
        ),
    ]
