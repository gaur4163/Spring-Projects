function abc()
{
	document.getElementById('Error').innerHTML=' ';
	document.getElementById('errormsg').innerHTML=' ';
	
	return true;
}






function validateLogin()
{
	if(validateId() && validatePass())
		return true;
	else
		return false;
}

function validateId()
{
	var id=document.getElementById("login").value;

	if(id.length==0)
	{
		document.getElementById("Error").innerHTML= "Please enter the Login ID and Password "
			return false;
	}
	else
	{
		document.getElementById("Error").innerHTML= "";	
		return true;	
	}
}

function validatePass()
{
	var pass=document.getElementById("password").value;
	if(pass.length==0)
	{
		document.getElementById("Error").innerHTML= "Please enter the Password."
			return false;
	}
	else
	{
		document.getElementById("Error").innerHTML= "";	
		return true;	
	}
}

//function validateRole()
//{
//	var role=document.getElementById("role").value;
//	if(role=="Select")
//	{
//		document.getElementById("Error").innerHTML= "  Please select the Role."
//			return false;
//	}
//	else
//	{
//		document.getElementById("Error").innerHTML= "";	
//		return true;	
//	}
//}