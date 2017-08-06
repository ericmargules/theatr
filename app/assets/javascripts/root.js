function parseDay(link){
	var npDivs = $(".showing_day");
	npDivs.each(function(){
		if($(this).hasClass("hidden") == false){
			$(this).toggleClass("hidden");
		};
	});
	var dayInt = parseInt(link.id[link.id.length-1]);
	npDivs[dayInt].className = "showing_day"
}

$(document).ready(function(){
	
	$(".np_nav_button").on("click", function(){
			parseDay($(this)[0]);
			return false;	
	});

	var properties = {
	  	items: 4,
	    loop:true,
	    margin:0,
	    nav:false,
	    autoplay:true,
	    autoplayTimeout:7000
  	};

	$(".owl-carousel").owlCarousel(properties);

	var owl = $('.owl-carousel');
	owl.trigger('play.owl.autoplay',[7000]);


	$(window).resize(function() {
	    var width = $(window).width();
	    var height = $(window).height();
	    var slideAmount;

	    if (width <= 799) {
	        slideAmount = 1;
	    } else if (width >= 800 && width <= 899) {
	        slideAmount = 2;
	    } else if (width >= 900 && width <= 999) {
	        slideAmount = 3;
	    } else {
	        slideAmount = 4;
	    }

	    if (properties.items != slideAmount) {
	        properties.items = slideAmount
			owl.trigger('destroy.owl.carousel');	    
			$(".owl-carousel").owlCarousel(properties);
		}
	});
});