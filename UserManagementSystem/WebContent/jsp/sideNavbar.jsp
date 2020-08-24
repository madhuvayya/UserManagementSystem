<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sideNavbar.css">
</head>
<body>
<div id="sidebar-nav" class="sidebar">
                
<nav>
    <ul class="nav" id="sidebar-nav-menu">
        <li><a href="" id="menu_lnkDashboard">
            <i class="ti-dashboard"></i>
            <span class="title">Dashboard</span>
            <span class="label label-success">UPDATED</span>
        </a></li>

        <li class="panel">
            <a href="" id="menu_lnkWebpages" data-toggle="collapse" data-parent="#sidebar-nav-menu" class="collapsed" aria-expanded="false"><i class="ti-files"></i><span class="title">Webpages</span> <i class="icon-submenu ti-angle-left"></i></a>
            <div id="webpages" class="collapse" aria-expanded="false" style="height: 0px;">
                <ul class="submenu">
                    <li><a href="" id="menu_lnkWebpage1">Webpage 1</a></li>
                    <li><a href="" id="menu_lnkWebpage2">Webpage 2</a></li>
                    <li><a href="" id="menu_lnkWebpage3">Webpage 3</a></li>
                    <li><a href="" id="menu_lnkBlank">Blank Page</a></li>
                </ul>
            </div>
        </li>

        <li class="panel">
            <a href="#users" id="menu_lnkUsers" data-toggle="collapse" data-parent="#sidebar-nav-menu" class="collapsed" aria-expanded="false"><i class="ti-user"></i><span class="title">Users</span> <i class="icon-submenu ti-angle-left"></i></a>
            <div id="users" class="collapse dropdown" aria-expanded="false">
                <ul class="submenu">
                    <li><a href="/newuser.jsp" id="menu_lnkNewUser">New User</a></li>
                    <li><a href="/users.jsp" id="menu_lnkUsersList">Users List<span class="label label-success">UPDATED</span></a></li>
                </ul>
            </div>
        </li>

        <!--Profile-->
        <li><a id="menu_lnkProfile" href="javascript:__doPostBack('ctl00$menu$lnkProfile','')"><i class="ti-id-badge"></i><span class="title">Profile</span></a></li>

        <!--Settings-->
        <li class="panel">
            <a href="/#settings" id="menu_lnkSettings" data-toggle="collapse" data-parent="#sidebar-nav-menu" class="collapsed" aria-expanded="false"><i class="ti-settings"></i><span class="title">Settings</span> <i class="icon-submenu ti-angle-left"></i></a>
            <div id="settings" class="collapse" aria-expanded="false">
                <ul class="submenu">
                    <li><a href="/settings/authentication.jsp">Authentication</a></li>
                    <li><a href="/settings/smtp.jsp">Email SMTP</a></li>
                    <li><a href="/settings/dbconnection.jsp">Database Connection</a></li>
                </ul>
            </div>
        </li>

        <li><a href="/logout.jsp"><i class="ti-power-off"></i><span>Logout</span></a></li>
    </ul>
    <button type="button" class="toggle"><i class="ti-arrows-horizontal"></i></button>
</nav>

</div>
	<script>
		<%@include file ="../js/dropdown.js" %>
	</script>
</body>
</html>