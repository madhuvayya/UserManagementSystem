<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "icon" type = "image/png" href = "${pageContext.request.contextPath}/resources/images/mi-logo.jpg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themify-icons.css"> 
<title>User Management</title>
</head>
<body> 
	<%@include file="header.jsp"%>
	<div class="container">
		<%@include file="sideNavbar.jsp"%>
		<div class="main-content">
			<div class="content-heading">
				<div class="page-title">
					<h4>New User</h4>
				</div>
				<div class="home-link">
					<i class="ti-home"></i><a href="#">Home</a> / New User 
				</div>  
			</div>
			<div class="content"> content </div>
		</div>
	</div>
</body>
</html>