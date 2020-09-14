<%@page import="com.bridgelabz.usermanagementsystem.model.Country"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-4.5.2-dist/css/bootstrap.min.css">
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/mi-logo.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/top-locations.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themify-icons.css">
<title>User Management</title>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="sub-container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>Top Locations</p>
					</div>
					<div class="home-link">
						<a href="dashboard">
						<i class="ti-home"></i> 
						Home </a>/<a href="dashboard"> Dashboard </a> / Top Locations
					</div>
				</div>
				<span>${message}</span>
				<div class="content">
					<div>
						<p class="content-title">Top Locations</p>
					</div>
					<div class="content-body">
							<table class="table table-fluid" id="myTable" style="border-bottom-style: none;;">
								<thead>
									<tr>
										<th>Country</th>
										<th>Users</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<Country> usersByCountry = (List<Country>) session.getAttribute("numberOfUsersByCountry");	
										  for (Country country : usersByCountry) { %>
									<tr>
										<td><%=country.getCountryName()%></td>
										<td><%=country.getNumberOfUsers()%></td>										
									</tr>
									<% } %>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/CommonScript.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		if(${user.getRole() == 'User'}) {
            $('#dashboard').hide();
            $('#settings-options').hide();
		}
	});
	
	
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
	</script>
</body>
</html>