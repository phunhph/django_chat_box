# Generated by Django 4.2.6 on 2023-12-15 09:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Chat', '0002_rename_chat_chat_box'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chat_box',
            name='statuts',
        ),
        migrations.AddField(
            model_name='chat_box',
            name='status',
            field=models.IntegerField(default=0),
        ),
    ]