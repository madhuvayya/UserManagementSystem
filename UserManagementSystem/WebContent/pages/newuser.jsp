<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/newuser.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dropify/dist/css/dropify.min.css">
<script
	src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>
<title>User Management</title>
</head>
<body>
	<%
		if (session.getAttribute("username") == null) {
		response.sendRedirect("login");
	}
	%>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>New User</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / New User
					</div>
				</div>
				<form action="register" method="post" enctype="multipart/form-data"
					class="form" onsubmit="return checkPassword(this)">
					<div class="form-container">
						<p style="text-align: center;">${registerMessage}</p>
						<div class="form-sub-container">
							<div class="general panel">
								<div class="panel-title">General</div>
								<div class="panel-body">
									<div class="form-group">
										<div>
											<label class="control-label">First Name</label>
										</div>
										<div>
											<input name="firstName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="Firstname should start with uppercase remaining letters should be in lowercase. e.g. John"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Middle Name</label>
										</div>
										<div>
											<input name="middleName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="Middle should start with uppercase remaining letters should be in lowercase.">
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Last Name</label>
										</div>
										<div>
											<input name="lastName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="LastName should start with uppercase remaining letters should be in lowercase."
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Date of Birth</label>
										</div>
										<div>
											<input id="dob" name="dob" type="date" id="dob"
												placeholder="dd-mm-yyyy" max="2020-07-29"
												onclick="currentDate();" class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Gender</label>
										</div>
										<div>
											<select name="gender" class="form-control select" required>
												<option value="">-- Select --</option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Country</label>
										</div>
										<div>
											<select name="country" class="form-control select"
												id="country-select" required>
												<option value="">-- Select --</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Phone</label>
										</div>
										<div>
											<input name="phoneNumber" type="tel" class="form-control"
												pattern="^\d{10}$" title="Phone number must be 10 digits"
												required><br />
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Alternate Number</label>
										</div>
										<div>
											<input name="alternateNumber" type="tel" pattern="^\d{10}$"
												title="Phone number must be 10 digits" class="form-control"><br />
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Email</label>
										</div>
										<div>
											<input name="email" type="text"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Address</label><br />
										</div>
										<div>
											<textarea name="address" rows="5" cols="20"
												class="form-control address" required></textarea>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<div>
											<label class="control-label">Username</label>
										</div>
										<div>
											<input name="userName" type="text" class="form-control"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Password</label>
										</div>
										<div>
											<input name="password" type="password" class="form-control"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Confirm Password</label>
										</div>
										<div>
											<input name="confirmPassword" type="password"
												class="form-control" required>
										</div>
									</div>
									<br /> <span id='passwords-message'></span>
									<div class="form-group">
										<div>
											<label class="control-label">User Role</label>
										</div>
										<div>
											<select name="role" class="form-control select"
												onchange="UserRolePermissions(this);" required>
												<option value="">-- Select --</option>
												<option value="Admin">Admin</option>
												<option value="User">User</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="photo panel">
								<div class="panel-title">Photo</div>
								<div class="panel-body">
									<label class="new-user-profile-label">Acceptable image
										formats are jpg, jpeg, png amp; gif.</label> <label
										class="new-user-profile-label">Maximum image size
										allowed is 2MB.</label>
									<div class="dropify-wrapper">
										<input type="file" id="input-file-now" name="userImage"
											class="dropify">
										<button type="button" class="dropify-clear">Remove</button>
										<div class="dropify-preview">
											<span class="dropify-render"></span>
											<div class="dropify-infos">
												<div class="dropify-infos-inner">
													<p class="dropify-filename">
														<span class="file-icon"></span> <span
															class="dropify-filename-inner"></span>
													</p>
													<p class="dropify-infos-message">Drag and drop or click
														to replace</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="permissions panel">
							<div class="panel-title">Permissions</div>
							<div class="panel-body">
								<table>
									<tr class="permission-table-head">
										<td><div>Web Page</div></td>
										<td><span><input name="add" id="add"
												type="checkbox" onchange="onCheck('add')"> Add</span></td>
										<td><span><input name="delete" id="delete"
												type="checkbox" onchange="onCheck('delete')"> Delete</span>
										</td>
										<td><span><input name="modify" id="modify"
												type="checkbox" onchange="onCheck('modify')"> Modify</span>
										</td>
										<td><span><input name="read" id="read"
												type="checkbox" onchange="onCheck('read')"> Read</span></td>
									</tr>
									<tr>
										<td>Dashboard</td>
										<td><input name="dashboard_add" id="dashboard_add"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_delete" id="dashboard_delete"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_modify" id="dashboard_modify"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_read" id="dashboard_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Settings</td>
										<td><input name="settings_add" id="settings_add"
											type="checkbox" value="true"></td>
										<td><input name="settings_delete" id="settings_delete"
											type="checkbox" value="true"></td>
										<td><input name="settings_modify" id="settings_modify"
											type="checkbox" value="true"></td>
										<td><input name="settings_read" id="settings_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Users Information</td>
										<td><input name="user_info_add" id="user_info_add"
											type="checkbox" value="true"></td>
										<td><input name="user_info_delete" id="user_info_delete"
											type="checkbox" value="true"></td>
										<td><input name="user_info_modify" id="user_info_modify"
											type="checkbox" value="true"></td>
										<td><input name="user_info_read" id="user_info_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Web Page 1</td>
										<td><input name="w1_add" id="w1_add" type="checkbox"
											value="true"></td>
										<td><input name="w1_delete" id="w1_delete"
											type="checkbox" value="true"></td>
										<td><input name="w1_modify" id="w1_modify"
											type="checkbox" value="true"></td>
										<td><input name="w1_read" id="w1_read" type="checkbox"
											value="true"></td>
									</tr>
									<tr>
										<td>Web Page 2</td>
										<td><input name="w2_add" id="w2_add" type="checkbox"
											value="true"></td>
										<td><input name="w2_delete" id="w2_delete"
											type="checkbox" value="true"></td>
										<td><input name="w2_modify" id="w2_modify"
											type="checkbox" value="true"></td>
										<td><input name="w2_read" id="w2_read" type="checkbox"
											value="true"></td>
									</tr>
									<tr>
										<td>Web Page 3</td>
										<td><input name="w3_add" id="w3_add" type="checkbox"
											value="true"></td>
										<td><input name="w3_delete" id="w3_delete"
											type="checkbox" value="true"></td>
										<td><input name="w3_modify" id="w3_modify"
											type="checkbox" value="true"></td>
										<td><input name="w3_read" id="w3_read" type="checkbox"
											value="true"></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="submit-reset panel">
							<div>
								<input type="submit" name="submit" id="submit" value="Submit">
							</div>
							<div>
								<input type="reset" value="Reset" id="reset">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/css/dropify/dist/js/dropify.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/scripts/NewUserScript.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/scripts/CommonScript.js"></script>
	<script type="text/javascript">
	$(document).change(function() {
		for (i = 0; i < 10; i++)
		{ 
		     $('#mySelect').append($('<option>',
		     {
		        value: i,
		        text : "Option "+i 
		    }));
		}
	});	
	
	$(document).ready(function() {
		if(${user.getRole() == 'User'}) {
            $('#dashboard').hide();
            $('#settings-options').hide();
		}
	});
		$(document).ready(function() {
			$('.dropify').dropify();
		});
	$(document).ready(function(){
			  $("#country-select").click(function(){
			    $.get("GetCountryData", function(countryList, status){
			      $.each(JSON.parse(countryList), function(country,countryName) {
			    	  $("#country-select").append(
			    			  $('<option></option>').val(countryName).html(countryName)
			    	    );
			    });
			  });
			  });		    
	});	

		function checkPassword(form) {
			var password = form.password.value;
			var confirmPassword = form.confirmPassword.value;

			if (password != confirmPassword) {
				document.getElementById('passwords-message').innerHTML = "Password did not match: Please try again...";
				return false;
			} else {
				return true;
			}
		}
		</script>
</body>
</html>