<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/mi-logo.jpg">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dbConnection.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>	
<title>User Management</title>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user"); 
	%>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<span>Database Connection</span><br> <span
							class="page-description">Configure database connection</span>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / Database
						Connection
					</div>
				</div>
				<div class="content">
					<div class="content-title">Configure Database Connection</div>
					<div class="content-body">
						<div class="form-group">
							<label for="host" class="control-label">Connection String</label>
							<input name="connection-string" type="text"
								value="Data Source=.;Initial Catalog=myDb;User ID=sa;Password=******"
								id="cphBody_txtConnectionString" class="form-control">
						</div>
						<div class="form-group">
							<input type="submit" name="submit" value="Save" id="submit"
								class="submit">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/scripts/CommonScript.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		if(${user.getRole() == 'User'}) {
            $('#dashboard').hide();
            $('#settings-options').hide();
		}
	});
	</script>
</body>
</html>