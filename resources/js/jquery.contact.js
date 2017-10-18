$(document).ready(function() {
	var alreadyDrawn = false;
	contactmini_initialize();
	var feed = $('#sidecontact');
	feed.css("display", "block").data("showing", false).children("form").hide()
	feed.children("img").click(function() {
		var t = feed;
		if(t.data("showing") == false) {
			t.animate({
				marginRight: "0",
				height: "280px"
			}).data("showing", true).children("img").attr("src", "images/btn-showhide_contact.gif").css("top", "0").siblings().show();
			pageTracker._trackPageview('/contact/miniform/open');
			if (!alreadyDrawn) {
				alreadyDrawn = true;
				$("#upload").uploadify({
	  				'uploader'		: '/js/uploadify/uploadify.swf',
					'script'		: '/js/uploadify/uploadify.php',
					'cancelImg'		: '/js/uploadify/cancel.png',
					'folder'		: '/admin/uploads',
					'auto'			: true,
					'multi'			: false,
					'fileExt'		: '*.doc; *.docx; *.pdf; *.txt; *.jpg',
					'fileDesc'		: '*.doc; *.docx; *.pdf; *.txt; *.jpg',
					'onComplete'	: function(event, ID, fileObj, response, data) {
							$("#uploadspan").hide();
							$("#uploadfile").val('/admin/uploads/' + fileObj.name);
							$("#fupload").html('<label>File "'+fileObj.name+'" is ready to send.</label>');
							
						}
					
			  	});
			}
		} else {
			t.animate({
				marginRight: "-306px",
				height: "280px"
			}).data("showing", false).children("img").attr("src", "images/btn-showhide_contact.gif").css("top", "0").siblings().hide();
			pageTracker._trackPageview('/contact/miniform/close');
			
		}
	})
	
	$.fn.pause = function(duration) {
    	$(this).animate({ dummy: 1 }, duration);
    	return this;
	};
	
	/*$('#msbutton').click(function(){
		if (validateminiForm()) {
		
			dataString = $("#frmMini").serialize();
			$.ajax( {
				type: "POST",
				url: "/contact/miniformsubmit.php?m=mfs",
				data: dataString,
				success: function(html){
					$("#sidecontact").html(html).pause(2000).fadeOut(250);
					$("#sidecontact").html(html);
					pageTracker._trackPageview('/contact/miniform/submit');
					return false;
				}
			});
		}
		return false;
	});*/
	
}); //end document ready

function contactmini_initialize() {
	hideError();
	$("#mphone").mask("(999) 999-9999",{placeholder:" "});
}
function validateminiForm() {

	$isValid = 1;
	clearErrors();
	if ($("#txtName").val()=='') {
		$("#txtName").addClass("error-input");
		$isValid = 0;
	}
	
	if ($("#txtMessage").val()=='') {
		$("#").addClass("error-input");
		$isValid = 0;
	}
	
	if ($("#phone").val()=='') {
		$("#phone").addClass("error-input");
		$isValid = 0;
	}
	
	if ($("#txtEmail").val()>'') {
		if ( !isValidEmailAddress($("#txtEmail").val()) ) {
			$("#txtEmail").addClass("error-input");
			$isValid = 0;
		}
	} else {
		$("#txtEmail").addClass("error-input");
		$isValid = 0;
	}
	
	if (!$isValid) {
		showError();
	}
	
	return $isValid;
}
function hideError() {
	$('#ferror').hide();
}
function showError() {
	$('#ferror').show();
}
function clearErrors() {
	
	$('input').removeClass('error-input');
	hideError();
}
function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}