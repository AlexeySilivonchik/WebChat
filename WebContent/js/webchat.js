$(document).ready(function() {
	var letterMaxValue = 140;
	
	$('.navTab').hover(function(){						
		if (!$(this).siblings(".anime").hasClass('animated')) {
			$(this).siblings(".anime").dequeue().stop().animate({ height: "5px" }, 150, 'linear');
		}
		
		$(this).css('color', '#3366BB');
	}, function(){				
		
		$(this).siblings(".anime").animate({ height: "0px" }, 150, 'linear');
		$(this).css('color', '#777');
	});
	
	
	$('#addMessageInput').focus(function(){     			  			
		$(this).css('padding-bottom','0px');
		$('#addMessageIcon').remove();
		$('#addMessageIconsDiv').attr({
			hidden: false	
		});	
	});
	
	$('#addMessageInput').blur(function(){
		$(this).css('padding-bottom','6px');
		if($(this).val().length == 0){
			$(this).css('height','40px');
			$('#addMessageDiv').append('<i id="addMessageIcon" class="addMessageIcon glyphicon glyphicon-camera" style="position: absolute; padding: 10px 8px 6px 8px; right: 0px; cursor: pointer; font-size: 13pt; color:#3366BB;"></i>');
			$('#addMessageIconsDiv').attr({
				hidden: true	
			});
		}    	    			
	});
	
	$('.addMessageInput').on("input", function () {
		
		$(this).height('auto');
		$(this).height(this.scrollHeight);
		
		$('.letterCounter').empty();
		$('.letterCounter').html(letterMaxValue - ($(this).val().length));
		
		if(($(this).val().length != 0) && ($('.messageButton').attr('disabled') == 'disabled')){
			console.log("remove");
			$('.messageButton').removeAttr('disabled');
		}
		
		if(($(this).val().length == 0) && ($(this).attr('disabled') != 'disabled')){			
			$('.messageButton').prop("disabled", true);
			console.log("prop");
		}
	});   		
});



function previewImage(input) {
	if (input.files && input.files[0]) {
		//alert("input.files: " + input.files + "\n input.files[0]: " + input.files[0] + "\n input.files[1]: " + input.files[1]);
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $('#preview')
	        .attr('src', e.target.result)
	        .width(150)
	        .height(150);			        
	      
	      $('#previewDiv')
	      	.attr({
				hidden: false	
			});			      
	      
	    };
	   	reader.readAsDataURL(input.files[0]);
	}
};