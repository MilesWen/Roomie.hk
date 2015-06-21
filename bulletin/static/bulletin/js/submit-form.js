console.log(desirableRoomie, preferableLocation, preferredRoomType, moveInTime, stayingPeriod, User_ID)

//var csrftoken = $.cookie('csrftoken');

function submitForm() {
	var criteria = {}
	criteria.desirableRoomie = desirableRoomie
	criteria.preferableLocation = preferableLocation
	criteria.preferredRoomType = preferredRoomType
	criteria.moveInTime = moveInTime
	criteria.priceRange = [5000, 8000]
	criteria.user_id = User_ID

	console.log(criteria.token)

	$.post( "update/", criteria)
		.done(function( data ) {
	  alert( "Data Loaded: " + data );
	});
}
submitForm()