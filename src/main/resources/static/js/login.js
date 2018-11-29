$( document ).ready(function() {
    var error = location.search;
    if(error.length != 0) {
    	$("#error").show();
    }
});

$(".input").focusin(function () {
	$(this).find("span").animate({
		"opacity": "0"
	}, 200);
});

$(".input").focusout(function () {
	$(this).find("span").animate({
		"opacity": "1"
	}, 300);
});

$(".login").submit(function () {
	$(this).find(".submit i").removeAttr('class').addClass("fa fa-refresh spin").css({
		"color": "#fff"
	});
	$(".submit").css({
		"background": "#2196f3",
		"border-color": "#2196f3"
	});
	$(".feedback").show().animate({
		"opacity": "1",
		"bottom": "-80px"
	}, 400);
	$("input").css({
		"border-color": "#2196f3"
	});
	//return false;
});