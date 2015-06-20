from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
#from bulletin.models import User, Post
from django.contrib.auth import authenticate, login

# facebook login
import urllib2
import json

## login via id & pwd pair or via cookies
def login(request):
    # This is a test in branch-Miles
    return render(request, 'bulletin/login.html')

def login_check(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
    	request.session['username'] = username
        return render(request, 'bulletin/profile.html')
    else:
        return HttpResponseRedirect('/')

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

# information from facebook
def social_login(request):
    social_user = request.user.social_auth.filter(provider='facebook',).first()
    if social_user:
        url = u'https://graph.facebook.com/{0}/' \
              u'taggable_friends?fields=id,name,gender,picture' \
              u'&access_token={1}'.format(
                  social_user.uid,
                  social_user.extra_data['access_token'],
              )
        request = urllib2.Request(url)
#        friends = json.loads(urllib2.urlopen(request).read()).get('data')
        return HttpResponse(str(social_user.__dict__) +  urllib2.urlopen(request).read())
    else:
        return None
