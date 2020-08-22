<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgot-password.css">
<title>User Management</title>
<script>
	function validateEmail() {
		
		var mailformat = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		
		if(form.email.value.match(mailformat)){
			console.log("form.email.value");
			document.form.email.focus();
			return true;
		} else {
			document.getElementById('error-info').innerHTML="Enter valid email-id.";	
			document.form.email.focus();
			return false;
		}
	}
</script>
</head>
<body onload='document.form.email.focus()'>
<div class="container">
        <div>
            <img class="mi-logo" src="${pageContext.request.contextPath}/resources/images/mi-logo.jpg" alt="mi_logo" />
            <h3><span class="app-name">User Management</span></h3>
            <p class="recover-text">Recover Password</p>
        </div>
        <div class="info">
            <p>Please enter your email address below to receive the password at your registered email.</p>
        </div>
        <br/><br/>
        <div class="recover-form">
            <form method="post" name="form" >
                <input type="text" name="email" placeholder="Email"/><br/>
                <span id="error-info"></span><br/><br/>
                <input class="submit-button" type="submit" value="RECOVER PASSWORD" onclick="return validateEmail()"/>
            </form>
        </div>
        <br/>
        <div>
            <span>Know your password?</span>
            <span><a href="${pageContext.request.contextPath}/jsp/login.jsp">Login</a></span>
        </div>
</div>
</body>
</html>