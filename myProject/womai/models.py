from django.db import models

class User(models.Model):
    name = models.CharField(max_length=30)
    pwd = models.CharField(max_length=255)
    emph = models.CharField(max_length=50)
    phonenum = models.PositiveIntegerField()
    token = models.CharField(max_length=255)
