<div id="sidebar" class="sidebar">
	<div id="dashboard">
		<i class="ti-dashboard"></i> 
		<span class="title"> <a href="UserRoleController"> Dashboard </a>
		</span> <span class="label label-success">UPDATED</span>
	</div>
	<div onclick="showOptions('adminOptions')" class="onclick-div">
		<i class="ti-files"></i> <span class="title">Webpages</span>
			<i class="icon-submenu ti-angle-left"></i>
	</div>
	<div id="adminOptions" style="display: none;">
		<p>
			&nbsp;&nbsp;&nbsp;<a href="webpage1" class="anchor"> Webpage 1 </a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp; <a href="webpage2" class="anchor"> Webpage 2 </a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp; <a href="webpage3" class="anchor"> Webpage 3 </a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp; <a href="blankpage" class="anchor"> Blank Page
			</a>
		</p>
	</div>

	<div onclick="showOptions('userOptins')" class="onclick-div">
		<i class="ti-settings"></i> <span class="title">Users</span>
			<i class="icon-submenu ti-angle-left"></i>
	</div>
	<div id="userOptins" style="display: none;">
		<p>
			&nbsp;&nbsp;&nbsp;<a href="newuser"> New User </a>
		</p>
		<span>
			&nbsp;&nbsp;&nbsp; <a href="UserList"> Users List</a>
		</span>
		<span class="label label-success">UPDATED</span>
	</div>
	
	<div>
		<a href="profile"> <i class="ti-id-badge"></i> <span class="title">Profile</span>
		</a>
	</div>

	<div id="settings-options" onclick="showOptions('settings')" class="onclick-div">
		<i class="ti-user"></i> <span class="title">Settings</span>
			<i class="icon-submenu ti-angle-left"></i>
	</div>

	<div id="settings" style="display: none;">
		<p>
			&nbsp;&nbsp;&nbsp;<a href="authentication" class="anchor">
				Authentication </a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp; <a href="smtp" class="anchor"> Email SMTP </a>
		</p>
		<p>
			&nbsp;&nbsp;&nbsp; <a href="dbconnection" class="anchor">
				Database Connection</a>
		</p>
	</div>

	<div>
		<a href="logout"> <i class="ti-power-off"></i> <span>Logout</span>
		</a>
	</div>
	<div class="toggle">
			<i class="ti-arrows-horizontal"></i>
	</div>
</div>