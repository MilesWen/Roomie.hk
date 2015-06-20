# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bulletin', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='room',
            name='stayPeriod',
            field=models.PositiveIntegerField(default=12),
        ),
    ]
