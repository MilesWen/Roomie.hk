# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bulletin', '0005_auto_20150620_1529'),
    ]

    operations = [
        migrations.RenameField(
            model_name='friend',
            old_name='user2',
            new_name='user',
        ),
        migrations.RemoveField(
            model_name='friend',
            name='user1',
        ),
        migrations.AddField(
            model_name='friend',
            name='friend',
            field=models.TextField(default=b''),
        ),
    ]
