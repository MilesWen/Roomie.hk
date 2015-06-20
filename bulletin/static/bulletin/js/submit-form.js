console.log(desirableRoomie, preferableLocation, preferredRoomType, moveInTime, stayingPeriod)
function submitForm() {
	var criteria = {}
	criteria.desirableRoomie = desirableRoomie
	criteria.preferableLocation = preferableLocation
	criteria.preferredRoomType = preferredRoomType
	criteria.moveInTime = moveInTime
	criteria.priceRange = [5000, 8000]

	$.post( "bullet/preferences", criteria)
		.done(function( data ) {
	  alert( "Data Loaded: " + data );
	});
}
submitForm()