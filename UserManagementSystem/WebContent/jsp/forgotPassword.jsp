<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/forgot-password.css">
<title>User Management</title>
</head>
<body>
<div class="container">
        <div>
            <img class="mi-logo" src="../resources/images/mi-logo.jpg" alt="mi_logo" />
            <p class="recover-text">Recover Password</p>
        </div>
        <div class="info">
            <p>Please enter your email address below to receive the password at your registered email.</p>
        </div>
        <br/><br/>
        <div class="recover-form">
            <form method="post">
                <input type="text" name="email" placeholder="Email"/><br/><br/>
                <input class="submit-button" type="submit" value="RECOVER PASSWORD" />
            </form>
        </div>
        <div>
            <span>Know your password?</span>
            <span><a href="/UserManagementSystem/jsp/login.jsp">Login</a></span>
        </div>
</div>
</body>
</html>