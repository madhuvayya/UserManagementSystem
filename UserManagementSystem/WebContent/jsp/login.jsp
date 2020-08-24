<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<link rel = "icon" type = "image/png" href = "${pageContext.request.contextPath}/resources/images/mi-logo.jpg"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
function validateForm() {
  var userName = document.getElementById("username").value;
  var password = document.getElementById("password").value;
  var returnValue = true;
  if (userName == "") {
	  document.getElementById('username-empty').innerHTML="Username is required.";
	  document.getElementById('username').className = 'username-null';
	  returnValue = false;
  } else {
	  document.getElementById('username-empty').innerHTML="";
	  document.getElementById('username').className = 'username-not-null';
  }
  if(password == "" ){
	  document.getElementById('password-empty').innerHTML="The password is required.";
	  document.getElementById('password').className = 'password-null';
	  returnValue = false;
  } else {
	  document.getElementById('password-empty').innerHTML="";
	  document.getElementById('password').className = 'password-not-null';
  }
  return returnValue;
}
</script>
</head>
<body onload='document.form.username.focus()'>
<div class="container">
     <div class="login-form">
     		${message}
            <div>
                <div><img class="mi-logo" src="${pageContext.request.contextPath}/resources/images/mi-logo.jpg" alt="mi_logo" /></div>
                <p class="login-text">Login to your account</p>
            </div>
            <div>
                <form method="post" action="login-process" name="form">
                    <input type="text" id="username" class="username" name="username" placeholder="Username" /><br/>
                    <span id='username-empty'></span><br/><br/>
                    <input type="password" id="password" class="password" name="password" placeholder="Password"/><br/>
                    <span id='password-empty'></span><br/><br/>
                    <div class="remember-div">
                    	<span>
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label>Remember Me</span>
                    </div>
                    <input class="submit-button" type="submit" value="Login" onClick="return validateForm()"/>
                </form>
            </div>
            <br/>
            <div>
                <i class="fa fa-lock"></i> &nbsp;
                <a href="forgotPassword.jsp">Forgot password?</a>
            </div>
     </div>
     <div class="app-name">
        	<div class="bg-color">
        	    	<div class="app-text">
		            	User Management System
	    	        	<p>version 2.2</p>
	            	</div>
            </div>
     </div>   
</div>  
</body>
</html>