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

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-4.5.2-dist/css/bootstrap.min.css">
<script
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/mi-logo.png">
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
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="sub-container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>Users</p>
					</div>
					<div class="home-link">
						<a href="dashboard">
						<i class="ti-home"></i> 
						Home </a> / Users
					</div>
				</div>
				<span>${message}</span>
				<div class="content">
					<div class="content-title">
						<a href="newuser" class="new-user-anchor">
						<i class="ti-user"></i>
						<span> New User</span></a>
					</div>
					<div class="content-body">
							<table class="table table-fluid" id="myTable" style="border-bottom-style: none;;">
								<thead>
									<tr>
										<th></th>
										<th>Name</th>
										<th>Email</th>
										<th>Dob</th>
										<th>Status</th>
										<th>Role</th>
										<th>Account</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										List<User> userList = (List<User>) request.getAttribute("userList");	
									%>
									<%  for (User user : userList) { %>
									<tr>
										<td><img src="data:image/jpg;base64,<%=user.getUserDiplayingImage()%>" 
										style="width: 30px; height: 30px;padding:0px"/>
										</td>
										<td><%=user.getFirstName() + " " + user.getLastName()%></td>
										<td><%=user.getEmail()%></td>
										<td><%=user.getDob()%></td>
										<td>
											<% if (user.getStatus().equals("active")) {%> 
											<label class="status-active" style="text-align: center;">Active</label> 
											<% } else { %> 
											<label class="status-inactive" style="text-align: center;">Inactive</label> 
											<% } %>
										</td>
										<td><%=user.getRole()%></td>
										<td style="text-align: center;"><label
											id="account-status-label"
											style="font-weight: normal; font-size: large; color: #88BA40;"
											class="ti-unlock text-success"></label></td>
										<td style="color: #1991D7; text-align: center;">
											<a id="edit-deails" style="cursor: pointer;"
												title="Edit User Details"> 
												<i class="ti-pencil-alt"></i>
											</a> 
											<a class="aDelete"  data-modelid="<%=user.getUserId()%>"
												style="cursor: pointer; color: red"
												title="Delete User Details"> 
												<i class="ti-trash" style="font-size: medium" ></i>
											</a>
												<div id="<%=user.getUserId()%>" class="modal-bg">
  													<div class="modal-box">
                                                            <h4>Are you sure?</h4>
                                                            <br>
                                                            <a id="aDeleteUserModal" href="DeleteUser?userId=<%=user.getUserId()%>" class="btn btn-success" data-user-id="1" data-dismiss="modal">Yes</a>
                                                            <input type="button" class="btn btn-danger close-modal" data-dismiss="modal" value="No">                                                            
  												</div>
												</div>
										</td>										
									</tr>
									<% } %>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">
	
	$(function(){
			$('.aDelete').on('click', function(){
				var panelId = $(this).attr('data-modelid');
				$('#'+panelId).toggle();
			})
		
			$('.close-modal').on('click', function(){
				$('.modal-bg').css('display','none');
			})	
	})
	
	
	$(document).ready(function() {
		$('#myTable').DataTable();
	});
	
	
	<%@include file="../js/dropdown.js" %>
		
	<%@include file="../js/showOptions.js" %>
		
	<%@include file="../js/toggleSideNavBar.js" %>
		
	</script>
</body>
</html>