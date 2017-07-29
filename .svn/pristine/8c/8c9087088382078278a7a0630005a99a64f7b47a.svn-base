<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="No-Cache,Must-Revalidate,No-Store">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta content="" name="description" />
 <meta content="" name="author" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/core.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/icons.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/material-design-iconic-font.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/components.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css">
 <link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">

 <script>
            var resizefunc = [];
        </script>
 
        
        
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
		$(document).ready(function () {
			$('#example1').datepicker({
				format: "dd/mm/yyyy"
			});
			$('#example2').datepicker({
				format: "dd/mm/yyyy"
			}); 
		});
    </script>
    <script type="text/javascript">
        $('.btnNext').click(function(){
		  $('.nav-tabs > .active').next('li').find('a').trigger('click');
		});
		$('.btnPrevious').click(function(){
		  $('.nav-tabs > .active').prev('li').find('a').trigger('click');
		});
    </script>
<!--         <script src="assets/js/jquery.min.js"></script> -->
        
 <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
 <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
 <!--[if lt IE 9]>
 <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
 <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
 <![endif]-->
 <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
 <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
</head>

<body class=" fixed-left">
 <div id="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="menu" /> 
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
		 </div>
</body>

</html>
