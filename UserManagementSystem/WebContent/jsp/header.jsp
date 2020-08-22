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
			<button><i class='ti ti-arrow-circle-right'></i></button>
		</div>
		<div class="logged-info">
			<img src="" alt="image" />
			<button>${userName}</button>
		</div>
	</nav>
</body>
</html>