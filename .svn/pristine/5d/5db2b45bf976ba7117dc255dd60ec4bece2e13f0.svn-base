/* login captcha call */
function refreshCaptcha() {
	var val = null;
	$("#captchaImage").attr("src", val);

	var fileId = $(this).prop('value');
	var token = document.getElementById("csrfid").value;
	var url = "./captcha";

	$.post(url, fileId + "&_csrf=" + token, function(data) {
		var val = data;
		$("#captchaImage").attr("src", val.CaptchaImage);
		$("#captchaImage").attr("title", val.CaptchaString);

	});

}