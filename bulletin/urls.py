from django.conf.urls import url
from bulletin import views

urlpatterns = [
	# Syntax: url(regex, view, kwargs=None, name=None)
	# REGEX notes: "$": matches the ending position of the string
	# REGEX notes: "+": matches the proceeding character multiple (>= 1) times
	# REGEX notes: "?": matches the proceeding character ZERO times

	# Using parenthes () around a pattern takes the text matched by that 
	#	pattern and sends it as an argument to the view function
	# Strings inside <> defines the name that will be used to identify
	#	the matched pattern

	# ex: /bulletin/
	url(r'^$', views.login, name='login'), # login page

	# ex: /bulletin/profile/
	url(r'^profile/(?P<user_id>[0-9]+)/$', views.profile, name='profile'), # profile page

	# ex: /bulletin/listing/
	url(r'^listing/(?P<user_id>[0-9]+)/$', views.listing, name='listing'), # listing page

	# ex: /bulletin/preferences/
	url(r'^preferences/(?P<user_id>[0-9]+)/$', views.preferences, name='preferences'), # preferences page

	# ex: /bulletin/details/
	url(r'^details/(?P<room_id>[0-9]+)/$', views.details, name="details"), # details page
]
