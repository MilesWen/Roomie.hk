# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('bulletin', '0003_auto_20150620_1517'),
    ]

    operations = [
        migrations.RenameField(
            model_name='friend',
            old_name='uid1',
            new_name='user1',
        ),
        migrations.RenameField(
            model_name='friend',
            old_name='uid2',
            new_name='user2',
        ),
    ]
