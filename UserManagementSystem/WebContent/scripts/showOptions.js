var divs = ["adminOptions", "userOptins", "settings"];
var visibleDivId = null;

function showOptions(divId) {
	if(visibleDivId === divId) {
		visibleDivId = null;
	} else {
		visibleDivId = divId;
	}
	hideNonVisibleDivs();
}

function hideNonVisibleDivs() {
	var i, divId, div;
	for(i = 0; i < divs.length; i++) {
		divId = divs[i];
		div = document.getElementById(divId);
		if(visibleDivId === divId) {
			div.style.display = "block";
		} else {
			div.style.display = "none";
		}
	}
}