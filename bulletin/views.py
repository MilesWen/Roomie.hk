from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from bulletin.models import User, Room, Bookmark, Friend

from django.contrib.auth import authenticate, login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.decorators import login_required


# Get FB img
def GetFBImg(fbID):
	fmt = r'https://graph.facebook.com/{fbid}/picture?type=large'
	return fmt.format(fbid=fbID)

# facebook login
import urllib2
import json
from distutils.tests.setuptools_build_ext import if_dl

## login via id & pwd pair or via cookies
def login(request):
    # context = RequestContext(request, {
    #     'request': request, 'user': request.user})
    # return render_to_response('login.html', context_instance=context)
    return render(request, 'bulletin/login.html')

def logout(request):
    auth_logout(request)
    return redirect('/')
   
# loging via FB
def login_FB(request):
	return render(request, 'bulletin/login.html')

# information from facebook
@login_required(login_url='/')
def social_login(request):
	social_user = request.user.social_auth.filter(provider='facebook',).first()
	if social_user:	
		url = u'https://graph.facebook.com/{0}/' \
			  u'taggable_friends?fields=id,name,gender,picture' \
			  u'&access_token={1}'.format(
				  social_user.uid,
				  social_user.extra_data['access_token'],
		)
		print social_user.uid
		r = urllib2.Request(url)
		j = json.loads(urllib2.urlopen(r).read())
		frdLst = j['data']
		
		try:
			user = User.objects.get(fbid=social_user.uid)
		except User.DoesNotExist:
		    user = User(fbid=social_user.uid)
		    user.save()
		    
		request.session['userid']=user.id
		request.session['fbid']=social_user.uid
		request.session['fb_img']=GetFBImg(social_user.uid)
		#profilePhotoURL = request.session['']
		try:
			userFriend = Friend.objects.get(user__id=user.id)
			userFriend.friend=str(frdLst)
			#print userFriend.friend
			userFriend.save()
		except Friend.DoesNotExist:
			print 'N'
			userFriend = Friend(user=user, friend=str(frdLst))
			userFriend.save()
			
		return preferences(request)
	else:
		return None

# show profile of user
@login_required(login_url='/')
def profile(request):
	# scenario: user wants to check the profile of the roomate/room owner
	context_dict = {}

	try:
		user = User.objects.get(id=request.session['userid'])
		context_dict['userInfo'] = user
		context_dict['fbImg'] = request.session['fb_img']
		
	except User.DoesNotExist:
		pass

	return render(request, 'bulletin/profile.html',context_dict)

# ask for preference (filtering info) from user
@login_required(login_url='/')
def preferences(request):
	context_dict = {}
	# scenario: user wants to check his/her preferences

	try:
		user = User.objects.get(id=request.session['userid'])
		context_dict['userInfo'] = user
		context_dict['fbImg'] = request.session['fb_img']

	except User.DoesNotExist:
		pass

	return render(request, 'bulletin/preferences.html',context_dict)

# return bulletin listing
@login_required(login_url='/')
def listing(request):
	# user_id is the id of a room SEEKer
	# scenario: given the preferences of a room seeker user_id, return a list of rooms based on the preferences
	context_dict = {}
	
	try:
		print request.session['userid']
		seeker = User.objects.get(id=request.session['userid'])
		
		#preference attributes (to owners): gender_mate, occupation_mate, hasPet_mate, smoker_mate, quiet_mate,
		#preference attributes (to seekers): same as above
		#preference attributes (to rooms): district, isPrivate, price, moveInDate, stayPeriod, 
		
		#currently only consider 4 preference filters
		# 1. the room owner's gender should match the seeker's gender_mate preference
		# 2. the district, isPrivate, price attributes of the room should match the seeker's district, isPrivate, price attributes
		
# 		print seeker.gender_mate
# 		print seeker.district, seeker.isPrivate, seeker.price 
		
		rooms = Room.objects.filter(user__gender=seeker.gender_mate, district=seeker.district, isPrivate=seeker.isPrivate, price__lte = seeker.price)
		context_dict['roomList'] = rooms
		context_dict['seeker'] = seeker
	
	except User.DoesNotExist, Room.DoesNotExist:
		pass
	
	return render(request, 'bulletin/listing.html', context_dict)

# return bulletin details
@login_required(login_url='/')
def details(request, room_id):
	# scenario: user views the details of a room and its owner details
	context_dict = {}
	
	try:
		room = Room.objects.get(id=room_id)
		context_dict['roomInfo'] = room
		context_dict['ownerInfo'] = room.user
	
	except Room.DoesNotExist:
		pass

	# Go render the response and return it to the client.
	return render(request, 'bulletin/details.html', context_dict)