# Generated by Django 4.2.6 on 2023-12-19 07:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Login', '0004_alter_login_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='login',
            name='image',
        ),
        migrations.AddField(
            model_name='login',
            name='url_image',
            field=models.CharField(max_length=200, null=True),
        ),
    ]