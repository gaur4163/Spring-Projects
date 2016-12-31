<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/signup.css" />">
<script type="text/javascript">
	function call() {
		
		var flag = '';
		var errmsg="";
		
		letter = /^[A-Za-z]*$/;
		alletters = /^[0-9a-zA-Z,. ]*$/;
		
		
		/* var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})*$/;
		var numbers = /^[0-9]*$/;
		var alphaletters = /^[0-9a-zA-Z]*$/;
		var alletters = /^[0-9a-zA-Z,. ]*$/;
		var dtfrm = /[0-1][0-9][-\/][0-2][0-9][-\/][0-9]*$/;
		var phnumbers=/^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}*$/; */

		var availability = document.getElementById("availability").value;
		var areaOfProperty = document.getElementById("areaOfProperty").value;
		var price = document.getElementById("price").value;
		var numOfRooms = document.getElementById("numOfRooms").value;
		var description = document.getElementById("description").value;
		var aptNum = document.getElementById("aptNum").value;
		var locality = document.getElementById("locality").value;
		var floorNum = document.getElementById("floorNum").value;
		var streetName = document.getElementById("streetName").value;
		var zip = document.getElementById("zip").value;
		
		
		
		
		
		if (!alletters.test(availability)) {
			errmsg="*Availability should contain Characters & numbers only";  
			
			flag = false;
		}else if (!alletters.test(description)) {
			errmsg="*Description should contain Characters & numbers only";  
			alert('In the Description');
			flag = false;
		}else if (availability ==""||availability ==null) {
			errmsg="*You can't leave availabilty field Blank";  
			flag = false;
		}else if (areaOfProperty  == ""|| areaOfProperty ==null) {
			errmsg = "*You can't leave Area field Blank";
			flag = false;
		}else if (price  == ""|| price ==null) {
			errmsg = "*You can't leave price field Blank";
			flag = false;
		}else if (numOfRooms == ""|| numOfRooms ==null) {
			errmsg = "*You can't leave number Of Rooms field Blank";
			flag = false;
		}else if (description  == ""|| description  ==null) {
			errmsg = "*You can't leave Description  field Blank";
			flag = false;
		}else if (aptNum  == ""|| aptNum ==null) {
			errmsg = "*You can't leave Apartment Number field Blank";
			flag = false;
		}else if (locality == ""|| locality  ==null) {
			errmsg = "*You can't leave locality field Blank";
			flag = false;
		}else if (floorNum == ""|| floorNum ==null) {
			errmsg = "*You can't leave floor Number field Blank";
			flag = false;
		}else if (streetName  == ""|| streetName ==null) {
			errmsg = "*You can't leave Street Name field Blank";
			flag = false;
		}else if (zip  == ""|| zip ==null) {
			errmsg = "*You can't leave zip field Blank";
			flag = false;
		}else if (parseInt(availabilty) <= 0) {
			errmsg = "*The Availabilty should not be negative or zero.";
			flag = false;
		}else if (parseInt(areaOfProperty) <= 0) {
			errmsg = "*The areaOfProperty  should not be negative or zero.";
			flag = false;
		}else if (parseInt(numOfRooms ) <= 0) {
			errmsg = "*The numOfRooms should not be negative or zero.";
			flag = false;
		}else if (parseInt(price ) <= 0) {
			errmsg = "*The price should not be negative or zero.";
			flag = false;
		}else if (parseInt(aptNum) <= 0) {
			errmsg = "*The Apartment Number should not be negative or zero.";
			flag = false;
		}else if (parseInt(floorNum) <= 0) {
			errmsg = "*The Floor Number should not be negative or zero.";
			flag = false;
		}else if (!letter.test(streetName)) {
			errmsg="*streetName should contain Characters  only";  
			flag = false;
		}else if (parseInt(zip) <= 0) {
			errmsg = "*The Zip Number should not be negative or zero.";
			flag = false;
		}else if (isNaN(floorNum )) {
			errmsg = "*Please enter the floorNum  in numbers";
			flag = false;
		}else if (isNaN(aptNum )) {
			errmsg = "*Please enter the Apartment Number  in numbers";
			flag = false;
		}else if (isNaN(numOfRooms)) {
			errmsg = "*Please enter the number Of Rooms in numbers";
			flag = false;
		}else if (isNaN(price)) {
			errmsg = "*Please enter the price in numbers";
			flag = false;
		}else if (isNaN(areaOfProperty)) {
			errmsg = "*Please enter the Area Of Property in numbers";
			flag = false;
		}
		
		
		
		
		
		/* else if (!alletters.test(username)) {
			alert("User Name contains alphabet and Numbers only");  
			username.focus();
			flag = false;
		}else if (!alletters.test(password)) {
			alert("Password contains alphabet and Numbers only");  
			password.focus();
			flag = false;
		}else if (!alletters.test(confirmPassword)) {
			alert("Confirmed Password contains alphabet and Numbers only");  
			confirmPassword.focus();
			flag = false;
		}else if (!dtfrm.test(birthDate)) {
			alert("Please Enter Valid Date ");  
			birthDate.focus();
			flag = false;
		}else if (!alletters.test(customerAnswer)) {
			alert("Customer Answers contains alphabet and Numbers only");  
			customerAnswer.focus();
			flag = false;
		}else if (!letter.test(city)) {
			alert("City must have alphabet characters only");  
			city.focus();
			flag = false;
		} */ 
		
		else{
			errmsg=true;
		}
		alert('Before Return');
		
			document.getElementById("ErrorMsgForm").innerHTML = errmsg;
		
		return flag;
	}
