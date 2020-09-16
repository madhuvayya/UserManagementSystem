<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
	href="${pageContext.request.contextPath}/css/blankpage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<script src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>	
<title>User Management</title>
</head>
<body>
	<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login");
    } 
    %>
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
						<p>Blank Page</p>
						<span class="page-description">Create your new page based
							on this starter page.</span>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / Blank Page
					</div>
				</div>
				<div class="content">
					<div class="content-title">Page Heading</div>
					<div class="content-body">Page content goes here..</div>
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