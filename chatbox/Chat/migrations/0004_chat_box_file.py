# Generated by Django 4.2.6 on 2023-12-16 15:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Chat', '0003_remove_chat_box_statuts_chat_box_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='chat_box',
            name='file',
            field=models.FileField(blank=True, null=True, upload_to='file'),
        ),
    ]
