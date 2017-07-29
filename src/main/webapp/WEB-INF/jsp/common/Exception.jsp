<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control"
	content="No-Cache,Must-Revalidate,No-Store">
</head>
<body>
	<div class="innerpage-content-bg">
		<div id="pagecontainer">
			<br />
			<br />
			<div class="container">
				<br />
				<br />
				<h2>Alerts</h2>
				<br />
				<br />
				<div class="alert alert-danger" align="center">
				
					<br /><h4> Click <a href="<c:url value="/logout"/>"><b>here</b></a> to go back and login.</h4><br />
					<br /> <strong>Sorry!</strong>&nbsp;&nbsp;Something went wrong<br />
					<br /> <strong>${url}</strong><br />
					<br /> <strong>${exception}</strong><br />
					

				</div>
			</div>
		</div>
	</div>
</body>
</html>