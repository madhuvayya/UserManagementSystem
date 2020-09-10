<%@page import="com.bridgelabz.usermanagementsystem.model.Permissions"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/mi-logo.jpg">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-4.5.2-dist/css/bootstrap.min.css">
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
	<%
		List<String> userHistory = (List<String>) request.getAttribute("userHistory");
		Permissions permissions = (Permissions) request.getAttribute("permissions");
		User userGeneralDetails = (User) request.getAttribute("user");
	%>
	<div class="dashboard-page-body">
		<%@include file="header.jsp"%>
		<div class="sidenav-content">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content">
				<div class="content-heading">
					<div class="page-title">
						<span>Welcome ${username}</span><br> <span class="last-login">
							You last logged in on:<%=userHistory.get(userHistory.size() - 1)%></span>
					</div>
					<div class="home-link">
						<i class="ti-home"></i><a href="dashboard">Home</a> / Dashboard
					</div>
				</div>
				<div class="content">
					<div class="counter-divs">
						<div class="user-count-display-div">
							<a href="UserList">
								<div class="count-div">
									<div class="icon-bg total-user-bg-color">
										<i class="ti-user"></i>
									</div>
									<div>
										<b class="title">TOTAL</b> <br> <span class="value">164</span>
									</div>
								</div>
							</a>
						</div>
						<div class="user-count-display-div">
							<a href="">
								<div class="count-div">
									<div class="icon-bg active-bg-color">
										<i class="ti-check"></i>
									</div>
									<div>
										<b class="title">ACTIVE</b> <br> <span class="value">163</span>
									</div>
								</div>
							</a>
						</div>
						<div class="user-count-display-div">
							<a href="">
								<div class="count-div">
									<div class="icon-bg inactive-bg-color">
										<i class="ti-na"></i>
									</div>
									<div>
										<b class="title">INACTIVE</b> <br> <span class="value">1</span>
									</div>
								</div>
							</a>
						</div>
						<div class="user-count-display-div">
							<a href="">
								<div class="count-div">
									<div class="icon-bg online-bg-color">
										<i class="ti-eye"></i>
									</div>
									<div>
										<b class="title">ONLINE</b> <br> <span class="value">2</span>
									</div>
								</div>
							</a>
						</div>
					</div>
					<div class="registrations-divs">
						<div class="all-time-registrations">
							<div class="header-title">All Time Registration History</div>
							<div class="body">
								<div class="graph">graph</div>
								<div class="percentage-divs">
									<div>
										<div class="graphs-right-titles">Top locations</div>
										<table>
											<tbody>
												<tr>
													<td style="width:10%;">1</td>
													<td style="width:80%;">madhu</td>
													<td style="width:10%;">26</td>
												</tr>
												<tr>
													<td>2</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>3</td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</table>
										<div><a href="">See All Locations</a></div>
									</div>
									<div>
										<div class="graphs-right-titles">Gender</div>
										<table>
											<tr>
												<td>Male</td>
												<td>32%</td>
											</tr>
											<tr>
												<td>
												<progress id="male-percentage" value="32" max="100"></progress>
												</td>
											</tr>
												<tr>
												<td>Female</td>
												<td>32%</td>
											</tr>
											<tr>
												<td>
												<progress id="female-percentage" value="50" max="100"></progress>
												</td>
											</tr>
										</table>
									</div>
									<div>
										<div class="graphs-right-titles">Age Group</div>
										<table>
											<tbody>
												<tr>
												<td style="width:10%;">18-22</td>
												<td style="width:90%;"><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>23-27</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>28-37</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>33-37</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>38-42</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>over 42</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
												<tr>
												<td>under 18</td>
												<td><progress id="age" value="50" max="100"></progress></td>
												</tr>
											</tbody>																				
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="latest-registrations">
							<div class="header-title">
								<div>Latest Registration</div>
								<div>
									<a href="UserList">Load More</a>
								</div>
							</div>
							<div class="body user-list-body">
								<table>
									<%
										List<User> userList = (List<User>) request.getAttribute("userList");	
										  for (User user : userList) { %>
									<tr>
										<td>
											<div class="user-list">
												<div><img src="data:image/jpg;base64,<%=user.getUserDiplayingImage()%>" 
										style="width: 30px; height: 30px;padding:0px;margin:50%"/></div>	
												<div>
													<a id="edit-deails" href="UserDetails?userId=<%=user.getUserId()%>" style="cursor: pointer;"
												title="Edit User Details"></a>
													<span></span>
												</div>
											</div>
										</td>
									<tr>
									<% } %>	
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
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