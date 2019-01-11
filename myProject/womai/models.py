from django.db import models

class User(models.Model):
    name = models.CharField(max_length=30)
    pwd = models.CharField(max_length=255)
    emph = models.CharField(max_length=50)
    phonenum = models.PositiveIntegerField()
    token = models.CharField(max_length=255)

    def __str__(self):
        return self.name



class Banner(models.Model):
    bid = models.IntegerField()
    headImg = models.CharField(max_length=100)
    bgcolor = models.CharField(max_length=20)
    opicaty = models.IntegerField()

    def __str__(self):
        return str(self.bid)


