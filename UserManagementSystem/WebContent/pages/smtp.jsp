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
	href="${pageContext.request.contextPath}/css/smtp.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<title>User Management</title>
</head>
<body>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<span>SMTP Settings</span><br> <span class="page-description">Configure
							SMTP Settings</span>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / SMTP
					</div>
				</div>
				<div class="content">
					<div class="content-title">
						Configure SMTP Settings
						<p class="note">
							<strong>NOTE:</strong> The following SMTP credentials are just
							dummy in the demo version. It can viewed after purchasing the
							item.
						</p>
					</div>
					<div class="content-body">
						<div class="form-group">
							<label for="host" class="control-label">Host</label> <br><input
								name="host" type="text" value="domainname.com" id="host"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="username" class="control-label">Username</label><br> <input
								name="username" type="text" value="youremail@domainname.com"
								id="username" class="form-control">
						</div>
						<div class="form-group">
							<label for="password" class="control-label">Password</label><br> <input
								name="password" type="text" value="yourpassword" id="password"
								class="form-control password">
						</div>
					<div class="form-group">
						<label for="port" class="control-label">Port</label><br> <input
							name="port" type="text" value="21" id="port" tabindex="9"
							class="form-control">
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