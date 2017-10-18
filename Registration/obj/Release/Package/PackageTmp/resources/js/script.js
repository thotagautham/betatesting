$(document).ready(function() {
				$("#userForm").validate({
					rules: {
						fname: {
							required: true,
							minlength: 2
						},
						lname: {
							required: true,
							minlength: 2,
							checkName: true
						},
						country: {
							required: true
							
						},
						email: {
							required: true,
							email: true
						},
						phone: {
							required: true,
							phoneNumber: true
						}
					},
						
					messages: {
						fname: {
							required: "Required!",
							minlength: "Your first name must consist of at least 2 characters!"
						},
						lname: {
							required: "Required!",
							minlength: "Your last name must be at least 2 characters long!"
						},
						country: {
							required: "Please provide name of conutry! "
						},
						email: {
							required: "Required!",
							email: "enter valid email!"
						},
						phone: {
							required: "Required",
							phoneNumber: "Please enter valid phone number"
						}
					}
				});

				$.validator.addMethod("phoneNumber", function(value, element) {
					return this.optional(element) || /^[0-9\-\+\.\(..\)\s]+$/i.test(value); 
				}, "Please enter valid phone number"); 

				$.validator.addMethod("checkName", function(value, element) {
					return $('#fname').val() !== value; 
				}, "first name and last name should not be equal"); 
			});