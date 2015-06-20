# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bulletin', '0002_room_stayperiod'),
    ]

    operations = [
        migrations.RenameField(
            model_name='bookmark',
            old_name='roomid',
            new_name='room',
        ),
        migrations.RenameField(
            model_name='bookmark',
            old_name='uid',
            new_name='user',
        ),
        migrations.RenameField(
            model_name='room',
            old_name='uid',
            new_name='user',
        ),
        migrations.AlterUniqueTogether(
            name='bookmark',
            unique_together=set([('user', 'room')]),
        ),
    ]
