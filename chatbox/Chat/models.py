from django.db import models

class Chat_Box(models.Model):
    id_in = models.IntegerField()
    id_out = models.IntegerField()
    mes = models.CharField(max_length=100)
    time = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(default=0)
    url_file = models.CharField(max_length=200, null=True)
    def __str__(self):
        return f"{self.id_in} to {self.id_out}: {self.mes}"

class Chat_Group(models.Model):
    name_group = models.CharField(max_length=50)
    url_image = models.CharField(max_length=200, null=True)
    def __str__(self):
        return f"{self.name_group}"

class detail_group(models.Model):
    id_group = models.IntegerField()
    id_user = models.IntegerField()
    
class Group_Chat(models.Model):
    id_user = models.IntegerField()
    id_group = models.IntegerField()
    mes = models.CharField(max_length=100)
    time = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(default=0)
     
    url_file = models.CharField(max_length=200, null=True)