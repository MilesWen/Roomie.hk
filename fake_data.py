# Use this script to fake data into the database
import os
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RoomieHK.settings')

import django
django.setup()

# Codes go below
def pumpIt():
	return

if __name__ == '__main__':
	print "Start pumping fake data into DB"
	pumpIt()