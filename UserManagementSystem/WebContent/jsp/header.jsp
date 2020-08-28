<nav class="header">
	<div class="app-name">
		<p>User Management</p>
		<button class="arrow-circle" onclick="toggleSideNavBar()"><i id="toggling-icon" class='ti-arrow-circle-left'></i></button>
	</div>
	<div class="logged-info" onclick="dropdown('dropdown-list')">
		<div class="dropdown">
			<button  class="dropbtn"> <img src="" alt="image" /> ${username}</button>
			<div id="dropdown-list" class="dropdown-content">
   				<span class="profile"><a href=""><i class='ti-user'></i>&nbsp Profile</a></span>
    			<span class="logout"><a href="logout"><i class='ti-power-off'></i>&nbsp Logout</a></span>
  			</div>
		</div>
	</div>
</nav>