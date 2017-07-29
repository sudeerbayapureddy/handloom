
<div class="topbar">
	<div class="topbar-left">
		<div class="text-center" id="logo">
			<a href="index.html" class="logo"><img
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				alt="" /></a>
		</div>
	</div>
	<div class="navbar navbar-default" role="navigation">
		<div class="container">
			<div class="">
				<div class="pull-left">
					<button id="bars" type="button"
						class="button-menu-mobile open-left">
						<i class="fa fa-bars"></i>
					</button>
					<span class="clearfix"></span>
				</div>
				<!-- <form class="navbar-form pull-left" role="search">
                              
                                <div class="form-group">
                                    <input type="text" class="form-control search-bar" placeholder="Type here for search..."> 
                                </div>
                                <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
                                
                            </form>
                            -->

				<ul class="nav navbar-nav navbar-right pull-right">
					<li class="dropdown"><a href="#"
						class="dropdown-toggle profile" data-toggle="dropdown"
						aria-expanded="true">Welcome ${name}&nbsp;&nbsp;<img
							src="${pageContext.request.contextPath}/resources/images/user.png"
							alt="user-img" class="img-circle">
					</a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)"><i
									class="zmdi zmdi-face"></i> Profile</a></li>
							<li><a href="change-password.html"><i
									class="zmdi zmdi-lock-outline"></i> Change Password</a></li>
							<li><a
								href="${pageContext.request.contextPath}/j_spring_security_logout"><i
									class="zmdi zmdi-power-setting"></i> Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</div>
