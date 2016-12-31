function validateVehicleNumber()
{
	var vehicleNumber = document.getElementById("vehiclenumber").value;
	var pattern =/^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$/;
	
	if(vehicleNumber=="")
		{
		document.getElementById("vehicleNumberDisplay").innerHTML="Please enter the vehicle number";
		return false;
		}
	else if(!pattern.test(vehicleNumber))
		{
		document.getElementById("vehicleNumberDisplay").innerHTML="Please enter valid vehicle number";
		return false;
		}
	else
		{
		document.getElementById("vehicleNumberDisplay").innerHTML="";
		return true;
		}
}

function validateVehicleType()
{
	var type = document.getElementById("vehicleType").selectedIndex;
	
	if(type==0)
		{
		document.getElementById("vehicleTypeDisplay").innerHTML="Please select the vehicle type";
		return false;
		}
	else
		{
		document.getElementById("vehicleTypeDisplay").innerHTML="";
		return true;
		}
}

function validateDealerName()
{
	var dealerName = document.getElementById("dealerName").value;
	var namePattern = /^[A-Za-z\s]{1,}[\s\-\_]{0,1}[A-Za-z\s]{0,}$/;
	
	if(dealerName=="")
		{
		document.getElementById("dealerNameDisplay").innerHTML="Please enter the dealer name";
		return false;
		}
	else if(!namePattern.test(dealerName))
		{
		document.getElementById("dealerNameDisplay").innerHTML="Please enter a valid dealer name (Only Alphabets)";
		return false;
		}
	else
		{
		document.getElementById("dealerNameDisplay").innerHTML="";
		return true;
		}
}



function validateContactNumber()
{
	var contactNumber=document.getElementById("contactNumber").value;
	
	if(contactNumber=="")
		{
		document.getElementById("contactNumberDisplay").innerHTML="Please enter the contact number.";
		return false;
		}
	
	else if(contactNumber<7000000000 || contactNumber>9999999999)
		{
			document.getElementById("contactNumberDisplay").innerHTML="Please enter a valid contact number.";
			return false;
		}
	else if(isNaN(contactNumber))
		{
		document.getElementById("contactNumberDisplay").innerHTML="Please enter a valid contact  number.";
		return false;
		}
	else
		{
		document.getElementById("contactNumberDisplay").innerHTML="";
		return true;
		}
}


function validateAddress()
{
	var address = document.getElementById("dealerAddress").value;
	 if(address=="")
		 {
		 document.getElementById("dealerAddressDisplay").innerHTML="Please enter the dealer address";
		 return false; 
		 }
	 else
		 {
		 document.getElementById("dealerAddressDisplay").innerHTML="";
		 return true;
		 }
}



function validateVehicleStatus()
{
	var status = document.getElementById("vehicleStatus").selectedIndex;
	if(status==0)
	{
	document.getElementById("vehicleStatusDisplay").innerHTML="Please select the vehicle status";
	return false;
	}
else
	{
	document.getElementById("vehicleStatusDisplay").innerHTML="";
	return true;
	}
}


function validateAll()
{
	var flag=true;
	var address = document.getElementById("dealerAddress").value;
	
	 if(address=="")
		 {
		 document.getElementById("dealerAddressDisplay").innerHTML="Please enter the dealer address";
		 flag= false; 
		 }
	 var dealerName = document.getElementById("dealerName").value;
	 if(dealerName=="")
		{
		document.getElementById("dealerNameDisplay").innerHTML="Please enter the dealer name";
		flag= false;
		}
	 var contactNumber=document.getElementById("contactNumber").value;
	 if(contactNumber=="")
		{
		document.getElementById("contactNumberDisplay").innerHTML="Please enter the contact number.";
		flag= false;
		}
	 if(flag==true)
		 {
		 flag=confirm("Do you want to register?"); 
		 }
	if(contactNumber<7000000000 || contactNumber>9999999999)
		{
			document.getElementById("contactNumberDisplay").innerHTML="Please enter a valid contact number.";
			return false;
		}
	if(isNaN(contactNumber))
		{
		document.getElementById("contactNumberDisplay").innerHTML="Please enter a valid contact  number.";
		return false;
		}
	return flag;
}
function clearMsg()
{
	document.getElementById("dealerAddressDisplay").innerHTML="";
	document.getElementById("contactNumberDisplay").innerHTML="";
	document.getElementById("dealerNameDisplay").innerHTML="";
	document.getElementById("contractEndDateDisplay").innerHTML="";
}


function validate_dealeridselection()
{
	
	var dealerid=document.getElementById("dealerId").selectedIndex;
	if(dealerid==0)
		{
		document.getElementById("dealerDisplay").innerHTML="Please select a dealer.";
		}
}

function clearErrMsg()
{
	document.getElementById("vehicleNumberDisplay").innerHTML="";
	document.getElementById("vehicleTypeDisplay").innerHTML="";
	document.getElementById("dealerDisplay").innerHTML="";
}

function confirmation()
{
	return confirm("Are you sure about adding new vehicle to dealer?");

}

function validateAllVehicles()
{
	var x=document.getElementById("vehiclenumber").value;
	var y=document.getElementById("vehicleType").selectedIndex;
	var z=document.getElementById("dealerId").selectedIndex;
	var flag=true;
	if(x=="")
		{
		document.getElementById("vehicleNumberDisplay").innerHTML="Please enter vehicle number.";
		flag=false;
		}
	if(y==0)
		{
		document.getElementById("vehicleTypeDisplay").innerHTML="Please select vehicle type.";
		flag=false;
		}
	if(z==0)
		{
		document.getElementById("dealerDisplay").innerHTML="Please select a dealer.";
		flag=false;
		}
	if(flag==true)
		{
		flag=confirm("Are you sure about registering the vehicle to the dealer?");
		}
	return flag;
}


