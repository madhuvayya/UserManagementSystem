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
	href="${pageContext.request.contextPath}/css/webpage3.css">
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
						<p>Webpage 3</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / Webpage 3
					</div>
				</div>
				<div class="permissions-div">
					<div class="permissions-title">Webpage Permissions</div>
					<div class="permissions-body">
                            <table class="permissions-table">
                                <tbody><tr>
                                    <td>
                                        <span class="inputLabel">Add Permission</span>
                                    </td>
                                    <td>
                                        <input name="add-permission" type="checkbox" id="add-permission" class="js-switch" disabled="disabled" data-size="small" checked="checked" data-switchery="true" readonly="" style="display: none;"><span class="switchery switchery-small" style="background-color: rgb(100, 189, 99); border-color: rgb(100, 189, 99); box-shadow: rgb(100, 189, 99) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s; opacity: 0.5;"><small style="left: 13px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="inputLabel">Delete Permission</span>
                                    </td>
                                    <td>
                                        <input name="delete-permission" type="checkbox" id="delete-permission" class="js-switch" disabled="disabled" data-size="small" checked="checked" data-switchery="true" readonly="" style="display: none;"><span class="switchery switchery-small" style="background-color: rgb(100, 189, 99); border-color: rgb(100, 189, 99); box-shadow: rgb(100, 189, 99) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s; opacity: 0.5;"><small style="left: 13px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="inputLabel">Modify Permission</span>
                                    </td>
                                    <td>
                                        <input name="modify-permission" type="checkbox" id="modify-permission" class="js-switch" disabled="disabled" data-size="small" checked="checked" data-switchery="true" readonly="" style="display: none;"><span class="switchery switchery-small" style="background-color: rgb(100, 189, 99); border-color: rgb(100, 189, 99); box-shadow: rgb(100, 189, 99) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s; opacity: 0.5;"><small style="left: 13px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="inputLabel">Read Permission</span>
                                    </td>
                                    <td>
                                        <input name="read-permission" type="checkbox" id="read-permission" class="js-switch" disabled="disabled" data-size="small" checked="checked" data-switchery="true" readonly="" style="display: none;"><span class="switchery switchery-small" style="background-color: rgb(100, 189, 99); border-color: rgb(100, 189, 99); box-shadow: rgb(100, 189, 99) 0px 0px 0px 11px inset; transition: border 0.4s ease 0s, box-shadow 0.4s ease 0s, background-color 1.2s ease 0s; opacity: 0.5;"><small style="left: 13px; background-color: rgb(255, 255, 255); transition: background-color 0.4s ease 0s, left 0.2s ease 0s;"></small></span>
                                    </td>
                                </tr>
                            </tbody></table>
                        </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	<%@include file="../scripts/dropdown.js" %>
		
	<%@include file="../scripts/showOptions.js" %>
		
	<%@include file="../scripts/toggleSideNavBar.js" %>
		
	</script>
</body>
</html>