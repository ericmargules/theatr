function mark_error (input){
	$(input)[0].parentElement.className = "field error";
}

function regex_test(input, regex){
	var test = true;
	if($(input)[0].value.match(regex) == null){
		$(input)[0].parentElement.className = "field error";
		test = false;
	};
	return test;
}

function handleOrderForm() {
	
	$("#place_order").on("click", function() {
		var test = true;
		var email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var cc_num = /^\d{16}$/;
		var cc_exp = /^\d{4}$/;
		

		if(
			!regex_test("#order_email", email) | 
			!regex_test("#order_cc_num", cc_num) | 
			!regex_test("#order_cc_exp", cc_exp)
		){
			return false;
		};
	})

}

$(document).ready(function(){
	handleOrderForm();
});