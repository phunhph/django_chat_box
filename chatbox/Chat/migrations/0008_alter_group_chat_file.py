# Generated by Django 4.2.6 on 2023-12-19 07:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Chat', '0007_alter_group_chat_file'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group_chat',
            name='file',
            field=models.FileField(blank=True, null=True, upload_to='file'),
        ),
    ]