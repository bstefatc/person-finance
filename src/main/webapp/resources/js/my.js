$("#commentHidden").click(function() {
	$("#commentHidden").hide();
	$("#commentForma").show();
});

function validateForm() {
	var x = document.forms["myForm"]["name"].value;
	if (x == null || x == "") {
		alert("Insert name please");
		return false;
	}
}

function validateForm2() {
	var x = document.forms["myForm2"]["name"].value;
	if (x == null || x == "") {
		alert("Insert name please");
		return false;
	}
}

function validateTransactionForm() {
	var x = document.forms["transactionForm"]["date"].value;
	if (x == null || x == "") {
		alert("Insert date please");
		return false;
	}
	var y = document.forms["transactionForm"]["amount"].value;
	if (y !== null) {
		if (!(/^[\-\+]?[\d\,]*\.?[\d]*$/.test(y))) {
			alert("Please enter a valid ammount");
			return false;
		}
	}

	var y = document.forms["transactionForm"]["balance"].value;
	if (y !== null) {
		if (!(/^[\-\+]?[\d\,]*\.?[\d]*$/.test(y))) {
			alert("Please enter a valid ammount");
			return false;
		}
	}
}
