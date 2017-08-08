function setSlides(){
    var width = $(window).width();
    var height = $(window).height();
    var slideAmount;

    if (width <= 799) {
        slideAmount = 1;
    } else if (width >= 800 && width <= 949) {
        slideAmount = 2;
    } else if (width >= 950 && width <= 1099) {
        slideAmount = 3;
    } else {
        slideAmount = 4;
    }
    return slideAmount;
}

function checkCarousel(properties){
    
    if (properties.items != setSlides()) {
        properties.items = setSlides()
		$(".owl-carousel").trigger('destroy.owl.carousel');	    
		startCarousel(properties);
	}
}

function startCarousel(properties){
	$(".owl-carousel").owlCarousel(properties);
	$(".owl-carousel").trigger('play.owl.autoplay',[7000]);
}


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

	var slides = setSlides();
	var properties = {
  	items: slides,
    loop:true,
    margin:0,
    nav:false,
    autoplay:true,
    autoplayTimeout:7000
  	};
 	
	startCarousel(properties);

	$(window).resize(function() {
		checkCarousel(properties);
	});
});