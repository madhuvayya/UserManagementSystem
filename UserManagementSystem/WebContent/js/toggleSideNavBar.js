function toggleSideNavBar(){	
	var div = document.getElementById("sidebar");
	  
	if (div.style.display !== "none") {  
		div.style.display = "none";
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-right';  
	} else {  
		div.style.display = "block";
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-left'; 
    }  
}
