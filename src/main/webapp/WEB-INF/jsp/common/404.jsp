<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Cache-Control"
	content="No-Cache,Must-Revalidate,No-Store">
</head>
<body>
<div class="signinpanel">
        <div class="row">
            <div class="col-md-7">
                <div class="signin-info">
                  <div class="logopanel">
                        <h1><span><img src="${pageContext.request.contextPath}/resources/images/h-logo.png" class="img-responsive" alt="" /></span></h1>
                    </div>
                     <p>
			<h1>
				The page you requested is not available.<br /> You might try
				returning to the <a
					href="${pageContext.request.contextPath}/j_spring_security_logout">Login</a>.
			</h1>
			</p> </div>
            </div>
            
        </div>
       <div class="signup-footer">
          <div class="pull-left">
            &copy;2017 Telangana Handlooms. All rights reserved.
          </div>
          <div class="pull-right">
            Powered by <a href="http://kdms.in/" target="_blank">KDMSL</a>
          </div>
        </div>
    </div>
	
</body>
</html>