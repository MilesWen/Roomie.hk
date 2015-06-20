# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bulletin', '0004_auto_20150620_1522'),
    ]

    operations = [
        migrations.AlterField(
            model_name='friend',
            name='user1',
            field=models.ForeignKey(related_name='u1', to='bulletin.User'),
        ),
    ]
