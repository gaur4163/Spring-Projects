
function formValidation()  
{  
	var success =false;
	var lname = document.getElementById("lastName").value;
	
	/*  var uemail = document.registration.Email;  
    var uphone = document.registration.Phone;
    var ucity = document.registration.city;
    var account = document.registration.Account;
    var petname = document.registration.petName;
    var brd = document.registration.breed;
    var age = document.registration.Age;
    var gen = document.registration.gender;
    var stry = document.registration.story;
    var clm = document.registration.claim;
    var dtinjry = document.registration.dateInjury;
    var vetr = document.registration.Veterinarian;
    var clinc = document.registration.Clinic;
    var phne = document.registration.PhVe;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
    var numbers = /^[0-9]+$/;  
    var alphaletters = /^[0-9a-zA-Z]+$/;  
    var alletters = /^[0-9a-zA-Z,. ]+$/;

    var dtfrm = /[0-1][0-9][-\/][0-2][0-9][-\/][0-9]*$/;*/

	var letters = /^[A-Za-z]*$/;
				
	alert(letters.test(lname));
	if(!letters.test(lname))  
	{    alert("Last Name must have alphabet characters only");  
	name.focus();  
	success = false;   
	} 

	return success;
}
/*else if(!uadd.value.match(alletters))  
        {  alert("Address must have alphanumeric characters only");  
        uadd.focus();  
        return false;    }
    else if(!ucity.value.match(alletters) )
        {    alert("City must have alphanumeric characters only");  
        ucity.focus();  
        return false;    }
    else if(!uphone.value.match(numbers))  
        {     alert("Phone must have numeric characters only");  
        uphone.focus();  
        return false;    }
    else if(!uemail.value.match(mailformat))  
        {  alert("Invalid Email address");  
        uemail.focus();  
        return false;    }
    else if(!account.value.match(numbers))  
        {  alert("Account Number must have numeric characters only");  
        account.focus();  
        return false;    }
    else if(!petname.value.match(letters))  
        {  alert("Pet Name must have alphabet characters only");  
        petname.focus();  
        return false;}
    else if(!brd.value.match(letters))  
        {  alert("Breed must have alphabet characters only");  
        brd.focus();  
        return false;}
    else if(!age.value.match(numbers))  
        {  alert("Age must have numeric characters only");  
        age.focus();  
        return false;    }
    else if(!gen.value.match(letters))  
        {  alert("Gender must have alphabet characters only");  
        gen.focus();  
        return false;}
    else if(!stry.value.match(alletters))  
        {  alert("Description must have alphabet characters only");  
        stry.focus();  
        return false;}
    else if(!clm.value.match(numbers))  
        {  alert("Claim amount must have numeric characters only");  
        clm.focus();  
        return false;    }
    else if(!dtinjry.value.match(dtfrm))  
        {  alert("Date should be in mm-dd-yyyy format only");  
        dtinjry.focus();  
        return false;    }
    else if(!vetr.value.match(letters))  
        {  alert("Veterinarian must have alphabet characters only");  
        vetr.focus();  
        return false;}
    else if(!clinc.value.match(letters))  
        {  alert("Clinic name must have alphabet characters only");  
        clinc.focus();  
        return false;}
    else if(!phne.value.match(numbers))  
        {  alert("Phone Number must have numeric characters only");  
        phne.focus();  
        return false;    }*/



