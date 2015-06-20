# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.core.validators


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Bookmark',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Friend',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('address', models.CharField(default=b'', max_length=200)),
                ('district', models.CharField(default=b'central', max_length=200)),
                ('latitude', models.FloatField(default=22.280812, validators=[django.core.validators.MinValueValidator(-90), django.core.validators.MaxValueValidator(90)])),
                ('longitude', models.FloatField(default=114.155676, validators=[django.core.validators.MinValueValidator(-180), django.core.validators.MaxValueValidator(180)])),
                ('isPrivate', models.BooleanField(default=False)),
                ('price', models.PositiveIntegerField(default=5000)),
                ('moveInDate', models.DateField()),
                ('size', models.PositiveIntegerField(default=100)),
                ('numExistingMates', models.PositiveIntegerField(default=1)),
                ('pictureURL', models.URLField(default=b'google.com')),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('fbid', models.CharField(default=b'', max_length=200)),
                ('name', models.CharField(default=b'', max_length=200)),
                ('age', models.PositiveIntegerField(default=5, validators=[django.core.validators.MinValueValidator(5), django.core.validators.MaxValueValidator(100)])),
                ('gender', models.CharField(default=b'F', max_length=1)),
                ('occupation', models.CharField(default=b'student', max_length=200)),
                ('hasPet', models.BooleanField(default=False)),
                ('smoker', models.BooleanField(default=False)),
                ('quiet', models.BooleanField(default=False)),
                ('fbProfilePhotoURL', models.URLField(default=b'google.com')),
                ('gender_mate', models.CharField(default=b'F', max_length=1)),
                ('occupation_mate', models.CharField(default=b'student', max_length=200)),
                ('hasPet_mate', models.BooleanField(default=False)),
                ('smoker_mate', models.BooleanField(default=False)),
                ('quiet_mate', models.BooleanField(default=False)),
                ('district', models.CharField(default=b'central', max_length=200)),
                ('isPrivate', models.BooleanField(default=False)),
                ('price', models.PositiveIntegerField(default=5000)),
                ('moveInDate', models.DateField()),
                ('stayPeriod', models.PositiveIntegerField(default=12)),
            ],
        ),
        migrations.AddField(
            model_name='room',
            name='uid',
            field=models.ForeignKey(to='bulletin.User'),
        ),
        migrations.AddField(
            model_name='friend',
            name='uid1',
            field=models.ForeignKey(related_name='user1', to='bulletin.User'),
        ),
        migrations.AddField(
            model_name='friend',
            name='uid2',
            field=models.ForeignKey(to='bulletin.User'),
        ),
        migrations.AddField(
            model_name='bookmark',
            name='roomid',
            field=models.ForeignKey(to='bulletin.Room'),
        ),
        migrations.AddField(
            model_name='bookmark',
            name='uid',
            field=models.ForeignKey(to='bulletin.User'),
        ),
        migrations.AlterUniqueTogether(
            name='bookmark',
            unique_together=set([('uid', 'roomid')]),
        ),
    ]
