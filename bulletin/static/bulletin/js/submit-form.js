console.log(desirableRoomie, preferableLocation, preferredRoomType, moveInTime, stayingPeriod, User_ID)

//var csrftoken = $.cookie('csrftoken');

function submitForm() {
	var data = {
	    url: "bulletin/preferences/100/update/",
	    title: "",
	    tags: "",
	    csrfmiddlewaretoken: '{{ csrf_token }}',
	    criteria: {
	    		"desirableRoomie": desirableRoomie
				, "preferableLocation": preferableLocation
				, "preferredRoomType": preferredRoomType
				, "criteria.moveInTime": moveInTime
				, "priceRange": [5000, 8000]
				, "user_id": User_ID
	    }
	}
	$.post("http://175.159.188.179:8000/bulletin/preferences/100/update/", data, function (result) {
    if (result != "failure") {
    	console.log('yay')
    }
    else {
      console.log('failed')
    }
    return false;
	})

	// var criteria = {}
	// criteria.desirableRoomie = desirableRoomie
	// criteria.preferableLocation = preferableLocation
	// criteria.preferredRoomType = preferredRoomType
	// criteria.moveInTime = moveInTime
	// criteria.priceRange = [5000, 8000]
	// criteria.user_id = User_ID

	// console.log(criteria.token)

	// $.post( "update/", criteria)
	// 	.done(function( data ) {
	//   alert( "Data Loaded: " + data );
	// });
}
