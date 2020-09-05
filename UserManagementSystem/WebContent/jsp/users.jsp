<%@page import="java.io.DataOutputStream"%>
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
	href="${pageContext.request.contextPath}/css/users.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<title>User Management</title>
</head>
<body>
	<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
	<%@page import="java.util.List"%>
	<%@page import="java.util.Base64"%>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>Users</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / Users
					</div>
				</div>
				<span>${message}</span>
				<div class="content">
					<div class="content-title">
						<a href="newuser" class="new-user-anchor"><i class="ti-user"></i><span>New
								User</span></a>
					</div>
					<div class="content-body">
						<div class="select-serarch-row">
							<div>
								<select id="table-size" class="form-control"
									onchange="changePagesize(this);">
									<option>10</option>
									<option>20</option>
									<option>50</option>
									<option>100</option>
								</select>
							</div>
							<div class="search-input">
								<input name="searched-for" type="text" id="search-input"
									class="form-control" placeholder="Search...">
							</div>
						</div>
						<div class="table-div">
							<table>
								<tr>
									<td></td>
									<td>Name</td>
									<td>Email</td>
									<td>Dob</td>
									<td>Status</td>
									<td>Role</td>
									<td>Account</td>
									<td>Action</td>
								</tr>
								<%
									List<User> userList = (List) request.getAttribute("userList");
								%>
								<%
									for (User user : userList) {
								%>
								<tr>
									<td><img
										src="data:image/jpg;base64,<%=user.getUserDiplayingImage()%>"
										style="width: 38px; height: 38px; margin-top: -10px; margin-bottom: -12px" />
									</td>
									<td><%=user.getFirstName() + " " + user.getLastName()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getDob()%></td>
									<td><%=user.getStatus()%></td>
									<td><%=user.getRole()%></td>
									<td style="text-align:center;"><label id="account-status-label" style="font-weight: normal; font-size: large; color:#88BA40;" class="ti-unlock text-success"></label></td>
									<td style="width: 8%;color:#1991D7;text-align:center;"><a
										id="edit-deails" style="cursor: pointer;"
										data-user-id="10" title="Edit User Details"> <i
											class="ti-pencil-alt"></i>
									</a> <a id="aDeleteUser" style="cursor: pointer;color:red" title="Delete User Details">
											<i class="ti-trash"
											style="font-size: medium"></i>
									</a>
								</tr>
								<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	<%@include file="../js/dropdown.js" %>
		
	<%@include file="../js/showOptions.js" %>
		
	<%@include file="../js/toggleSideNavBar.js" %>
		
	</script>
</body>
</html>