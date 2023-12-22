from django.db import models

class Login(models.Model):
    email = models.EmailField()
    password = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    url_image = models.CharField(max_length=200, null=True)

    def __str__(self):
        return self.name
