function nameTrigger() {
	$("#nameForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#nameError").css({"display":"block"});
}

function nameValidate() {
	var name = $("#nameForm").val();
	if (name.length < 1 || name.length > 20) {
		nameTrigger();
		return false;
	}
	return true;
}

function phoneTrigger() {
	$("#phoneForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#phoneError").css({"display":"block"});
}

function phoneValidate() {
	console.log("phone val")
	var phone = $("#phoneForm").val();
	if (phone.length == 9 || phone.length == 10) {
		return true;
	}
	else {
		phoneTrigger();
		return false;
	}		
}

function emailTrigger() {
	console.log("email trig")
	$("#emailForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#emailError").css({"display":"block"});
}

function emailValidate() {
	var name = $("#emailForm").val();
	if (name.length < 1 || name.length > 20) {
		emailTrigger();
		return false;
	}
	return true;
}

function cityTrigger() {
	$("#cityForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#cityError").css({"display":"block"});
}

function cityValidate() {
	var city = $("#cityForm").val();
	if (city.length < 1 || city.length > 20) {
		cityTrigger();
		return false;
	}
	return true;
}

function stateTrigger() {
	$("#stateForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#stateError").css({"display":"block"});
}

function stateValidate() {
	var state = $("#stateForm").val();
	if (state.length < 1 || state.length > 20) {
		stateTrigger();
		return false;
	}
	return true;
}

function countryTrigger() {
	$("#countryForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#countryError").css({"display":"block"});
}

function countryValidate() {
	var country = $("#countryForm").val();
	if (country.length < 1 || country.length > 20) {
		countryTrigger();
		return false;
	}
	return true;
}

function zipTrigger() {
	$("#zipForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#zipError").css({"display":"block"});
}

function zipValidate() {
	var zip = $("#zipForm").val();
	if (zip.length != 5) {
		zipTrigger();
		return false;
	}
	return true;
}

function timezoneTrigger() {
	$("#timezoneForm").css({"border-color":"red", "box-shadow":"inset 0 1px 1px red, 0 0 8px red;"});
	$("#timezoneError").css({"display":"block"});
}

function timezoneValidate() {
	var timezone = $("#timezoneForm").val();
	if (timezone.length < 1) {
		timezoneTrigger();
		return false;
	}
	return true;
}


$(document).ready(function() {
	
	$("#submit-btn").click(function() {
		var pass = true;
/*		if (nameValidate() == false || phoneValidate() == false || emailValidate() == false || cityValidate() == false || stateValidate() == false || countryValidate() == false || zipValidate() == false || timezoneValidate() == false) {
			console.log("test")
			alert("One or more fields have errors.")
			return false;
		}*/
		
		if (nameValidate() == false)
			pass = false;
		if (phoneValidate() == false)
			pass = false;
		if (emailValidate() == false)
			pass = false;
		if (cityValidate() == false)
			pass = false;
		if (stateValidate() == false)
			pass = false;
		if (countryValidate() == false)
			pass = false;
		if (timezoneValidate() == false)
			pass = false;
		if (zipValidate() == false)
			pass = false;
		
		if (pass == false) {
			console.log("test")
			//alert("One or more fields have errors.")
			return false;
		}
		else {
			//alert("no errors")
			$('#va-form')[0].submit();
		}
/*		pass = nameValidate();	
		pass = phoneValidate();
		pass = emailValidate();
		pass = cityValidate();
		pass = stateValidate();
		pass = countryValidate();
		pass = zipValidate();
		pass = timezoneValidate();*/
		
	/*	if (pass == false) {
			console.log("test")
			alert("One or more fields have errors.")
			return false;
		}
		else if (pass == true) {
			alert("no errors")
			$('#va-form')[0].submit();
		}*/
	});

	
	
/*	$('#va-form').submit(function(e) {
		// Form submission paused for client-side validation.
		console.log("form prevent submit");
		if (validateAll() == false) {
			alert("One or more fields have errors.")
			e.preventDefault();
			return false;
		} 
		else {
			alert("no errors")
			$(this)[0].submit();
			return true;
		}
	});*/

});  