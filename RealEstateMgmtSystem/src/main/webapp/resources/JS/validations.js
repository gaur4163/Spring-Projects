function validate_name()
{
	var flag=true;
	var errmsg="";
	var x=document.getElementById("pakName").value;
	var pattern=/^[A-Za-z\s]{1,}[\s\-\_]{0,1}[A-Za-z\s]{0,}$/;
	if(x=="" || x==null)
	{
		errmsg="*Please enter package name.";
		flag=false;
	}
	else if(!isNaN(x))
	{
		errmsg="*Please enter package name in alphabets.";
		flag=false;
	}
	else if(!pattern.test(x))
	{
		errmsg="*Please enter a valid package name.";
		flag=false;
	}
	
	if(errmsg!="")
		{
		document.getElementById("errmsgName").innerHTML=errmsg;
		}
	if(flag)
		{
		document.getElementById("errmsgName").innerHTML="";
		}
	return flag;
}

function limitText1(limitField, limitCount, limitNum) {
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	} 
}


function limitText(limitField, limitCount, limitNum) {
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	} else {
		limitCount.value = limitNum - limitField.value.length;
	}
}

function validate_type()
{
 var flag=true;
var errmsg="*Please select the type of tour package";
 if(document.getElementById("type").value==0)
   {
     document.getElementById("errmsgType").innerHTML=errmsg;
     flag=false;
   }
if(flag)
{
document.getElementById("errmsgType").innerHTML="";
}   
}



function validate_spot()
{
	
var flag=true;

var errmsg="*Please select the tourist spot.";
 if(document.getElementById("spot").value==0)
   {
     document.getElementById("errmsgSpots").innerHTML=errmsg;
     flag=false;
   }
  if(flag)
	{
	document.getElementById("errmsgSpots").innerHTML="";
	}  
}



function validate_price()
{
	
 var flag=true;
 var errmsg="";
 var x=document.getElementById("price").value;
 

 for(var i=0;i<x.length;i++)
	{
 if(x.charAt(0)=="0")
	 {
	 x=x.substring(1,x.length);
	 }
	}
 if(x=="")
 {
	 
   errmsg="*Please enter the price field";
   flag=false;
 }
 else if(isNaN(x))
 {
   errmsg="*Please enter the price in numbers";
   flag=false;
 }
 else if(parseInt(x)<=0)
 {
  errmsg="*Price should not be negative or zero.";
  flag=false;
 }
 else if(parseInt(x)>9999)
 {
	 errmsg="*Please enter the price which is less than 9999.";
	 flag=false;
 }
 else if(parseInt(x)<1000)
	 {
	 errmsg="*The minimum amount of package price is INR 1000.";
	 flag=false;
	 }
 if(errmsg!="")
 {
  document.getElementById("errmsgPrice").innerHTML=errmsg;
 }
 if(flag)
 {
    document.getElementById("errmsgPrice").innerHTML="";
    document.getElementById("price").value=x;
 }
} 

function restirctPeriod(evt)
{
	var charCode = (evt.which) ? evt.which : event.keyCode;
			if(charCode==46)
				return false;
			
				return true;
}

function validate_accprice()
{
 var flag=true;
 var errmsg="";
 var x=document.getElementById("accprice").value;

 for(var i=0;i<x.length;i++)
	{
if(x.charAt(0)=="0")
	 {
	 x=x.substring(1,x.length);
	 }
	}
 if(x=="")
 {
   errmsg="*Please enter the accomodation price field";
   flag=false;
 }
 else if(isNaN(x))
 {
   errmsg="*Please enter the price in numbers";
   flag=false;
 }
 else if(parseInt(x)<=0)
 {
  errmsg="*Price should not be negative or zero.";
  flag=false;
 }
 else if(parseInt(x)>5000)
 {
	 errmsg="*Please enter the price which is less than INR 5000.";
	 flag=false;
 }
 else if(parseInt(x)<500)
	 {
	 errmsg="*The minimum amount of accomodation price is INR 500.";
	 flag=false;
	 }
 if(errmsg!="")
 {
  document.getElementById("errmsgAccPrice").innerHTML=errmsg;
 }
 if(flag)
 {
    document.getElementById("errmsgAccPrice").innerHTML="";
    document.getElementById("accprice").value=x;
 }
} 


function remReadonly()
{
document.getElementById("desc").readOnly=false;
}


