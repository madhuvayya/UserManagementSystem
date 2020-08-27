var addingCheckBoxes = ["dashboard_add", "user_info_add", "settings_add","w1_add","w2_add","w3_add"];
var deleteCheckBoxes = ["dashboard_delete", "user_info_delete", "settings_delete","w1_delete","w2_delete","w3_delete"];
var modifyCheckBoxes = ["dashboard_modify", "user_info_modify", "settings_modify","w1_modify","w2_modify","w3_modify"];
var readCheckBoxes = ["dashboard_read", "user_info_read", "settings_read","w1_read","w2_read","w3_read"];
var userAddingCheckBoxes = ["w1_add","w2_add","w3_add"];
var userModifyCheckBoxes = ["user_info_modify","w1_modify","w2_modify","w3_modify"];
var userReadCheckBoxes = ["w1_read","w2_read","w3_read"];

var additionalPermissions = ['add','delete','modify','read'];
var adminPermissions = addingCheckBoxes.concat(additionalPermissions,deleteCheckBoxes,modifyCheckBoxes,readCheckBoxes);
var userPermissions = userAddingCheckBoxes.concat(userModifyCheckBoxes,userReadCheckBoxes);

function userRolePermissions(event) {
	var role = event.value;
	
	switch(role) {
  		case "Admin":
			for(i = 0; i < adminPermissions.length; i++) {
				checkBox = adminPermissions[i];
				document.getElementById(checkBox).checked = true;
			}
    		break;
  		case "User":
			for(i = 0; i < adminPermissions.length; i++) {
				checkBox = adminPermissions[i];
				document.getElementById(checkBox).checked = false;
			}					
			for(i = 0; i < userPermissions.length; i++) {
				checkBox = userPermissions[i];
				document.getElementById(checkBox).checked = true;
			}
			break;
		}
}

function onCheck(inputId) {
	var checkBoxId = document.getElementById(inputId);
	
	switch(inputId) {
  		case "add":
    		checkboxes = addingCheckBoxes;
    	break;
  	case "delete":
    	checkboxes = deleteCheckBoxes;
    	break;
  	case "modify":
   		checkboxes = modifyCheckBoxes;
    	break;
  	case "read":
    	checkboxes = readCheckBoxes;
		break;
	}

  	if (checkBoxId.checked == true){
		for(i = 0; i < checkboxes.length; i++) {
			checkBox = checkboxes[i];
			document.getElementById(checkBox).checked = true;
		}
  	} else {
		unCheck(checkboxes);
 	}
}

function unCheck(checkboxes) {
	for(i = 0; i < checkboxes.length; i++) {
		checkBox = checkboxes[i];
		document.getElementById(checkBox).checked = false;
	}
}
