# Generated by Django 4.2.6 on 2023-12-14 08:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Login', '0002_alter_login_img'),
    ]

    operations = [
        migrations.RenameField(
            model_name='login',
            old_name='img',
            new_name='image',
        ),
    ]