/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




var xmlHttp;
xmlHttp = GetXmlHttpObject();


function GetXmlHttpObject()
{
    var xmlHttp = null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    } catch (e)
    {
        // Internet Explorer
        try
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}




function loadMore(){
	alert ("hi dear");
	
}

function makeForm() {
	
    var f = document.getElementById("idform");
    
    var msgtxt = document.createElement("input");
    msgtxt.type = "text";
    msgtxt.setAttribute("Id", "new");
    msgtxt.setAttribute("name", "msg");
   
    f.appendChild(msgtxt);
    
    var subbut = document.createElement("input");
    subbut.type = "button";
    subbut.className = "btn btn-primary";
    subbut.setAttribute("Id", "bnew");
    subbut.setAttribute("onclick","sendR()");
    subbut.setAttribute("value", "Send Request");
   
    f.appendChild(subbut);
    
    
    var dbut = document.getElementById("d");
    f.removeChild(dbut);
}

