function testInput(input) {
	var email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var cc_num = /^\d{16}$/;
	var cc_exp = /^\d{4}$/;

	switch(input[0].id){
		case "order_email":
			regexTest("#order_email", email);
			break;
		case "order_cc_num":
			regexTest("#order_cc_num", cc_num);
			break;
		case "order_cc_exp":
			regexTest("#order_cc_exp", cc_exp);
			break;
	}
}

function mark_error (input){
	$(input)[0].parentElement.className = "field error";
}

function regexTest(input, regex){
	var test = true;
	if($(input)[0].value.match(regex) == null){
		$(input)[0].parentElement.className = "field error";
		test = false;
	}else{
		$(input)[0].parentElement.className = "field";
	};
	return test;
}

function handleOrderForm() {
	
	$("#place_order").on("click", function() {
		var email = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var cc_num = /^\d{16}$/;
		var cc_exp = /^\d{4}$/;
		

		if(
			!regexTest("#order_email", email) | 
			!regexTest("#order_cc_num", cc_num) | 
			!regexTest("#order_cc_exp", cc_exp)
		){
			return false;
		};
	})

}

$(document).ready(function(){
	handleOrderForm();
	
	$(".required").on("blur", function() {
        if ($(this)[0].parentElement.className == "field error"){
			testInput($(this))
		};
	});

});