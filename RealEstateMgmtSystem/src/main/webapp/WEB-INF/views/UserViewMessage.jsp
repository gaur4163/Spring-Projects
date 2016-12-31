	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Real Estate Management</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
	<script src="<c:url value="/resources/JS/valid.js"/>"></script>
	<script type="text/javascript">
	var xmlHttp;
	xmlHttp = GetXmlHttpObject();function GetXmlHttpObject()
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
	}function sendMsg() {
	    
	    
	    var msg = document.getElementById("new").value;
	    var toId = document.getElementById("toid").value;
	    var msgdiv = document.getElementById("msgs");
	    alert("hi. "+msg);xmlHttp.onreadystatechange = function stateChanged() {
	if (xmlHttp.readyState == 4) {
	       console.log("ready");
	   }
	};var qry = "toId="+toId+"&msg="+msg;
	xmlHttp.open("POST", "userSendMessage", true);
	xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlHttp.send(qry);var f = document.getElementById("idform");
	var x = document.getElementById("new");
	var y = document.getElementById("send");
	f.removeChild(x);
	f.removeChild(y);
	document.getElementById("sms").disabled = false;var nmsgtxt = document.createElement("h3");
	nmsgtxt.innerHTML = msg;
	nmsgtxt.setAttribute("align", "left");
	msgdiv.appendChild(nmsgtxt);
	var timesd = document.createElement("h4");
	timesd.innerHTML = 'Just Now';
	timesd.setAttribute("align", "left");
	msgdiv.appendChild(timesd);return false;
	}function makeMsg() {
	    
	   var f = document.getElementById("idform");
	   
	   var msgtxt = document.createElement("input");
	   msgtxt.type = "textarea";
	   msgtxt.setAttribute("Id", "new");
	   msgtxt.setAttribute("name", "msg");
	   msgtxt.setAttribute("rows", "3");
	   msgtxt.setAttribute("cols", "100");
	 
	   f.appendChild(msgtxt);
	   
	   var subbut = document.createElement("input");
	   subbut.type = "button";
	   subbut.className = "btn btn-primary";
	   subbut.setAttribute("Id", "send");
	   subbut.setAttribute("value", "Send");
	   subbut.setAttribute("onclick","sendMsg()");
	 
	 
	   f.appendChild(subbut);
	   document.getElementById("sms").disabled = true;
	   }
	
	
	
	</script>
	<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
	var b='${fs}';
	var a='${test}';
	/* alert(a);
	alert(b); */
</script>
	</head>
	<body>
	
	<%@include file="menu.jsp"%>
	

	<hr>
	<div class="container" style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
	  
	   <div class="col-lg-9 col-md-12">
		       

         
         <h2 class="text-Right">Messages between you and ${requestScope.msgToObj.firstName} ${requestScope.msgToObj.lastName}</h2>
         
         <c:set var="task" value="${requestScope.task}" />
                <c:choose>
                    <c:when test="${task eq 'success'}">
                        <c:choose>
                        <c:when test="${empty msglist} }">You Don't have any Messages.</c:when>
                        <c:otherwise>
                         <c:forEach var="msg" items="${requestScope.msglist}" >
                         <form action="#" method = "post">
                         
                         <input type="hidden"  name = "profileObj" value = ""/>
                         <c:choose>
                         <c:when test="${msg.fromUser.userId eq sessionScope.user.userId}">
                         <tr><h3 align ="left"><td>${msg.message} </h3></td></td>
                         <h4 align ="left">On ${msg.messageDate}</h4></c:when>
                         <c:otherwise>
                         <tr><h3 align ="right"><td>${msg.message} </h3></td></td>
                         <h4 align ="right">On ${msg.messageDate}</h4>
                         </tr>
                         </c:otherwise></c:choose>
                         <td>
                         </td></tr></form>
                         </c:forEach>
                        </c:otherwise></c:choose>
                    </c:when>
                    <c:otherwise>
                     <h4 style="color: red;" class="text-Right">Could not load Messages...Try Later</h2>
                    </c:otherwise>
                </c:choose>
                
                <div id = "msgs">
                </div>
       <form id ="idform" action ="#" method = "post" align = "left">
           <input type="hidden" id="toid" name = "toObj" value = "${requestScope.msgToObj.userId}"/>
           
           <br>
         <input type = "button" align = "center" class="btn btn-primary" id="sms" value="Send Message" onclick="makeMsg()" />
                 </form>  
	  </div>
	</div>
	<hr>
   
      
	<%@include file="footer.jsp"%>
	
	</body>
	</html>