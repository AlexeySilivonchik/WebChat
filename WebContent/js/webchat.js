$(document).ready(function() {
	$('.navTab').hover(function() {
		if (!$(this).siblings(".anime").hasClass('animated')) {
			$(this).siblings(".anime").dequeue().stop().animate({
				height : "5px"
			}, 150, 'linear');
		}

		$(this).css('color', '#3366BB');
	}, function() {

		$(this).siblings(".anime").animate({
			height : "0px"
		}, 150, 'linear');
		$(this).css('color', '#777');
	});
});