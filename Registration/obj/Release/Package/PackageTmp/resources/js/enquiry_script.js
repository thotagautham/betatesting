$(document).ready(function() {
				$("#enquiryForm").validate({
					rules: {
						name: {
							required: true,
							minlength: 2
						},
						email: {
							required: true,
							email: true
						},
						mobile: {
							required: true,
							phoneNumber: true
						},
						country: {
							required: true
							
						},
						state: {
							required: true,
							minlength: 2
						},
						query: {
							required: true
						},
						CaptchaCode: {
							required: true,
							minlength: 5	
						}
					},
						
					messages: {
						name: {
							required: "Required!",
							minlength: "Your name must consist of at least 2 characters!"
						},
						email: {
							required: "Required!",
							email: "enter valid email!"
						},
						mobile: {
							required: "Required",
							phoneNumber: "Please enter valid phone number!"
						},
						country: {
							required: "Required!"
						},
						state: {
							required: "Required!",
							minlength: " At least 2 characters long!"
						},
						query: {
							required: "Required!"
						},
						CaptchaCode: {
							required: "Required!",
							minlength: "Enter 5 characters"	
						}
					}
				});

				$.validator.addMethod("phoneNumber", function(value, element) {
					return this.optional(element) || /^[0-9\-\+\.\(..\)\s]+$/i.test(value); 
				}, "Please enter valid phone number"); 

				
			});