</script>

</head>
<body>
	
	<%@include file="menu.jsp"%>


	<hr>
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="row">



					<form:form class="form-horizontal" role="form" action="addPropertyDetails"
						method="post" modelAttribute="property" onsubmit="return call()">
						<h3 align="center">Please Specify Property Details</h3>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label">Property Type</label>
							<div class="col-sm-9">
								<form:select id="propertyType" class="form-control"
									path="propertyType" >
									<option value="office">Office</option>
									<option value="apartment" selected="selected">Apartment</option>
									
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="propertyCategory"
								class="col-sm-3 control-label">Property Category</label>
							<div class="col-sm-9">
								<form:select id="propertyCategory" class="form-control"
									path="propertyCategory">
									<option value="rent" selected="selected">Rent</option>
									<option value="sell">Sell</option>
									
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="availability" class="col-sm-3 control-label">Availability</label>
							<div class="col-sm-9">
								<form:input type="text" id="availability" placeholder="Availabilty" path="availability"
									class="form-control" />
								 <form:errors path="availability" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						<div class="form-group">
							<label for="areaOfProperty" class="col-sm-3 control-label">Area (In SqFt.)</label>
							<div class="col-sm-9">
								<form:input type="number" id="areaOfProperty" placeholder="Area" path="areaOfProperty"
									class="form-control" min="100"/>
								 <form:errors path="areaOfProperty" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						<div class="form-group">
							<label for="price" class="col-sm-3 control-label">Price</label>
							<div class="col-sm-9">
								<form:input type="number" id="price" placeholder="Price" path="price"
									class="form-control" min="100" />
								 <form:errors path="price" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						<div class="form-group">
							<label for="numOfRooms" class="col-sm-3 control-label">No. Of Rooms</label>
							<div class="col-sm-9">
								<form:input type="number" id="numOfRooms" placeholder="No. Of Rooms" path="numOfRooms"
									class="form-control" min="1" max="50"/>
								 <form:errors path="numOfRooms" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-sm-3 control-label">Description</label>
							<div class="col-sm-9">
								<form:input type="text" id="description" placeholder="Description" path="description"
									class="form-control"  />
								 <form:errors path="description" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						
						<div class="form-group">
							<label for="aptNum" class="col-sm-3 control-label">Apartment Number</label>
							<div class="col-sm-9">
								<form:input type="number" id="aptNum" placeholder="Apartment Number" path="address.aptNum"
									class="form-control" min="1" max="99999"/>
								 <form:errors path="address.aptNum" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="locality" class="col-sm-3 control-label">Locality</label>
							<div class="col-sm-9">
								<form:input type="text" id="locality" placeholder="Locality" path="address.locality"
									class="form-control" />
								 <form:errors path="address.locality" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="floorNum" class="col-sm-3 control-label">Floor Number</label>
							<div class="col-sm-9">
								<form:input type="number" id="floorNum" placeholder="Email" path="address.floorNum"
									class="form-control" max="100" min="0" />
								 <form:errors path="address.floorNum" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="streetName" class="col-sm-3 control-label">Street Name</label>
							<div class="col-sm-9">
								<form:input type="text" id="streetName" placeholder="Street Name" path="address.streetName"
									class="form-control" />
								 <form:errors path="address.streetName" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="city" class="col-sm-3 control-label">City</label>
							<div class="col-sm-9">
								<form:select id="city" class="form-control"
									path="address.city">
									<option value="boston" selected="selected">Boston</option>
									<option value="newyork">New York</option>
									
								</form:select>
									
								 
							</div>
						</div>
						
						<div class="form-group">
							<label for="zip" class="col-sm-3 control-label">Zip Code</label>
							<div class="col-sm-9">
								<form:input type="number" id="zip" placeholder="zip" path="address.zip"
									class="form-control" min="0" max="99999"/>
								 <form:errors path="address.zip" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						
						
						
						
						
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<input class="btn btn-lg btn-primary btn-block" type="submit" value="Register">
							</div>
						</div>
						<p>
						<label id="ErrorMsgForm" class="control-label"></label>
						</p>
					</form:form>
					<br>
				<br>
				<c:set var="task" value="${requestScope.task}" />
				<c:choose>
					<c:when test="${task eq 'success'}">
						<h2 style="color: green;">${requestScope.message}</h2>
					</c:when>

					<c:otherwise>
						<h2 style="color: red;">${requestScope.message}</h2>
					</c:otherwise>
				</c:choose>
				</div>
				<!-- /form -->
			</div>
			<!-- ./container -->

			<div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
				

			</div>
		</div>

	</div>



	<hr>
	
	<%@include file="footer.jsp"%>
	<c:set var="task" value="${requestScope.task}" />
	<c:choose>
		<c:when test="${task eq 'success'}">
			<h2 style="color: green;">${requestScope.message}</h2>
		</c:when>

		<c:otherwise>
			<h2 style="color: red;">${requestScope.message}</h2>
		</c:otherwise>
	</c:choose>

</body>
</html>
<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>