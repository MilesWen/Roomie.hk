from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from bulletin.models import User, Room, Bookmark, Friend

## login via id & pwd pair or via cookies
def login(request):
	# This is a test in branch-Miles
	return render(request, 'bulletin/login.html')

# loging via FB
def login_FB(request):
	return render(request, 'bulletin/login.html')

# show profile of user
def profile(request, user_id):
	return render(request, 'bulletin/profile.html')

# ask for preference (filtering info) from user
def preferences(request, user_id):
	return render(request, 'bulletin/preferences.html')

# return bulletin listing
def listing(request, user_id):
	# user_id is the id of a room SEEKer
	# scenario: given the preferences of a room seeker user_id, return a list of rooms based on the preferences
	context_dict = {}
	
	try:
		seeker = User.objects.get(id=user_id)
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