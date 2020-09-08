<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.bridgelabz.usermanagementsystem.model.Permissions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bridgelabz.usermanagementsystem.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newuser.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateUser.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dropify/dist/css/dropify.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/switchery/0.8.2/switchery.min.js" integrity="sha512-lC8vSUSlXWqh7A/F+EUS3l77bdlj+rGMN4NB5XFAHnTR3jQtg4ibZccWpuSSIdPoPUlUxtnGktLyrWcDhG8RvA==" crossorigin="anonymous"></script>	
<title>User Management</title>
</head>
<body>
	<%
		User user = (User) request.getAttribute("user");
		Permissions permissions = (Permissions) request.getAttribute("permissions");
	%>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>User Information</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / New User
					</div>
				</div>
				<form action="UpdateUserDetails?userId=<%=user.getUserId()%>" method="post" enctype="multipart/form-data"
					class="form" onsubmit="return checkPassword(this)">				
					<div class="form-container">
						<p style="text-align: center;">${message}</p>
						<div class="form-sub-container">
							<div class="general panel">
								<div class="panel-title">General</div>
								<div class="panel-body">
									<div class="form-group">
										<div> <label class="control-label">First Name</label> </div>
										<div>
											<input name="firstName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$" value="<%=user.getFirstName()%>"
												title="Firstname should start with uppercase remaining letters should be in lowercase. e.g. John"
												required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Middle Name</label> </div>
										<div>
											<input name="middleName" type="text" class="form-control"
												value="<%=user.getMiddleName()%>" pattern="^[A-Z][a-z]{3,}$"
												title="Middle should start with uppercase remaining letters should be in lowercase.">
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Last Name</label> </div>
										<div>
											<input name="lastName" type="text" class="form-control"
												value="<%=user.getLastName()%>" pattern="^[A-Z][a-z]{3,}$"
												title="LastName should start with uppercase remaining letters should be in lowercase."
												required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Date of Birth</label> </div>
										<div>
											<input id="dob" name="dob" type="date" id="dob"
												value="${user.getDob()}" placeholder="dd-mm-yyyy"
												max="2020-07-29" onclick="currentDate();"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Gender</label> </div>
										<div>
											<select name="gender" class="form-control select" required>
												<option value="">-- Select --</option>
												<option value="Male" 													
												<c:if test="${user.getGender() == 'male'}"> selected="selected"</c:if>
												>Male</option>
												<option value="Female" 
												<c:if test="${user.getGender() == 'female'}"> selected="selected"</c:if>
												>Female</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Country</label> </div>
										<div>
        									<select name="country" class="form-control select" >
        										<option value="">-- Select --</option>
            									<c:forEach items="${countrylist}" var="country">
                									<option value="${country}"
													<c:if test="${country eq user.getCountry()}"> selected="selected"</c:if> >
                    										${country}
                										</option>
            										</c:forEach>
        									</select>
										</div>
									</div>
									<div class="form-group">
									<div class="form-group">	
										<div> <label class="control-label">Phone</label> </div>
										<div>
											<input name="phoneNumber" type="tel" class="form-control" value="<%=user.getPhoneNumber()%>"
												pattern="^\d{10}$" title="Phone number must be 10 digits"
												required><br />
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Alternate Number</label> </div>
										<div>
											<input name="alternateNumber" type="tel" pattern="^\d{10}$" value="<%=user.getAlternateNumber()%>"
												title="Phone number must be 10 digits" class="form-control"><br />
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Email</label> </div>
										<div>
											<input name="email" type="text"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
												class="form-control" value="<%=user.getEmail()%>" required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Address</label><br /> </div>
										<div>
											<textarea name="address" rows="5" cols="20"
												class="form-control address"
												required><%=user.getAddress()%></textarea>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<div> <label class="control-label"> Username </label> </div>
										<div>
											<input name="userName" type="text" class="form-control"
												value="<%=user.getUserName()%>" required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Password</label> </div>
										<div>
											<input name="password" type="password" class="form-control"
												value="<%=user.getPassword()%>" required>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Confirm Password</label> </div>
										<div>
											<input name="confirmPassword" type="password"
												class="form-control" value="<%=user.getPassword()%>"
												required>
										</div>
									</div>
									<br /> <span id='passwords-message'></span>
									<div class="form-group">
										<div> <label class="control-label">User Role</label> </div>
										<div>
											<select name="role" class="form-control select"
												onchange="UserRolePermissions(this);" required>
												<option value="">-- Select --</option>
												<option value="Admin"
												<c:if test="${user.getRole() == 'Admin'}"> selected="selected"</c:if> 
												>Admin</option>
												<option value="User"
												<c:if test="${user.getRole() == 'User'}"> selected="selected"</c:if>												
												>User</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div> <label class="control-label">Status</label> </div>
										<span> <label class="switch"> 
										<input type="checkbox" name="status"
										<%if (user.getStatus().equalsIgnoreCase("active")) {%> checked="checked"
											<%}%>
										> <span class="slider round"></span>
										</label>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="photo panel">
							<div class="panel-title">Photo</div>
							<div class="panel-body">
                            <div id="cphBody_updatePnlPhoto">	
                                            <div id="divPreviewPhoto" class="text-center">
                                                <div style="border: 2px solid #e6e6e6; padding: 10px 10px;">
                                                    <img src="" id="cphBody_imgPreviewPhoto" alt="" class="img-responsive" style="height:180px; width:170px">
                                                </div>
                                                <br>
                                                <input type="button" id="change-photo" class="btn btn-default btn-sm" value="Change Photo" onclick="UploadPhoto();">             
                                            </div>
                                            <div id="divUploadPhoto" style="display: none;">
                                                <label class="control-label">Acceptable image formats are jpg, jpeg, png &amp; gif.</label><br>
                                                <label class="control-label">Maximum image size allowed is 2MB.</label>
                                                <div class="dropify-wrapper"><div class="dropify-message"><span class="file-icon"></span> <p>Click here to choose any image</p><p class="dropify-error">Ooops, something wrong appended.</p></div><div class="dropify-loader"></div><div class="dropify-errors-container"><ul></ul></div><input type="file" name="ctl00$cphBody$fileUploadUserPhoto" id="cphBody_fileUploadUserPhoto" class="dropify-fr" data-allowed-file-extensions="png jpeg jpg gif" data-max-file-size="2M" data-show-loader="true" data-show-remove="true" data-errors-position="inside"><button type="button" class="dropify-clear">Remove</button><div class="dropify-preview"><span class="dropify-render"></span><div class="dropify-infos"><div class="dropify-infos-inner"><p class="dropify-filename"><span class="file-icon"></span> <span class="dropify-filename-inner"></span></p><p class="dropify-infos-message">Click remove to remove this image</p></div></div></div></div>
                                                <div id="divUploadPhotoButtons" class="text-center">
                                                    <br>
                                                    <input type="button" id="change-photo-dropify" name="ctl00$cphBody$btnChangePhoto" value="Change Photo" id="cphBody_btnChangePhoto" class="btn btn-default btn-sm">
                                                    <input id="btnPreviewPhoto" type="button" class="btn btn-default btn-sm" value="Preview Photo" onclick="PreviewPhoto();">
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
										type="checkbox" value="true"
										<%if (permissions.getDashboardAdd()) {%> checked="checked"
										<%}%>></td>
									<td><input name="dashboard_delete" id="dashboard_delete"
										type="checkbox" value="true"
										<%if (permissions.getDashboardDelete()) {%>
										checked="checked" <%}%>></td>
									<td><input name="dashboard_modify" id="dashboard_modify"
										type="checkbox" value="true"
										<%if (permissions.getDashboardModify()) {%>
										checked="checked" <%}%>></td>
									<td><input name="dashboard_read" id="dashboard_read"
										type="checkbox" value="true"
										<%if (permissions.getDashboardRead()) {%> checked="checked"
										<%}%>></td>
								</tr>
								<tr>
									<td>Settings</td>
									<td><input name="settings_add" id="settings_add"
										type="checkbox" value="true"
										<%if (permissions.getSettingsAdd()) {%> checked="checked"
										<%}%>></td>
									<td><input name="settings_delete" id="settings_delete"
										type="checkbox" value="true"
										<%if (permissions.getSettingsDelete()) {%> checked="checked"
										<%}%>></td>
									<td><input name="settings_modify" id="settings_modify"
										type="checkbox" value="true"
										<%if (permissions.getSettingsModify()) {%> checked="checked"
										<%}%>></td>
									<td><input name="settings_read" id="settings_read"
										type="checkbox" value="true"
										<%if (permissions.getSettingsRead()) {%> checked="checked"
										<%}%>></td>
								</tr>
								<tr>
									<td>Users Information</td>
									<td><input name="user_info_add" id="user_info_add"
										type="checkbox" value="true"
										<%if (permissions.getUsersInformationAdd()) {%>
										checked="checked" <%}%>></td>
									<td><input name="user_info_delete" id="user_info_delete"
										type="checkbox" value="true"
										<%if (permissions.getUsersInformationDelete()) {%>
										checked="checked" <%}%>></td>
									<td><input name="user_info_modify" id="user_info_modify"
										type="checkbox" value="true"
										<%if (permissions.getUsersInformationModify()) {%>
										checked="checked" <%}%>></td>
									<td><input name="user_info_read" id="user_info_read"
										type="checkbox" value="true"
										<%if (permissions.getUsersInformationRead()) {%>
										checked="checked" <%}%>></td>
								</tr>
								<tr>
									<td>Web Page 1</td>
									<td><input name="w1_add" id="w1_add" type="checkbox"
										value="true" <%if (permissions.getWebPage1Add()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w1_delete" id="w1_delete" type="checkbox"
										value="true" <%if (permissions.getWebPage2Delete()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w1_modify" id="w1_modify" type="checkbox"
										value="true" <%if (permissions.getWebPage2Modify()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w1_read" id="w1_read" type="checkbox"
										value="true" <%if (permissions.getWebPage2Read()) {%>
										checked="checked" <%}%>></td>
								</tr>
								<tr>
									<td>Web Page 2</td>
									<td><input name="w2_add" id="w2_add" type="checkbox"
										value="true" <%if (permissions.getWebPage2Add()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w2_delete" id="w2_delete" type="checkbox"
										value="true" <%if (permissions.getWebPage2Delete()) {%>
										checked="checked" <% } %>></td>
									<td><input name="w2_modify" id="w2_modify" type="checkbox"
										value="true" <%if (permissions.getWebPage2Modify()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w2_read" id="w2_read" type="checkbox"
										value="true" <%if (permissions.getWebPage2Read()) {%>
										checked="checked" <%}%>></td>
								</tr>
								<tr>
									<td>Web Page 3</td>
									<td><input name="w3_add" id="w3_add" type="checkbox"
										value="true" <%if (permissions.getWebPage3Add()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w3_delete" id="w3_delete" type="checkbox"
										value="true" <%if (permissions.getWebPage3Delete()) {%>
										checked="checked" <%}%>></td>
									<td><input name="w3_modify" id="w3_modify" type="checkbox"
										value="true" <% if (permissions.getWebPage3Modify()) { %>
										checked="checked" <% } %>></td>
									<td><input name="w3_read" id="w3_read" type="checkbox"
										value="true" <%if (permissions.getWebPage3Read()) {%>
										checked="checked" <%}%>></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="submit-reset panel">
						<div>
							<input type="submit" name="submit" id="submit" value="Update">
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
	<script src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/css/dropify/dist/js/dropify.min.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function() {
			$('.dropify').dropify();
		});
		
        function UploadPhoto() {
            $('#divPreviewPhoto').hide();
            $('#divUploadPhoto').show();
        }
        function PreviewPhoto() {
            $('#divPreviewPhoto').show();
            $('#divUploadPhoto').hide();
        }

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
	<%@include file="../js/dropdown.js" %>
		
	<%@include file="../js/showOptions.js" %>
		
	<%@include file="../js/toggleSideNavBar.js" %>
		
	<%@include file="../js/CurrentDate.js" %>
		
	<%@include file="../js/UserRolePermissions.js" %>
		
	</script>
</body>
</html>