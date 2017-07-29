<style>
.be-detail-header {
	border-bottom: 1px solid #edeff2;
	margin-bottom: 50px;
}

body {
	background: linear-gradient(white, skyblue);
}
</style>
<header>
	<div class="topbar-left">
		<div class="text-center" id="logo">
			<a href="index.html" class="logo"><img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="" height="" width="250px" /></a>
		</div>
	</div>


</header>
<body>
	<div class="container be-detail-container">
		<div class="row" align="center">
			<div class="col-sm-6 col-sm-offset-3">
				<br> <img
					src="https://cdn2.iconfinder.com/data/icons/luchesa-part-3/128/SMS-512.png"
					class="img-responsive"
					style="width: 200px; height: 200px; margin: 0 auto;"><br>

				<h1 class="text-center">Verify your mobile number</h1>
				<br>

				<form method="post" id="veryfyotp" action="">
					<div class="row">
						<div class="form-group col-sm-8">
							<span style="color: red;"></span> <a href="">Resend OTP</a>
						</div>
					</div>

				</form>

				<form method="post" id="veryfyotp" action="">
					<div class="row">
						<div class="form-group col-sm-8">
							<span style="color: red;"></span> <input type="text"
								style="width: 300px; height: 30px; border-radius: 10px"
								class="form-control" name="mobileNumber"
								placeholder="Enter your mobile number" required="required"
								maxlength="10">
						</div>
						<br>
						<div class="form-group col-sm-8">
							<span style="color: red;"></span><input type="text"
								style="width: 300px; height: 30px; border-radius: 10px"
								class="form-control" name="otp"
								placeholder="Enter your OTP number" required="required"
								maxlength="6">
						</div>
						<br>
						<button type="submit" class="btn btn-primary  pull-right col-sm-3"
							style="background-color: #1569C7; height: 35px; width: 70px; border-radius: 10px; color: white;">Verify</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button"
							onclick="javascript:window.location=${pageContext.request.contextPath}/"
							class="btn btn-primary  pull-right col-sm-3"
							style="background-color: #1569C7; height: 35px; width: 70px; border-radius: 10px; color: white;">Back</button>
					</div>
				</form>
				<br> <br>
			</div>
		</div>
	</div>
</body>
<footer>
	<div align="left">&copy;2017 Telangana Handlooms. All rights
		reserved.</div>
	<div align="right">
		Powered by <a href="http://kdms.in/" target="_blank">KDMSL</a>
	</div>

</footer>