function validate_all()
{
	var valid=1;
	var pattern=/^[A-Za-z\s]{1,}[\s\-\_]{0,1}[A-Za-z\s]{0,}$/;
	if(!pattern.test(document.getElementById("errmsgName").value))
	{
		document.getElementById("errmsgName").innerHTML="*Please enter a valid package name.";
		valid=0;
	}
	if(document.getElementById("pakName").value=="")
		{
			document.getElementById("errmsgName").innerHTML="*Please enter package name.";
			valid=0;
		}
	if(document.getElementById("type").value==0)
		{
			document.getElementById("errmsgType").innerHTML="*Please select the type of tour package";
			valid=0;
		}
	if(document.getElementById("spot").value==0)
		{
			document.getElementById("errmsgSpots").innerHTML="*Please select the tourist place.";
			valid=0;
		}
	if(document.getElementById("price").value=="")
		{
			document.getElementById("errmsgPrice").innerHTML="*Please enter the price field";
			valid=0;
		}
	
    if(parseInt(document.getElementById("price").value)>9999)
	 {
		 errmsg="*Please enter the price which is less than 9999.";
		 valid=0;
	 }
    if(parseInt(document.getElementById("price").value)<1000)
	 {
		 errmsg="*The minimum amount of package price is INR 1000.";
		 valid=0;
	 }
    if(document.getElementById("yes").checked==true)
	{
    if(parseInt(document.getElementById("accprice").value)<500)
	{
	document.getElementById("errmsgAccPrice").innerHTML="*The minimum amount of accomodation price is INR 500.";
	valid=0;
	}
 }
 if(valid==0) return false;
 else
 {
	var flag=confirm("Are you sure about adding the tour package?");
	return flag;
 }
}
function validate_update_all()
{
	var valid=1;
	if(document.getElementById("pakName").value=="")
		{
			document.getElementById("errmsgName").innerHTML="*Please enter the package name field.";
			valid=0;
		}
	if(document.getElementById("type").value==0)
		{
			document.getElementById("errmsgType").innerHTML="*Please select the type of tour package";
			valid=0;
		}
	if(document.getElementById("spot").value==0)
		{
			document.getElementById("errmsgSpots").innerHTML="*Please select the tourist place.";
			valid=0;
		}
	if(document.getElementById("price").value=="")
		{
			document.getElementById("errmsgPrice").innerHTML="*Please fill the price field";
			valid=0;
		} 
	if(document.getElementById("accprice").value=="")
	{
		document.getElementById("errmsgAccPrice").innerHTML="*Please fill the accomodation price field";
		valid=0;
	} 
	 if(parseInt(document.getElementById("price").value)>9999)
	 {
		 errmsg="*Please enter the price which is less than 9999.";
		 valid=0;
	 }
    if(parseInt(document.getElementById("price").value)<1000)
	 {
		 errmsg="*The minimum amount of package price is INR 1000.";
		 valid=0;
	 }
    if(document.getElementById("yes").checked==true)
	{
    if(parseInt(document.getElementById("accprice").value)<500)
	{
	document.getElementById("errmsgAccPrice").innerHTML="*The minimum amount of accomodation price is INR 500.";
	valid=0;
	}
	}
    if(!validate_name())
    	{
    	
    	document.getElementById("errmsgName").innerHTML="*Please enter the package name field.";
    	valid=0;
    	}
 if(valid==0) return false;
 else
 {
	var flag=confirm("Are you sure about updating the tour package details?");
	return flag;
 }
}


function clearErrMsg()
{
	document.getElementById("errmsgName").innerHTML="";
	document.getElementById("errmsgType").innerHTML="";
	document.getElementById("errmsgSpots").innerHTML="";
	document.getElementById("errmsgPrice").innerHTML="";
	document.getElementById("errmsgAccPrice").innerHTML="";
}
function validate_search()
{
	var flag=true;
	var x=document.getElementById("search").value;
	var y=document.getElementById("searchcriteria").value;
	if(x=="")
		{
		document.getElementById("errMsg").innerHTML="*Please enter search string.";
		flag=false;
		}
	if(y=="0")
		{
		document.getElementById("errMsg").innerHTML="*Please select search criteria.";
		flag=false;
		}
	return flag;
}

function makeActive()
{

if(document.getElementById("yes").checked)
	{
	document.getElementById("accpricerow").style.visibility="visible";
	}
else if(document.getElementById("no").checked)
	{
	document.getElementById("accpricerow").style.visibility="hidden";
	}

	}

function makeInvisible()
{
	document.getElementById("accpricerow").style.visibility="hidden";
}