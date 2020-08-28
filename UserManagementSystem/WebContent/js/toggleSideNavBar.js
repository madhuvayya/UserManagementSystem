function toggleSideNavBar(){	
	var div = document.getElementById("sidebar");
	  
	if (div.style.display !== "none") {  
		div.style.display = "none";
		document.getElementsByClassName("main-content").style.width = '100%'; 
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-right';  
	} else {  
		div.style.display = "block";
		document.getElementsByClassName("main-content").style.width = '80%'; 		
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-left'; 
    }  
}
