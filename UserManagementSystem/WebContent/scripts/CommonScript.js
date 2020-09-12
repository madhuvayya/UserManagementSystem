function dropdown(inputElementId) {
	document.getElementById(inputElementId).classList.toggle("show");
}

window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}

var divs = ["adminOptions", "userOptins", "settings"];
var visibleDivId = null;

function showOptions(divId) {
	if (visibleDivId === divId) {
		visibleDivId = null;
	} else {
		visibleDivId = divId;
	}
	hideNonVisibleDivs();
}

function hideNonVisibleDivs() {
	var i, divId, div;
	for (i = 0; i < divs.length; i++) {
		divId = divs[i];
		div = document.getElementById(divId);
		if (visibleDivId === divId) {
			div.style.display = "block";
		} else {
			div.style.display = "none";
		}
	}
}

function toggleSideNavBar() {
	var div = document.getElementById("sidebar");

	if (div.style.display !== "none") {
		div.style.display = "none";
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-right';
	} else {
		div.style.display = "block";
		document.getElementById("toggling-icon").className = 'ti-arrow-circle-left';
	}
}
