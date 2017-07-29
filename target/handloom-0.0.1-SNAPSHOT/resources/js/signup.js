function regFormSubmit() {
	//alert("hi");
	/* $("#regForm").submit(); */

	document.getElementById("email").value;
	document.getElementById("userPassword").value;
	document.getElementById("aadharNumber").value;
	document.getElementById("mobile").value;

	var signUp = {
		"name" : document.getElementById("name").value,
		"email" : document.getElementById("email").value,
		"password" : document.getElementById("userPassword").value,
		"aadharNumber" : document.getElementById("aadharNumber").value,
		"mobile" : document.getElementById("mobile").value,
		"otp" : ""
	};

	//alert(signUp);

	$.ajax({
		url : './saveRegistrationForm',
		type : 'POST',
		data : JSON.stringify(signUp),
		contentType : "application/json",
		success : function(data) {
			// successmessage = 'Data was succesfully captured';
       
				if (data.otp == 'success') {
					//alert(data.mobile);
				 $(".imdtmobileNumber").val(data.mobile);
				$("#myModalOTPImadiateCheck").modal("toggle");
			} else {
				$("#otpError").html("Activity failed Please SignUp again");
				$("#myModalError").modal("toggle");
			}
		},
		error : function(data) {
			// successmessage = 'Error';
			// alert(successmessage+" "+data);
			$("#otpError").html("Something went wrong Please try again");
			$("#myModalError").modal("toggle");
		},
	});

	//  $("#myModalOTPCheck").modal("toggle");
}

function otpenter() {

	$("#myModalOTPCheck").modal("toggle");
	// $("#myModalErrorOTPCheck").modal("toggle");
	//	$("#myModalrequestErrorOTPCheck").modal("toggle");

}
function checkOTPNumber() {
	/*alert(document.getElementById("mobileNumber").value + " "
			+ document.getElementById("otp").value);*/
	var signUp = {
		"name" : "",
		"email" : "",
		"password" : "",
		"aadharNumber" : "",
		"mobile" : document.getElementById("mobileNumber").value,
		"otp" : document.getElementById("otp").value
	};

	$.ajax({
		url : './checkOTP',
		type : 'POST',
		data : JSON.stringify(signUp),
		dataType : "text",
		contentType : "application/json",
		success : function(data) {
			// successmessage = 'Data was succesfully captured';
			//alert(successmessage +" "+data);
			if (data == 'success') {
				$("#myModalOTPCheck").modal("toggle");
				$("#otpError").html("your Account successfully Activated");
				$("#myModalError").modal("toggle");
			} else {
				$("#otpError").html("Invalid OTP Please try again");
				$("#myModalError").modal("toggle");
			}
		},
		error : function(data) {
			// successmessage = 'Error';
			// alert(successmessage+" "+data);
			$("#otpError").html("Somthing went wrong Please try again");
			$("#myModalError").modal("toggle");
		},
	});

}


function imdtCheckOTPNumber() {
	/*alert(document.getElementById("imdtmobileNumber").value + " "
			+ document.getElementById("imdtotp").value);*/
	var signUp = {
		"name" : "",
		"email" : "",
		"password" : "",
		"aadharNumber" : "",
		"mobile" : document.getElementById("imdtmobileNumber").value,
		"otp" : document.getElementById("imdtotp").value
	};

	$.ajax({
		url : './checkOTP',
		type : 'POST',
		data : JSON.stringify(signUp),
		dataType : "text",
		contentType : "application/json",
		success : function(data) {
			// successmessage = 'Data was succesfully captured';
			//alert(successmessage +" "+data);
			if (data == 'success') {
				$("#myModalOTPImadiateCheck").modal("toggle");
				$("#otpError").html("your Account successfully Activated");
				$("#myModalError").modal("toggle");
			} else {
				$("#otpError").html("Invalid OTP Please try again");
				$("#myModalError").modal("toggle");
			}
		},
		error : function(data) {
			// successmessage = 'Error';
			// alert(successmessage+" "+data);
			$("#otpError").html("Something went wrong Please try again");
			$("#myModalError").modal("toggle");
		},
	});

}

function resendOTPNumber() {
	/*alert(document.getElementById("mobileNumber").value + " "
			+ document.getElementById("otp").value);*/
	var signUp = {
		"name" : "",
		"email" : "",
		"password" : "",
		"aadharNumber" : "",
		"mobile" : document.getElementById("mobileNumber").value,
		"otp" :""
	};

	$.ajax({
		url : './resendOTP',
		type : 'POST',
		data : JSON.stringify(signUp),
		dataType : "text",
		contentType : "application/json",
		success : function(data) {
			// successmessage = 'Data was succesfully captured';
			//alert(successmessage +" "+data);
			if (data == 'success') {
			//	$("#myModalOTPCheck").modal("toggle");
				$("#otpError").html("OTP Successfully sent to your mobile number");
				$("#myModalError").modal("toggle");
			} else {
				$("#otpError").html("Something went wrong Please try again");
				$("#myModalError").modal("toggle");
			}
		},
		error : function(data) {
			// successmessage = 'Error';
			// alert(successmessage+" "+data);
			$("#otpError").html("Something went wrong Please try again");
			$("#myModalError").modal("toggle");
		},
	});

}


function imdtresendOTPNumber() {
	//alert(document.getElementById("imdtmobileNumber").value);
	var signUp = {
		"name" : "",
		"email" : "",
		"password" : "",
		"aadharNumber" : "",
		"mobile" : document.getElementById("imdtmobileNumber").value,
		"otp" :""
	};

	$.ajax({
		url : './resendOTP',
		type : 'POST',
		data : JSON.stringify(signUp),
		dataType : "text",
		contentType : "application/json",
		success : function(data) {
			// successmessage = 'Data was succesfully captured';
			//alert(successmessage +" "+data);
			if (data == 'success') {
			//	$("#myModalOTPCheck").modal("toggle");
				$("#otpError").html("OTP Successfully sent to your mobile number");
				$("#myModalError").modal("toggle");
			
			} else {
				$("#otpError").html("Something went wrong Please try again");
				$("#myModalError").modal("toggle");
			}
		},
		error : function(data) {
			// successmessage = 'Error';
			// alert(successmessage+" "+data);
			$("#otpError").html("Something went wrong Please try again");
			$("#myModalError").modal("toggle");
		},
	});

}

