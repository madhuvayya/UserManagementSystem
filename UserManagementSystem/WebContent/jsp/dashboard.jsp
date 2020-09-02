<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/mi-logo.jpg">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>User Management</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container">
		<%@include file="sideNavbar.jsp"%>
		<div class="main-content">
			<div class="content-heading">
				<div class="page-title">
					<span>Welcome ${username}</span><br>
					<span class="last-login"> You last logged in on: ${lastLoginTime}</span>
				</div>
				<div class="home-link">
					<i class="ti-home"></i><a href="dashboard">Home</a> / Dashboard
				</div>
			</div>
			<div class="content">content</div>
		</div>
	</div>
	<script>
		
	<%@include file="../js/dropdown.js" %>
		
	<%@include file="../js/showOptions.js" %>
		
	<%@include file="../js/toggleSideNavBar.js" %>
		
	<%@include file="../js/UserRolePermissions.js" %>
		
	</script>

</body>
</html>