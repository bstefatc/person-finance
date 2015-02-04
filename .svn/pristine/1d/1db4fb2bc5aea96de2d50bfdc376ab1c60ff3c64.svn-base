var accountForOneId;
showAccounts();

// show all possible accounts
function showAccounts() {
	$.ajax({
		type : "GET",
		dataType : "json",
		url : "rest/account",
		success : function(data) {
			$("#rightPanel").hide();
			console.log(data);
			var res = JSON.stringify(data); // json to string
			var c = "";
			for (var i = 0; i < data.length; i++) {
				c += '<div class="panel panel-info">	<div class="panel-heading"  id = "' + data[i].id + '">' + data[i].name + ' </div>	</div>';
			}
			$('#result').html(c);
			showDetail();
			transactionClick();
			noteClick();
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Request failed: " + textStatus);
			console.log(JSON.stringify(jqXHR));
		},
	});
};

// show details of selected account
function showDetail() {
	$('#result').on('click', function(e) {
		$.ajax({
			type : "GET",
			dataType : "json",
			url : "rest/account/byId",
			data : "accountId=" + e.target.id,
			success : function(data) {
				$("#rightPanel").show();
				console.log(data);
				var res = JSON.stringify(data); // json to string
				accountForOneId = data.id;
				oneAccount = data;
				$("#example").text(data.name);
				$("#editid").val(data.id);
				$("#editname").val(data.name);
				$("#editnumber").val(data.number);
				$("#editcurrency").val(data.currency);
				$("#editinstitution").val(data.institution);
				$("#editaddress").val(data.address);
				$("#editphone").val(data.phone);

				$(".idtransactions").removeClass("active");
				$(".idtransactions").removeClass("in");
				$(".idtransactions").removeClass("active");
				$(".idsummary").removeClass("active");
				$(".idsummary").removeClass("in");
				$(".idsummary").removeClass("active");
				$(".idnotes").removeClass("active");
				$(".idnotes").removeClass("in");
				$(".idnotes").removeClass("active");
				$("#transactions").removeClass("active");
				$("#transactions").removeClass("in");
				$("#notes").removeClass("active");
				$("#notes").removeClass("in");
				$("#summary").removeClass("active");
				$("#summary").removeClass("in");

				$(".iddetails").addClass("active");
				$("#details").addClass("in active");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Request failed: " + textStatus);
				console.log(JSON.stringify(jqXHR));
			},
		});
	});
};

// Edit account submit
$(document).ready(
		function() {
			$("#submitEdit").click(
					function() {
						var name = $("#editname").val();
						if (name == null || name == "") {
							alert("insert name please");
							return false;
						}
						var url = "rest/account/create"; // the script where you handle the form input.
						var id = $("#editid").val();
						var number = $("#editnumber").val();
						var currency = $("#editcurrency").val();
						var institution = $("#editinstitution").val();
						var address = $("#editaddress").val();
						var phone = $("#editphone").val();
						data = "id=" + id + "&name=" + name + "&number=" + number + "&currency=" + currency + "&institution=" + institution
								+ "&address=" + address + "&phone=" + phone;
						$.post(url, {
							id : id,
							name : name,
							number : number,
							currency : currency,
							institution : institution,
							address : address,
							phone : phone
						}, function(data, status) {
							showAccounts();
						});

						return false;
					});
		});
// Create account submit
$(document).ready(function() {
	$("#addAccountSubmit").click(function() {
		var name = $("#name").val();
		if (name == null || name == "") {
			alert("insert name please");
			return false;
		}
		var url = "rest/account/create";
		var number = $("#number").val();
		var currency = $("#currency").val();
		var institution = $("#institution").val();
		var address = $("#address").val();
		var phone = $("#phone").val();
		// data = "name=" + name + "&number=" + number + "&currency=" + currency + "&institution=" + institution + "&address=" + address
		// + "&phone=" + phone;
		$.post(url, {
			name : name,
			number : number,
			currency : currency,
			institution : institution,
			address : address,
			phone : phone
		}, function(data, status) {
			showAccounts();
		});
		return false;
	});
});

// View note for account
function noteClick() {
	$(".idnotes").click(function() {
		viewNotes();
	})
};
// Function for viewing note for account
function viewNotes() {
	$.ajax({
		type : "GET",
		dataType : "json",
		url : "rest/account/comment",
		data : "id=" + accountForOneId,
		success : function(data) {
			var c = "";
			for (var i = 0; i < data.length; i++) {
				c += '<blockquote>' + '<p id="commentUserName">' + data[i].userName + '</p>' + '<p id="commenttext">' + data[i].commentText + '</p>'
						+ '<small>comment.userName <cite title="Source Title"></cite>' + '</small>';
				if (data[i].docName != null) {
					c += '<p>' + '	<a target="_blank" href="rest/account/downloadfile?fileName=' + data[i].docName + '">' + data[i].docName + '</a>'
							+ '</p>'
				}
				c += '</blockquote>'
			}
			$('#viewComments').html(c);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Request failed: " + textStatus);
			console.log(JSON.stringify(jqXHR));
		},
	});
}

