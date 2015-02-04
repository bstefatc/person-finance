$("#datepicker").datepicker({
	inline : true
});
$("#dialog-link, #icons li").hover(function() {
	$(this).addClass("ui-state-hover");
}, function() {
	$(this).removeClass("ui-state-hover");
});
$(function() {
	$('#the-node').contextMenu({
		selector : 'tr',
		callback : function(key, options) {
			switch (key) {
			case "delete":
				if (options.$trigger.attr("id") == null) {
					break;
				}
				$.ajax({
					type : "GET",
					url : "rest/account/delete_transaction",
					data : "id=" + options.$trigger.attr("id"),
					success : function(data) {
						viewTransactions();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("Request failed: " + textStatus);
						console.log(JSON.stringify(jqXHR));
					},
				});
			}
		},
		items : {
			"paste" : {
				name : "Other",
				icon : "paste",
				disabled : true
			},
			"delete" : {
				name : "Delete",
				icon : "delete"
			},
			"sep1" : "---------",
			"quit" : {
				name : "Quit",
				icon : "quit"
			}
		}
	});
});

$('.jqte-test').jqte();
var jqteStatus = true;
$(".status").click(function() {
	jqteStatus = jqteStatus ? false : true;
	$('.jqte-test').jqte({
		"status" : jqteStatus
	})
});