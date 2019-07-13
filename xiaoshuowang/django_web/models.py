from django.db import models

# Create your models here.
class Add(models.Model):
    username = models.CharField(max_length=30)
    bookname = models.CharField(max_length=30)
    text = models.CharField(max_length=5000)