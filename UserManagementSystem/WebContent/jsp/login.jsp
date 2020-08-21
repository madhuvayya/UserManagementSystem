<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Management</title>
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
     <div class="login-form">
            <div>
                <img class="mi-logo" src="../resources/images/mi-logo.jpg" alt="mi_logo" />
                <p class="login-text">Login to your account</p>
            </div>
            <div>
                <form method="post" action="login-process">
                    <input type="text" name="username" placeholder="Username"/><br/><br/>
                    <input type="password" name="password" placeholder="Password"/><br/><br/>
                    <div class="remember-div">
                    	<span>
                        <label class="switch">
                            <input type="checkbox" checked>
                            <span class="slider round"></span>
                        </label></span>
                        <span>Remember Me</span>
                    </div>
                    <input class="submit-button" type="submit" value="Login" />
                </form>
            </div>
            <div>
                <i class="fa fa-lock"></i> &nbsp;
                <a href="/UserManagementSystem/jsp/forgotPassword.jsp">Forgot password?</a>
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