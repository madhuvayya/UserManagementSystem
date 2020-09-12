<%@page import="com.sun.org.apache.bcel.internal.generic.INEG"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.Permissions"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Formatter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/mi-logo.jpg">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
		List<String> userHistory = (List<String>) session.getAttribute("userHistory");
		Permissions permissions = (Permissions) session.getAttribute("permissions");
		User userGeneralDetails = (User) session.getAttribute("user");
		List<User> userList = (List<User>) session.getAttribute("userList");
		List<Integer> usersCounter = (List<Integer>)  session.getAttribute("usersCounter");
		List<Country> numberOfUsersByCountry = (List<Country>) session.getAttribute("numberOfUsersByCountry");
		List<Double> usersPercentegeListBasedOnGender = (List<Double>) session.getAttribute("usersPercentegeListBasedOnGender");
		List<Integer> numberOfUsersByAgeGroup = (List<Integer>)  session.getAttribute("numberOfUsersByAgeGroup");
		List<String> registeredMonths = (List<String>) session.getAttribute("registeredMonths");
		List<Integer> registeredUsersByMonths = (List<Integer>) session.getAttribute("registeredUsersByMonths");
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
										<b class="title">TOTAL</b> <br> <span class="value"><%=usersCounter.get(0)%></span>
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
										<b class="title">ACTIVE</b> <br> <span class="value"><%=usersCounter.get(1)%></span>
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
										<b class="title">INACTIVE</b> <br> <span class="value"><%=usersCounter.get(2)%></span>
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
								<div class="graph">
										<div>
											<button class="graph-button">All Time</button>
											<button class="graph-button"><%=Calendar.getInstance().get(Calendar.YEAR)%></button>
											<button class="graph-button"><%=new Formatter().format("%tB", Calendar.getInstance())%></button>																						
										</div>
										<div class="graph-div">	
									      <canvas id="registrations-graph"></canvas>
									    </div> 
								</div>
								<div class="percentage-divs">
									<div>
										<div class="graphs-right-titles">Top locations</div>
										<table>
											<tbody>
												<%  for(int i = 0; i <= 2;i++ ) { %>
												<tr>
													<td style="width:10%;"><%= i+1 %></td>
													<td style="width:80%;"><%=numberOfUsersByCountry.get(i).getCountryName()%></td>
													<td style="width:10%;"><%=numberOfUsersByCountry.get(i).getNumberOfUsers()%></td>
												</tr>
												<% } %>
											</tbody>
										</table>
										<div><a href="">See All Locations</a></div>
									</div>
									<div class="gender-div">
										<div class="graphs-right-titles">Gender</div>
										<table>
											<tr>
												<td style="width:80%;">Male</td>
												<td style="width:10%;"><%=usersPercentegeListBasedOnGender.get(0)%></td>
											</tr>
											<tr>
												<td>
												<progress id="age-progress-bar" value="<%=usersPercentegeListBasedOnGender.get(0)%>" max="100"></progress>
												</td>
											</tr>
												<tr>
												<td style="width:80%;">Female</td>
												<td style="width:10%;"><%=usersPercentegeListBasedOnGender.get(1)%></td>
											</tr>
											<tr>
												<td>
												<progress id="age-progress-bar" value="<%=usersPercentegeListBasedOnGender.get(1)%>" max="100"></progress>
												</td>
											</tr>
										</table>
									</div>
									<div>
										<div class="graphs-right-titles">Age Group</div>
										<div style="margin-bottom: -30px">	
											<canvas id="registered-users-horizantal-bar"></canvas>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="latest-registrations">
							<div class="header-title">
								<div>Latest Registration</div>
								<div>
									<a id="load-more-anchor" href="UserList">Load More</a>
								</div>
							</div>
							<div class="body user-list-body">
								<table>
									<%  for(int i = userList.size()-1; i >= userList.size() - 6;i-- ) { %>
									<tr>
										<td>
											<div class="user-list">
												<div><img class="user-image" src="data:image/jpg;base64,<%=userList.get(i).getUserDiplayingImage()%>"/>      				
												</div>	
												<div>
													<a id="edit-deails" href="UserDetails?userId=<%=userList.get(i).getUserId()%>"
												title="Edit User Details"><%= userList.get(i).getFirstName() +" "+ userList.get(i).getLastName()%></a><br>
													<span class="registered-time"><%=userList.get(i).getCreatorStamp()%></span>
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
	<script src="${pageContext.request.contextPath}/scripts/chartScripts.js"></script>
	<script type="text/javascript" src ="${pageContext.request.contextPath}/scripts/CommonScript.js"></script>
	<script type="text/javascript">
    if('${registeredUsersByMonths}' !== '') {
    	getUserRegistrationGraph('${registeredMonths}',${registeredUsersByMonths});
    }

    if('${numberOfUsersByAgeGroup}' !== '') {
    	getUsersAgeGroupHorizantalBar(${numberOfUsersByAgeGroup});
    }		
	</script>
</body>
</html>