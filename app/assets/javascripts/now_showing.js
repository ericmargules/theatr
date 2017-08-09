function parseDay(link){
	var npDivs = $(".showing_day");
	var npDateSelect = $(".np_date_select");
	npDateSelect.each(function (){
		if($(this).hasClass("selected")){
			$(this).toggleClass("selected");
		};
	});

	npDivs.each(function(){
		if($(this).hasClass("hidden") == false){
			$(this).toggleClass("hidden");
		};
	});
	var dayInt = parseInt(link.id[link.id.length-1]);
	npDivs[dayInt].className = "showing_day";
	$(link.children[0]).toggleClass("selected");
}

$(document).ready(function(){
	
	$(".np_nav_button").on("click", function(){
			parseDay($(this)[0]);
			return false;	
	});
});