// Function for viewing file
function openFile(id) {
	$.ajax({
		type : "GET",
		dataType : "json",
		url : "rest/account/downloadfile",
		success : function(data) {
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("Requesta failed: " + textStatus);
			console.log(JSON.stringify(jqXHR));
		},
	});
}

// Add new note
$(document).ready(function() {
	$("#noteForm").submit(function() {
		var oMyForm = new FormData();
		oMyForm.append("file", file2.files[0]);
		oMyForm.append("name", $("#commentName").val());
		oMyForm.append("commentText", $("#commentText").val());
		oMyForm.append("id", accountForOneId);
		var url = "rest/account/createcomment";
		data = oMyForm;
		$.ajax({
			dataType : 'text',
			processData : false,
			contentType : false,
			type : "POST",
			url : url,
			data : data,
			success : function(data) {
				viewNotes();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Request failed: " + textStatus);
				console.log(JSON.stringify(jqXHR));
			},
		});

		return false;
	});
});

// Show all transactions
function transactionClick() {
	$(".idtransactions").click(function() {
		viewTransactions();
	})
};

// Function for viewing transactions
function viewTransactions() {
	$
			.ajax({
				type : "GET",
				dataType : "json",
				url : "rest/account/transactions",
				data : "id=" + accountForOneId,
				success : function(data) {
					var c = "";
					c += '<table class="table table-striped table-bordered table-hover" id="dataTables-example">'
							+ '<thead>'
							+ '<tr>'
							+ '<th style="width: 180px">Date<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '<th style="width: 180px">Details<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '<th style="width: 180px">Amount<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '<th style="width: 180px">Balance<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '<th style="width: 180px">Comment<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '<th style="width: 180px">Tag<img src="resources/img/sorting.png" width="25px" height="25px" style="margin-left: 12px;" /></th>'
							+ '</tr>' + '</thead>' + '<tbody class="the-node" id="the-node">'
					for (var i = 0; i < data.length; i++) {
						var d = new Date(data[i].date);
						c += '<tr id="' + data[i].id + '">' + '	<td>' + d.toDateString() + '</td>' + '	<td>' + data[i].details + '</td>' + '	<td>'
								+ data[i].amount + '</td>' + '	<td>' + data[i].balance + '</td>' + '	<td>' + data[i].comment + '</td>' + '	<td>'
								+ data[i].tag + '</td>' + '</tr>'
					}
					c += '</tbody></table>';
					$('#sortingTable').html(c);
					$.getScript('resources/js/jquery.dataTables.js');
					$.getScript('resources/js/dataTables.bootstrap.js');
					$('#dataTables-example').dataTable();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Request failed: " + textStatus);
					console.log(JSON.stringify(jqXHR));
				},
			});
}

// Add new transaction for account
$(document).ready(function() {
	$("#addTransaction").click(function() {
		var amount = $("#trAmount").val();
		var balance = $("#trBalance").val();
		var date = $("#datepicker").val();

		if (amount !== null) {
			if (!(/^[\-\+]?[\d\,]*\.?[\d]*$/.test(amount))) {
				alert("Please enter a valid ammount");
				return false;
			}
		} else {
			alert("Enter amount please");
			return false;
		}
		if (balance !== null) {
			if (!(/^[\-\+]?[\d\,]*\.?[\d]*$/.test(balance))) {
				alert("Please enter a valid ammount");
				return false;
			}
		} else {
			alert("Enter balance please");
			return false;
		}
		if (date == null || date == "") {
			alert("Insert date please");
			return false;
		}
		var url = "rest/account/create_transaction/" + accountForOneId; // the script where you handle the form input.
		var detail = $("#trDetails").val();
		alert("amount:" + detail);
		var comment = $("#trComment").val();
		var tag = $("#trTag").val();
		$.post(url, {
			date : date,
			details : detail,
			amount : amount,
			balance : balance,
			comment : comment,
			tag : tag,
		}, function(data, status) {
			viewTransactions();
		});
		return false;
	})
});

// Cancel editing account, view old one
$(document).ready(function() {
	$("#cancelEdit").click(function() {

		$.ajax({
			type : "GET",
			dataType : "json",
			url : "rest/account/byId",
			data : "accountId=" + accountForOneId,
			success : function(data) {
				$("#rightPanel").show();
				$("#example").text(data.name);
				$("#editid").val(data.id);
				$("#editname").val(data.name);
				$("#editnumber").val(data.number);
				$("#editcurrency").val(data.currency);
				$("#editinstitution").val(data.institution);
				$("#editaddress").val(data.address);
				$("#editphone").val(data.phone);
				console.log(data);
				var res = JSON.stringify(data); // json to string
				accountForOneId = data.id;

			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Request failed: " + textStatus);
				console.log(JSON.stringify(jqXHR));
			},
		});

	});
});