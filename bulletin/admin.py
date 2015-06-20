from django.contrib import admin
from bulletin.models import User, Room, Bookmark, Friend

# Register your models here.
admin.site.register(User)
admin.site.register(Room)
admin.site.register(Bookmark)
admin.site.register(Friend)
