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
	<div class="dashboard-page-body">
		<%@include file="header.jsp"%>
		<div class="sidenav-content">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content">
				<div class="content-heading">
					<div class="page-title">
						<span>Welcome ${username}</span><br> <span class="last-login">
							You last logged in on: ${lastLoginTime}</span>
					</div>
					<div class="home-link">
						<i class="ti-home"></i><a href="dashboard">Home</a> / Dashboard
					</div>
				</div>
				<div class="content">
					<div class="counter-divs">
						<div class="user-count-display-div">
							<a href="">
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
										<div>Top locations</div>
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
										Gender
										<table>
											<tbody>
												<tr>
													<td>
														<ul class="list-unstyled task-list no-margin">
															<li class="no-padding no-margin">
																<p style="color: #5e6773; font-size: 13px;"
																	class="no-margin">
																	<label id="lblGender">Male</label> 
																	<label id="lblPercentage" class="label-percent">68.9%</label>
																</p>
																<div
																	class="progress progress-xs progress-transparent custom-color-lightseagreen no-margin">
																	<div id="divPercentageBar"
																		class="progress-bar progress-bar-danger"
																		role="progressbar" aria-valuemin="0"
																		aria-valuemax="100" style="width: 68.9%">
																		<span class="sr-only"> <label
																			id="lblPercentageBar">68.9%</label>
																		</span>
																	</div>
																</div>
															</li>
														</ul>
													</td>
												</tr>
												<tr>
													<td>
														<ul class="list-unstyled task-list no-margin">
															<li class="no-padding no-margin">
																<p style="color: #5e6773; font-size: 13px;"
																	class="no-margin">
																	<label id="lblGender">Female</label> 
																	<label id="lblPercentage" class="label-percent">31.1%</label>
																</p>
																<div
																	class="progress progress-xs progress-transparent custom-color-lightseagreen no-margin">
																	<div id="divPercentageBar"
																		class="progress-bar progress-bar-danger"
																		role="progressbar" aria-valuemin="0"
																		aria-valuemax="100" style="width: 31.1%">
																		<span class="sr-only"> <label
																			id="lblPercentageBar">31.1%</label>
																		</span>
																	</div>
																</div>
															</li>
														</ul>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div>Age Group</div>
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
							<div class="body">body</div>
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