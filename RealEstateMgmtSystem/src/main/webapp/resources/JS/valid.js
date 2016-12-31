function validate_nop() {
	
	var flag = true;
	var errmsg = "";
	var x = document.getElementById("pricefrom").value;
	var y = document.getElementById("priceto").value;
	if (x == "") {
		errmsg = "*Please enter some price value";
		flag = false;
	} else if (isNaN(x)) {
		errmsg = "*Please enter the Price in numbers";
		flag = false;
	} else if (parseInt(x) < 0) {
		errmsg = "*The Price should not be negative or zero.";
		flag = false;
	} else if (parseInt(x) > 99999999) {
		errmsg = "*Please enter the Price less than $99999999";
		flag = false;
	} else if (y == "") {
		errmsg = "*Please enter some price value";
		flag = false;
	} else if (isNaN(y)) {
		errmsg = "*Please enter the Price in numbers";
		flag = false;
	} else if (parseInt(y) < 0) {
		errmsg = "*The Price should not be negative or zero.";
		flag = false;
	} else if (parseInt(y) > 99999999) {
		errmsg = "*Please enter the Price less than $99999999";
		flag = false;
	}
	if (errmsg != "") {
		document.getElementById("ErrorMsg").innerHTML = errmsg;
	}
	if (flag) {
		document.getElementById("ErrorMsg").innerHTML = "";
	}
	return flag;
}
