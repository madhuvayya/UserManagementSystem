<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
	<%@include file="../js/dropdown.js" %>
	<%@include file="../js/toggleSideNavBar.js" %>
</script>
</head>
<body>
	<nav class="header">
		<div class="app-name">
			<p>User Management</p>
			<button class="arrow-circle" onclick="toggleSideNavBar()"><i id="toggling-icon" class='ti ti-arrow-circle-left'></i></button>
		</div>
		<div class="logged-info" onclick="myFunction('myDropdown')">
			<div class="dropdown">
			<button  class="dropbtn"> <img src="" alt="image" /> ${username}</button>
			  <div id="myDropdown" class="dropdown-content">
    				<span class="profile"><a href=""><i class='ti-user'></i>&nbsp Profile</a></span>
    				<span class="logout"><a href="logout"><i class='ti-power-off'></i>&nbsp Logout</a></span>
  			</div>
			</div>
		</div>
	</nav>
</body>
</html>