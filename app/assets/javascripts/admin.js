function orderByMovie(){
	var selectValue = $("#movie_id")[0].value;
	$(".orders_by_movie").each(function(){
		if($(this).hasClass("hidden") == false){
			$(this).toggleClass("hidden");
		};
	});

	$('div#' + $("#movie_id")[0].value).toggleClass("hidden");
}

$(document).ready(function(){
	
	orderByMovie();
	$("#movie_id").on("change", function(){
		orderByMovie();
	})

});