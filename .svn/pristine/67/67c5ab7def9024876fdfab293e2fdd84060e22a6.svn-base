<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Cache-Control" content="No-Cache,Must-Revalidate,No-Store">
</head>
<body>
						<br/><br/><br/><br/><br/><br/>
	<h1>Access is denied</h1><br/><br/>

	<c:choose>
		<c:when test="${empty uname}">
			<h2>You do not have permission to access this page!</h2><br/><br/>
		</c:when>
		<c:otherwise>
			<h2>Username : ${uname} <br/>You do not have permission to access this page!</h2><br/><br/>
		</c:otherwise>
	</c:choose>
 <a href="<c:url value="/logout"/>"><b>Go To Login page</b></a>
</body>
</html>