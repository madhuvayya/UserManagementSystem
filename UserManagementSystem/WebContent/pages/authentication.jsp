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
	href="${pageContext.request.contextPath}/css/authentication.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<script src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>		
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
						<p>Authentication</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> /
						Authentication
					</div>
				</div>
				<div class="content">
					<div class="general-div panel">
						<div class="panel-title">General</div>
						<form>
							<div class="panel-body">
								<div id="remember-me" class="form-group">
									<input name="remember-me" type="checkbox" id="remember-me"
										class="js-switch" checked="checked" data-color="blue"
										data-switchery="true" style="display: none;"><span
										class="switchery switchery-default"
										style="background-color: rgb(69, 174, 239); border-color: rgb(69, 174, 239); box-shadow: rgb(69, 174, 239) 0px 0px 0px 16px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small
										style="left: 21px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
									<label for="remember-me" class="control-label">Allow
										"Remember Me"</label><br> <br> <span><em>Should
											"Remember Me" checkbox be displayed on login form?</em></span>
								</div>
								<div class="form-group">
									<input name="forgot-password" type="checkbox"
										id="forgot-password" class="js-switch" checked="checked"
										data-color="blue" data-switchery="true" style="display: none;"><span
										class="switchery switchery-default"
										style="background-color: rgb(69, 174, 239); border-color: rgb(69, 174, 239); box-shadow: rgb(69, 174, 239) 0px 0px 0px 16px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small
										style="left: 21px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
									<label for="forgot-password" class="control-label">Forgot
										Password</label><br> <br> <span><em>Enable/Disable
											forgot password feature</em></span>
								</div>
								<div class="form-group">
									<label for="companyname" class="control-label">Name</label> <br>
									<br> <input name="companyname" type="text"
										value="User Management" id="companyname" class="form-input"
										placeholder="Name">
								</div>
								<div class="form-group">
									<input type="submit" name="submit-general"
										value="Update Settings" id="submit-general">
								</div>
							</div>
						</form>
					</div>
					<div class="throttling-div panel">
						<div class="panel-title">Authentication Throttling</div>
						<form>
							<div class="panel-body">
								<div id="throttle-auth" class="form-group">
									<input name="throttle-auth" type="checkbox" id="throttle-auth"
										class="js-switch" checked="checked" data-color="blue"
										onchange="EnableDisableAuthThrottling();"
										data-switchery="true" style="display: none;"><span
										class="switchery switchery-default"
										style="background-color: rgb(69, 174, 239); border-color: rgb(69, 174, 239); box-shadow: rgb(69, 174, 239) 0px 0px 0px 16px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s;"><small
										style="left: 21px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
									<label for="throttle-auth" class="control-label">Throttle
										Authentication</label><br> <br> <span><em>Should
											the system throttle authentication attempts?</em></span>
								</div>
								<div class="form-group">
									<label for="max-attempts" class="control-label">Maximum
										Number of Attempts</label> <input name="max-attempts" type="text"
										value="3" id="max-attempts" class="form-input"
										placeholder="3" min="2"><br> <br> <span><em>Maximum
											number of incorrect login attempts before lockout.</em></span>
								</div>
								<div class="form-group">
									<label for="lockout-time" class="control-label">Lockout
										Time</label> <input name="lockout-time" type="text" value="5"
										id="lockout-time" class="form-input" placeholder="5" min="4"><br>
									<br> <span><em>Number of minutes to lock the
											user out for after specified maximum numbers</em></span>
								</div>
								<div class="form-group">
									<input type="submit" name="submit-throttle"
										value="Update Settings" id="submit-throttle">
								</div>
							</div>
						</form>
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