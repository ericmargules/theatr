$(document).ready(function(){
	
	$("#showtime_allday").on("change", function(){ 
		$("#showtime_time_1i").parent().toggleClass("hidden");
	});
});