<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="${pageContext.request.contextPath}/css/profile.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						Profile<br> <span class="page-description">You last
							logged in on: on this starter page.</span>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / Profile
					</div>
				</div>
				<div class="content-body">
					<div class="profile-left">
						<div class="profile-left-image-bg">
							<div class="profile-img">
								<img src="${pageContext.request.contextPath}/resources/images/image.png" alt="profile-img">
								<h3 class="name"></h3>
							</div>
						</div>
						<div class="basic-info">
							<h4>Basic Info</h4>
							<div class="user-email">
								<div>Email</div>
								<div>${user.getEmail()}</div>
							</div>
							<div class="user-name">
								<div>Username</div>
								<div>${user.getUserName()}</div>
							</div>
							<div class="edit-anchor">
								<a href="UserDetails?userId=${user.getUserId()}">Edit Profile</a>
							</div>
						</div>
					</div>
					<div class="profile-right">
						<div class="profile-spans">
							<span class="general-information-span" >General Information</span>
							<span class="login-history-span">Login History</span>
						</div>
						<div class="general-information">
							<table>
								<tr>
									<td>First Name</td>
									<td></td>
								</tr>
								<tr>
									<td>Middle Name</td>
									<td></td>
								</tr>
								<tr>
									<td>Last Name</td>
									<td></td>
								</tr>
								<tr>
									<td>Date of Birth</td>
									<td></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td></td>
								</tr>
								<tr>
									<td>Country</td>
									<td></td>
								</tr>
								<tr>
									<td>Phone</td>
									<td></td>
								</tr>
								<tr>
									<td>Phone + Ext</td>
									<td></td>
								</tr>
								<tr>
									<td>Address</td>
									<td></td>
								</tr>																																																								
							</table>																																																								
						</div>	
						<div class="login-history" style="display:none;">
							<div><i class="ti-time"></i>
							Login history is displayed prior to the last login</div>
							<div>
							<c:forEach items="${countrylist}" var="country">
								<div><i class="ti-angle-right"></i></div><div></div>
							</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$('.general-information-span').on('click', function(){
			$(".general-information").show();
			$(".login-history").hide();
			$('.general-information-span').addClass('general-information-span-active');
			$('.login-history-span').removeClass('login-history-span-active');			
		})
	
		$('.login-history-span').on('click', function(){
			$(".general-information").hide();			
			$(".login-history").show();
			$('.login-history-span').addClass('login-history-span-active');
			$('.general-information-span').removeClass('general-information-span-active');
		})	
	})
		
	<%@include file="../js/dropdown.js" %>
		
	<%@include file="../js/showOptions.js" %>
		
	<%@include file="../js/toggleSideNavBar.js" %>
		
	</script>
</body>
</html>