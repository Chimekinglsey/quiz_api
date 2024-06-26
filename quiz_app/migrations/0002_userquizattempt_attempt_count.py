# Generated by Django 5.0.5 on 2024-05-08 15:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quiz_app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='userquizattempt',
            name='attempt_count',
            field=models.PositiveIntegerField(default=0, help_text='Number of attempts made by the user on a quiz.'),
        ),
    ]
