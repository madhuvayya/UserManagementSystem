<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themify-icons.css">
</head>
<body>
	<nav class="header">
		<div class="app-name">
			<p>User Management</p>
			<button class="arrow-circle" onclick="toggleSideNavBar()"><i class='ti ti-arrow-circle-right'></i></button>
		</div>
		<div class="logged-info" onclick="myFunction('myDropdown')">
			<div class="dropdown">
			<button  class="dropbtn"> <img src="" alt="image" /> ${username}</button>
			  <div id="myDropdown" class="dropdown-content">
    				<span class="profile"><a href=""><i class='ti-user'></i>&nbsp Profile</a></span>
    				<span class="logout"><a href=""><i class='ti-power-off'></i>&nbsp Logout</a></span>
  			</div>
			</div>
		</div>
	</nav>
	<script>
		<%@include file ="../js/dropdown.js" %>
		<%@include file ="../js/toggleSideNavBar.js" %>
	</script>
</body>
</html>