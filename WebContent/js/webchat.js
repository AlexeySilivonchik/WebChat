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
	
	
	registerFormValidation();	
	
	editProfileEvent();
});


function registerFormValidation(){
	
	var passwordRegexp = new RegExp("^\\w+@{1}\\w+[.]{1}\\w{2,4}$","m");
	
	$('#registerName').focus(function(){
		if($(this).val().length != 0){
			$('#registerNameOk').attr({
				hidden: true
			});
		}
	});
	
	$('#registerName').blur(function(){
		if($(this).val().length != 0){
			$('#registerNameOk').attr({
				hidden: false
			});
		}
	});
	
	$('#registerEmail').focus(function(){
		if($(this).val().length != 0){
			$('#registerEmailOk').attr({
				hidden: true
			});
			
			$('#registerEmailRemove').attr({
				hidden: true
			});
			
			$('#registerEmail').css('border-color', '#66afe9');
		}
	});
	
	$('#registerEmail').blur(function(){
		if($(this).val().length != 0){			
			if(passwordRegexp.test($(this).val())){
				$('#registerEmailOk').attr({
					hidden: false
				});
				
				$('#registerEmail').css('border-color', '#ccc');
			} else {
				$('#registerEmailRemove').attr({
					hidden: false
				});
				
				$('#registerEmail').css('border-color', 'red');
			}
			
		} else {
			$('#registerEmail').css('border-color', '#ccc');			
		}
	});
	
	$('#registerPassword').focus(function(){
		if($(this).val().length != 0){
			$('#registerPasswordOk').attr({
				hidden: true
			});
		}
	});
	
	$('#registerPassword').blur(function(){
		if($(this).val().length != 0){
			$('#registerPasswordOk').attr({
				hidden: false
			});
		}
	});
};


function previewImage(input) {
	if (input.files && input.files[0]) {
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


function editProfileEvent(){
	$('#editProfileSave').on('click', function(){
		$('#userEditForm').submit();
	});
	
	$('.userEditColorPalette').on('click', function(){
		alert($(this).css('background-color'));
	});
	
	$('#editProfile').on('click', function(){
		editProfile();
	});
	
	$('#editProfileCancel').on('click', function(){
		editProfileCancel();
	});
};


function editProfile(){
	$('.navbar').css('pointer-events','none');
	$('.navbar').css('opacity','0.2');
	$('.notEditable').css('pointer-events','none');
	$('.notEditable').css('opacity','0.2');	
	
	$('#editProfile').css('display','none');	
	$('#editProfileCancel').css('display','block');	
	$('#editProfileSave').css('display','block');
	
	$('#userInfo').css('display', 'none');
	$('#userEditInfo').css('display', 'block');
};


function editProfileCancel(){
	$('.navbar').css('pointer-events','auto');
	$('.navbar').css('opacity','1');
	$('.notEditable').css('pointer-events','auto');
	$('.notEditable').css('opacity','1');
	
	$('#editProfile').css('display','block');	
	$('#editProfileCancel').css('display','none');	
	$('#editProfileSave').css('display','none');
	
	$('#userInfo').css('display', 'block');
	$('#userEditInfo').css('display', 'none');
};


