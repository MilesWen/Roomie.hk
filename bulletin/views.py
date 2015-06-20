from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
#from bulletin.models import User, Post

## login via id & pwd pair or via cookies
def login(request):
	# This is a test in branch-Miles
	return render(request, 'bulletin/login.html')

# loging via FB
def login_FB(request):
	return render(request, 'bulletin/login.html')

# show profile of user
def profile(request):
	return render(request, 'bulletin/profile.html')

# ask for preference (filtering info) from user
def preferences(request):
	return render(request, 'bulletin/preferences.html')

# return bulletin listing
def listing(request):
	return render(request, 'bulletin/listing.html')

# return bulletin details
def details(request):
	return render(request, 'bulletin/details.html')