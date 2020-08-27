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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jQuery-Dropify/dist/css/dropify.min.css">
<title>User Management</title>
</head>
<body>
<div class="main-container">
	<%@include file="header.jsp"%>
	<div class="container">
		<%@include file="sideNavbar.jsp"%>
		<form action="register" method="post"> 
		<div class="main-content">		
			<div class="content-heading">
				<div class="page-title">
					<h4>New User</h4>
				</div>
				<div class="home-link">
					<i class="ti-home"></i><a href="dashboard"> Home</a> / New User 
				</div>  
			</div>
			<div class="form-container">
					<div class="form-sub-container">
						<div class="general panel">
							<h3 class="panel-title">General</h3>
							<div class="panel-body">
								<div class="row">
                                	<div class="form-group">
                                    	<div>
                                    	    <label class="control-label">First Name</label>
                                    	</div>
                                    	<div>      
                                        	<input name="first_name" type="text" class="form-control">
										</div>
                                	</div>
                                	<div class="form-group">
                                    	<div>
                                       		<label class="control-label">Middle Name</label>
                                        </div>
                                        <div>
                                        	<input name="middle_name" type="text" class="form-control">
                                    	</div>
                                	</div>
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Last Name</label>
                                        </div>
                                        <div>
                                        	<input name="last_name" type="text" class="form-control">
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div class="form-group">
                                    	<div>                      
                                    		<label class="control-label">Date of Birth</label>
                                    	</div>           
                                        <div>
                                           	 <input id="dob" name="dob" type="date" placeholder="dd-mm-yyyy" max="currentDate()" class="form-control" >
                                       	</div>
                                   	</div>
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Gender</label>
                                        </div>
                                        <div>	
                                        	<select name="gender" class="form-control">
												<option value="">-- Select --</option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
                                    	</div>
                                	</div>
                                	<div>
                                    	<div class="form-group">
                                        	<label class="control-label">Country</label>
                                        </div>
                                        <div>	
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
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Phone</label>
                                        </div>
                                        <div>	
                                        	<input name="phone_number" type="text" class="form-control"><br/>
                                        	<span class="help-block">(999) 999-9999</span>
                                    	</div>
                                	</div>
                               		<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Phone + Ext</label>
                                        </div>
                                        <div>
                                        	<input name="phone_ext" type="text" class="form-control"><br/>
                                        	<span class="help-block">(999) 999-9999 99</span>
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Email</label>
                                        </div>
                                        </div>
                                        	<input name="email" type="text" class="form-control">
                                    	</div>
                                	</div>
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Address</label><br/>
                                        </div>
                                        <div>	
                                        	<textarea name="address" rows="5" cols="20" class="form-control"></textarea>
                                    	</div>
                               	</div>
                            	<hr>
                            	<div class="row">
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Username</label>
                                        </div>
                                        <div>	
                                        	<input name="user_name" type="text" class="form-control">
                                   		</div>
                                	</div>
                                	<div class="form-group">
                                   		<div>
                                        	<label class="control-label">Password</label>
                                        </div>
                                        <div>
                                        	<input name="password" type="password" >
                                    	</div>
                                	</div>
                                	<div class="form-group">
                                    	<div>
                                        	<label class="control-label">Confirm Password</label>
                                        </div>
                                        <div>
                                        	<input name="confirm_password" type="password" class="form-control">
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row">
                                	<div  class="form-group">
                                    	<div>
                                        	<label class="control-label">User Role</label>
                                        </div>
                                        <div>
                                        	<select name="role" class="form-control" onchange="userRolePermissions(this);">
												<option value="">-- Select --</option>
												<option value="Admin">Admin</option>
												<option value="User">User</option>
												</select>
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
                                                    <input type="submit" id="cphBody_btnChangePhoto">
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
      									<td><div>Web Page</div></td>
      									<td>
      										<div><input name="add" id="add" type="checkbox" class="form-control" onchange="onCheck('add')"></div>
      										<div>Add</div>
      									</td>
      									<td>
      										<div><input name="delete" id="delete" type="checkbox" class="form-control" onchange="onCheck('delete')"></div>
      										<div>Delete</div>
      									</td>
      									<td>
      										<div><input name="modify" id="modify" type="checkbox" class="form-control" onchange="onCheck('modify')"></div>
      										<div>Modify</div>
      									</td>
      									<td>
      										<div><input name="read" id="read" type="checkbox" class="form-control" onchange="onCheck('read')"></div>
      										<div>Read</div>
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
      									<td>Settings</td>
      									<td><input name="settings_add" id="settings_add" type="checkbox" class="form-control"></td>
      									<td><input name="settings_delete" id="settings_delete" type="checkbox" class="form-control"></td>
      									<td><input name="settings_modify" id="settings_modify" type="checkbox" class="form-control"></td>
      									<td><input name="settings_read" id="settings_read" type="checkbox" class="form-control"></td>
    								</tr>    								
    								<tr>
      									<td>Users Information</td>
      									<td><input name="user_info_add" id="user_info_add" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_delete" id="user_info_delete" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_modify" id="user_info_modify" type="checkbox" class="form-control"></td>
      									<td><input name="user_info_read" id="user_info_read" type="checkbox" class="form-control"></td>
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
		</form>
	</div>
</div>
<script type="text/javascript">
	<%@include file ="../js/UserRolePermissions.js" %>
</script>	
</body>
</html>