<nav class="header-navbar">
	<div class="app-name"> User Management
	<i id="toggling-icon" class='ti-arrow-circle-left' onclick="toggleSideNavBar()"></i>
	</div>
	<div class="logged-info" onclick="dropdown('dropdown-list')">
		<div class="dropdown">
			<span class="dropbtn"><img src="" alt="image"/> ${username}</span>
			<div id="dropdown-list" class="dropdown-content">
   				<span class="profile"><a href="profile"><i class='ti-user'></i>&nbsp Profile</a></span>
    			<span class="logout"><a href="logout"><i class='ti-power-off'></i>&nbsp Logout</a></span>
  			</div>
		</div>
	</div>
</nav>