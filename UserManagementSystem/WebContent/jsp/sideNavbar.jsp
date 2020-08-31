<div id="sidebar" class="sidebar">                
        <div><a href="#" id="dashboard">
            <i class="ti-dashboard"></i>
            <span class="title"> <a href="dashboard"> Dashboard </a> </span>
            <span class="label label-success">UPDATED</span></a>
        </div>
        

		<div onclick="showOptions('adminOptions')"><a href="#">
			<i class="ti-files"></i>
			<span class="title">Webpages</span> 
			<i class="icon-submenu ti-angle-left"></i></a>
		</div>	
        <div id="adminOptions" style="display:none;">
                    <p> &nbsp;&nbsp;&nbsp;<a href="webpage1" class="anchor">  Webpage 1 </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="webpage2" class="anchor"> Webpage 2 </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="#" class="anchor"> Webpage 3 </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="#" class="anchor"> Blank Page </a></p>
        </div>
        
       	<div onclick="showOptions('userOptins')">
       		<a href="#">
       			<i class="ti-settings"></i>
       			<span class="title">Users</span> 
       			<i class="icon-submenu ti-angle-left"></i>
       		</a>
       	</div>	
        <div id="userOptins" style="display:none;">
                    <p> &nbsp;&nbsp;&nbsp;<a href="newuser">  New User </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="#"> Users List </a></p>
                    <span class="label label-success">UPDATED</span>
        </div>

       	<div onclick="showOptions('settings')">
       		<a href="#">
       			<i class="ti-user"></i>
       			<span class="title">Settings</span>
       			<i class="icon-submenu ti-angle-left"></i>
       		</a>
       	</div>	
        <div id="settings" style="display:none;">
                    <p> &nbsp;&nbsp;&nbsp;<a href="#" class="anchor">  Authentication </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="#" class="anchor"> Email SMTP </a></p>
                    <p> &nbsp;&nbsp;&nbsp; <a href="#" class="anchor"> Database Connection</a></p>
        </div>

        <div>
        	<a href="#">
        		<i class="ti-id-badge"></i>
        		<span class="title">Profile</span>
        	</a>	
        </div>

        <div>
        	<a href="logout">
        		<i class="ti-power-off"></i>
        		<span>Logout</span>
        	</a>
        </div>
        <div class="toggle">
        	<button type="button">
        		<i class="ti-arrows-horizontal"></i>
        	</button>
       </div>        
</div>