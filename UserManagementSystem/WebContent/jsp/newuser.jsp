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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/themify-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jQuery-Dropify/dist/css/dropify.min.css">
<title>User Management</title>
</head>
<body>
<form action="register"> 
	<div class="main-container">
	<%@include file="header.jsp"%>
	<div class="container">
		<%@include file="sideNavbar.jsp"%>
		<div class="main-content">		
			<div class="content-heading">
				<div class="page-title">
					<h4>New User</h4>
				</div>
				<div class="home-link">
					<i class="ti-home"></i><a href="dashboard">Home</a> / New User 
				</div>  
			</div>
			<div class="form-container">
					<div class="form-sub-container">
						<div class="general panel">
							<h3 class="panel-title">General</h3>
							<div class="panel-body">
								<div class="row">
                                	<div>
                                    	<div class="form-group">
                                    	    <label class="control-label">First Name</label>  
                                        	<input name="first_name" type="text" class="form-control">
										</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Middle Name</label>
                                        <input name="middle_name" type="text" class="form-control">
                                    	</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Last Name</label>
                                        <input name="last_name" type="text" class="form-control">
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div>
                                    	<div class="form-group">                      
                                    		<label class="control-label">Date of Birth</label>           
                                        	<div id="dob">
                                           	 <span><input id="dob" name="dob" type="date" placeholder="dd-mm-yyyy" max="currentDate()" class="form-control" >
                                           	 <i class="fa fa-calendar"></i></span>
                                       		 </div>
                                   		 </div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        	<label class="control-label">Gender</label><br/>
                                        	<select name="gender" class="form-control">
												<option value="">-- Select --</option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
                                    	</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        	<label class="control-label">Country</label><br/>
                                        	<select name="country" class="form-control">
											<option value="">--- Select ---</option>
											<option value="">Afghanistan</option>
											<option value="">Albania</option>
											<option value="">Algeria</option>
											</select>
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Phone</label><br/>
                                        <input name="phone_number" type="text" class="form-control"><br/>
                                        <span class="help-block">(999) 999-9999</span>
                                    	</div>
                                	</div>
                               		<div>
                                    	<div class="form-group">
                                        <label class="control-label">Phone + Ext</label><br/>
                                        <input name="alternate_number" type="text" class="form-control"><br/>
                                        <span class="help-block">(999) 999-9999 99</span>
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Email</label><br/>
                                        <input name="email" type="text" class="form-control">
                                    	</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Address</label><br/>
                                        <textarea name="address" rows="5" cols="20" class="form-control"></textarea>
                                    	</div>
                                	</div>
                            	</div>
                            	<hr/>
                            	<div class="row">
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Username</label>
                                        <input name="user_name" type="text" class="form-control">
                                   		</div>
                                	</div>
                                	<div>
                                   		<div class="form-group">
                                        <label class="control-label">Password</label>
                                        <div class="hideShowPassword-wrapper" style="position: relative; display: block; vertical-align: baseline; margin: 0px;"><input name="ctl00$cphBody$txtPassword" type="password" id="cphBody_txtPassword" tabindex="12" class="form-control password hideShowPassword-field" data-bv-notempty="true" data-bv-notempty-message="Password is required." data-bv-identical="true" data-bv-identical-field="txtConfirmPassword" data-bv-identical-message="The password and it's confirm are not the same" style="margin: 0px; padding-right: 50px;"><button type="button" role="button" aria-label="Show Password" title="Show Password" tabindex="0" class="hideShowPassword-toggle hideShowPassword-toggle-show" aria-pressed="false" style="position: absolute; right: 0px; top: 50%; margin-top: -10px;">Show</button></div>
                                    	</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">Confirm Password</label>
                                        <input name="confirm_password" type="password" class="form-control">
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div>
                                    	<div class="form-group">
                                        <label class="control-label">User Role</label><br/>
                                        <select name="role" class="form-control" onchange="changeUserRole(this);">
											<option value="">--- Select ---</option>
											<option value="Admin">Admin</option>
											<option value="User">User</option>
										</select>
                                    	</div>
                                	</div>
                            	</div>
						</div>
						</div>
						<div class="photo panel">
							<div class="panel-title">
								Photo
							</div>
							<div class="panel-body">	
                                    <div class="row">
                                        <div>
                                            <div id="divUploadPhoto">
                                                <label class="control-label">Acceptable image formats are jpg, jpeg, png &amp; gif.</label><br>
                                                <label class="control-label">Maximum image size allowed is 2MB.</label>
                                                <div class="dropify-wrapper"><div class="dropify-message"><span class="file-icon"></span> <p>Click here to choose any image</p></div><div class="dropify-loader"></div><div class="dropify-errors-container"><ul></ul></div><input type="file" name="ctl00$cphBody$fileUploadUserPhoto" id="cphBody_fileUploadUserPhoto" class="dropify-fr" data-allowed-file-extensions="png jpeg jpg gif" data-max-file-size="2M" data-show-loader="true" data-show-remove="true" data-errors-position="inside"><button type="button" class="dropify-clear">Remove</button><div class="dropify-preview"><span class="dropify-render"></span><div class="dropify-infos"><div class="dropify-infos-inner"><p class="dropify-filename"><span class="file-icon"></span> <span class="dropify-filename-inner"></span></p><p class="dropify-infos-message">Click remove to remove this image</p></div></div></div></div>                                               <div id="divUploadPhotoButtons" class="text-center" style="display: none;">
                                                    <br>
                                                    <input type="submit" name="ctl00$cphBody$btnChangePhoto" value="Change Photo" id="cphBody_btnChangePhoto" class="btn btn-default btn-sm">
                                                    <input id="btnPreviewPhoto" type="button" class="btn btn-default btn-sm" value="Preview Photo" onclick="PreviewPhoto();">
                                                </div>
                                            </div>
                                        </div>
							</div>
                        </div>
						</div>
					</div>
					<div class="permissions panel">
						<div class="panel-title">
							Permissions
						</div>
						<div class="panel-body">
							<table style="width:100%">
									<tr class="table_head">
      									<td>Web Page</td>
      									<td>
      										<input name="add" id="add" type="checkbox" class="form-control" onclick="onCheck('add')">Add
      									</td>
      									<td>
      										<input name="delete" id="delete" type="checkbox" class="form-control" onclick="onCheck('delete')" >
      										Delete
      									</td>
      									<td>
      										<input name="modify" id="modify" type="checkbox" class="form-control" onclick="onCheck('modify')">
      										Modify
      									</td>
      									<td>
      										<input name="read" id="read" type="checkbox" class="form-control" onclick="onCheck('read')">
      										Read
      									</td>
    								</tr>
    								<tr>
      									<td>Dashboard</td>
      									<td><input name="dashboard_add" id="dashboard_add" type="checkbox" class="form-control"></td>
      									<td><input name="dashboard_delete" id="dashboard_delete" type="checkbox" class="form-control"></td>
      									<td><input name="dashboard_modify" id="dashboard_modify" type="checkbox" class="form-control"></td>
      									<td><input name="dashboard_read" id="dashboard_read" type="checkbox" class="form-control"></td>
    								</tr>
    								<tr>
      									<td>Users Information</td>
      									<td><input name="user_info_add" id="user_info_add" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_delete" id="user_info_delete" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_modify" id="user_info_modify" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_read" id="user_info_read" type="checkbox" class="form-control"></td>
    								</tr>
    								<tr>
      									<td>Settings</td>
      									<td><input name="settings_add" id="settings_add" type="checkbox" class="form-control"></td>
      									<td><input name="settings_delete" id="settings_delete" type="checkbox" class="form-control"></td>
      									<td><input name="settings_modify" id="settings_modify" type="checkbox" class="form-control"></td>
      									<td><input name="settings_read" id="settings_read" type="checkbox" class="form-control"></td>
    								</tr>
    								<tr>
      									<td>Web Page 1</td>
      									<td><input name="w1_add" id="w1_add" type="checkbox" class="form-control"></td>
      									<td><input name="w1_delete" id="w1_delete" type="checkbox" class="form-control"></td>
      									<td><input name="w1_modify" id="w1_modify" type="checkbox" class="form-control"></td>
      									<td><input name="w1_read" id="w1_read" type="checkbox" class="form-control"></td>
    								</tr>
    								<tr>
      									<td>Web Page 2</td>
      									<td><input name="w2_add" id="w2_add" type="checkbox" class="form-control"></td>
      									<td><input name="w2_delete" id="w2_delete" type="checkbox" class="form-control"></td>
      									<td><input name="w2_modify" id="w2_modify" type="checkbox" class="form-control"></td>
      									<td><input name="w2_read" id="w2_read" type="checkbox" class="form-control"></td>
    								</tr>
    								<tr>
      									<td>Web Page 3</td>
      									<td><input name="w3_add" id="w3_add" type="checkbox" class="form-control"></td>
      									<td><input name="w3_delete" id="w3_delete" type="checkbox" class="form-control"></td>
      									<td><input name="w3_modify" id="w3_modify" type="checkbox" class="form-control"></td>
      									<td><input name="w3_read" id="w3_read" type="checkbox" class="form-control"></td>
    								</tr>    								    								    								    								
							</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</div>	
</form>
<script type="text/javascript">
	<%@include file ="../js/onCheck.js" %>
</script>	
</body>
</html>