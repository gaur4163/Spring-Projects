<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" ng-app="myApp">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/signup.css" />">
<script src="<c:url value="/resources/JS/valid.js"/>"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.js"></script>
<script src="<c:url value="/resources/JS/ValidationScript.js"/>"></script>
<script type="text/javascript">
	function call() {
		
		var flag = '';
		var errmsg="";
		/* alert('In the Function'); */
		letter = /^[A-Za-z]*$/;
		mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})*$/;
		
		/* var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})*$/;
		var numbers = /^[0-9]*$/;
		var alphaletters = /^[0-9a-zA-Z]*$/;
		var alletters = /^[0-9a-zA-Z,. ]*$/;
		var dtfrm = /[0-1][0-9][-\/][0-2][0-9][-\/][0-9]*$/;
		var phnumbers=/^(\([0-9]{3}\) |[0-9]{3}-)[0-9]{3}-[0-9]{4}*$/; */

		var fname = document.getElementById("firstName").value;
		var lname = document.getElementById("lastName").value;
		var email = document.getElementById("email").value;
		var contact = document.getElementById("contact").value;
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmPassword").value;
		var birthDate = document.getElementById("birthDate").value;
		/* var customerSequrityquestion = document.getElementById("customerSequrityquestion").value; */
		var customerAnswer = document.getElementById("customerAnswer").value;
		var city = document.getElementById("city").value;
		/* alert('Before Test'); */
		
		
		
		if (!letter.test(fname)) {
			errmsg="*First Name must have alphabet characters only";  
			/* alert('In the fname'); */
			flag = false;
		}else if (!letter.test(lname)) {
			errmsg="*Last Name must have alphabet characters only";  
			/* alert('In the lname'); */
			
			flag = false;
		}else if (!mailformat.test(email)) {
			errmsg="*Please enter valid Email in the Generic Format";  
			
			flag = false;
		}else if (city==""||city==null) {
			errmsg="*You can't leave city field Blank";  
		
			flag = false;
		}else if (password == ""|| password==null) {
			errmsg = "*You can't leave password field Blank";
			flag = false;
		}else if (username == ""|| username==null) {
			errmsg = "*You can't leave username field Blank";
			flag = false;
		}else if (confirmPassword == ""|| confirmPassword==null) {
			errmsg = "*You can't leave confirmPassword field Blank";
			flag = false;
		}else if (parseInt(birthDate) <= 0) {
			errmsg = "*The Age should not be negative or zero.";
			flag = false;
		}else if (parseInt(birthDate) > 150) {
			errmsg = "*Please enter the Age less than 150";
			flag = false;
		}else if (customerAnswer == ""|| customerAnswer==null) {
			errmsg = "*You can't leave customerAnswer field Blank";
			flag = false;
		}else if (fname == ""|| fname==null) {
			errmsg = "*You can't leave first Name field Blank";
			flag = false;
		}else if (lname == ""|| lname==null) {
			errmsg = "*You can't leave last Name field Blank";
			flag = false;
		}
		else if (lname == ""|| lname==null) {
			errmsg = "*You can't leave last Name field Blank";
			flag = false;
		}else if (!letter.test(city)) {
			errmsg="*city must have alphabet characters only";  
			
			flag = false;
		}else if (isNaN(contact)) {
			errmsg = "*Please enter the Contact in numbers";
			flag = false;
		}else if (parseInt(contact) < 0) {
			errmsg = "*Please enter valid contact Details";
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
		/* alert('Before Return'); */
		
			document.getElementById("ErrorMsgForm").innerHTML = errmsg;
		
		return flag;
	}
</script>


</head>
<body ng-controller="myCTRL">
	<%@include file="menu.jsp"%>


	<hr>
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="row">



					<form:form class="form-horizontal" role="form" action="signUpAUser"
						method="post" modelAttribute="user" onsubmit="return call()">
						<h3 align="center">Registration Form</h3>
						<div class="form-group">
							<label for="firstName" class="col-sm-3 control-label">First
								Name</label>
							<div class="col-sm-9">
								<form:input type="text" id="firstName" placeholder="Full Name"
									path="firstName" class="form-control" />
								<form:errors path="firstName" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="firstName" class="col-sm-3 control-label">Last
								Name</label>
							<div class="col-sm-9">
								<form:input type="text" id="lastName" placeholder="Full Name"
									path="lastName" class="form-control" />
								<form:errors path="lastName" cssStyle="color:#ff0000"></form:errors>

							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">Email</label>
							<div class="col-sm-9">
								<form:input type="text" id="email" placeholder="Email"
									ng-model="email" ng-change="searchemail()" path="email"
									class="form-control" />
								<form:errors path="email" cssStyle="color:#ff0000"></form:errors>
								<span ng-style="emailStyle">{{emailSpan}}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="contact" class="col-sm-3 control-label">Contact</label>
							<div class="col-sm-9">
								<form:input type="text" id="contact" placeholder="contact"
									path="contact" class="form-control" />
								<form:errors path="contact" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="col-sm-3 control-label">UserName</label>
							<div class="col-sm-9">
								<form:input type="text" id="username" placeholder="username"
									ng-model="username" ng-change="searchusername()"
									path="username" class="form-control" />
								<form:errors path="username" cssStyle="color:#ff0000"></form:errors>
								<span ng-style="usernameStyle">{{UserSpan}}</span>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Password</label>
							<div class="col-sm-9">
								<form:input type="password" id="password" placeholder="Password"
									path="password" class="form-control" />
								<form:errors path="password" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Confirm
								Password</label>
							<div class="col-sm-9">
								<form:input type="password" id="confirmPassword"
									placeholder="Password" path="confirmPassword"
									class="form-control" />
								<form:errors path="confirmPassword" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="birthDate" class="col-sm-3 control-label">Age</label>
							<div class="col-sm-9">
								<form:input type="number" id="birthDate" placeholder="age"
									path="age" class="form-control" max="150" min="10"/>
								<form:errors path="age" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="customerSequrityquestion"
								class="col-sm-3 control-label">Security Question*:</label>
							<div class="col-sm-9">
								<form:select id="customerSequrityquestion" class="form-control"
									path="customerSequrityquestion">
									<option
										value="What was the name of your elementary / primary school?">What
										was the name of your elementary / primary school?</option>
									<option
										value="In what city or town does your nearest sibling live?">In
										what city or town does your nearest sibling live?</option>
									<option value="What time of the day were you born? (hh:mm)">What
										time of the day were you born? (hh:mm)</option>
									<option
										value="What is the name of your favorite childhood friend?">What
										is the name of your favorite childhood friend?</option>
									<option value="What was your favorite sport in high school?">What
										was your favorite sport in high school?</option>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="customerAnswer" class="col-sm-3 control-label">Answer*:</label>
							<div class="col-sm-9">
								<form:input path="customerAnswer" name="customerAnswer"
									type="text" id="customerAnswer" class="form-control" />
								<form:errors path="customerAnswer" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label for="country" class="col-sm-3 control-label">City</label>
							<div class="col-sm-9">
								<form:input path="city" name="city" type="text" id="city"
									class="form-control" />
								<form:errors path="city" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>



						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<button type="submit" class="btn btn-primary btn-block">Register</button>
							</div>
						</div>
						<p>
							<label id="ErrorMsgForm" class="control-label"></label>
						</p>
					</form:form>
				</div>
				<!-- /form -->
			</div>
			<!-- ./container -->

			<div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
				<div class="well">
					<h3 class="text-center">Find Your Home</h3>
					<form class="form-horizontal" action="searchbycriteria"
						method="post" Onsubmit="return validate_nop();">
						<div class="form-group">
							<label for="location" class="control-label">Location</label> <select
								id="location" class="form-control" name="location">
								<option value="any">Any</option>
								<option value="boston" selected="selected">Boston</option>
								<option value="newyork">New York</option>

							</select>
						</div>
						<div class="form-group">
							<label for="type" class="control-label">Type</label> <select
								id="type" class="form-control" name="type">
								<option value="rent" selected="selected">Rent</option>
								<option value="sell">Sell</option>

							</select>
						</div>
						<div class="form-group">
							<label for="pricefrom" class="control-label">Price From</label>
							<div class="input-group">
								<div class="input-group-addon">$</div>
								<input type="text" class="form-control" id="pricefrom"
									name="pricefrom" aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="form-group">
							<label for="priceto" class="control-label">Price To</label>
							<div class="input-group">
								<div class="input-group-addon">$</div>
								<input type="text" class="form-control" id="priceto"
									name="priceto" aria-describedby="basic-addon1">
							</div>
						</div>
						<p>
							<input type="submit" id="Search" name="Search" value="Search"
								class="btn btn-danger" role="button">
						</p>
						<p>
							<label id="ErrorMsg" class="control-label"></label>
						</p>

					</form>
				</div>
				<hr>
				<h3 class="text-center">Agents</h3>
				<div class="media-object-default">
					<div class="media">
						<div class="media-left">
							<a href="#"> <img class="media-object img-rounded"
								src="<c:url value="/resources/images/agent1.jpg"/>"
								alt="placeholder image">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Mark Thomas</h4>
							<abbr title="Phone">P:</abbr> (617) 286-9801 <a href="mailto:#">mark.thomas@realestate.com</a>
						</div>
					</div>
					<div class="media">
						<div class="media-left">
							<a href="#"> <img class="media-object img-rounded"
								src="<c:url value="/resources/images/agent2.jpg"/>"
								alt="placeholder image">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading">Bill Warne</h4>
							<abbr title="Phone">P:</abbr> (617) 380-8017 <a href="mailto:#">bill.warne@realestate.com</a>
						</div>
					</div>
				</div>
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

<script>
	var myApp = angular.module("myApp", []);
	myApp.controller("myCTRL", function($scope, $http) {
		$scope.searchusername = function() {
			$http.get('chkusername', {
				params : {
					"username" : $scope.username
				}
			}).success(function(data, status, headers, config, response) {
				if (data.avail == true) {
					$scope.usernameStyle = {
						'background-color' : 'blue'
					};
					$scope.UserSpan = "User name Available";
				} else {
					$scope.usernameStyle = {
						'background-color' : 'red'
					};
					$scope.UserSpan = "User name not Available";
				}
			}).error(function(data, status, header, config) {
				alert('getfail');
				$scope.ResponseDetails = "Data: " + data;
			});
		};

		$scope.searchemail = function() {
			$http.get('chkemail', {
				params : {
					"email" : $scope.email
				}
			}).success(function(data, status, headers, config, response) {
				if (data.avail == true) {
					$scope.emailStyle = {
						'background-color' : 'blue'
					};
					$scope.emailSpan = "Email Available";
				} else {
					$scope.emailStyle = {
						'background-color' : 'red'
					};
					$scope.emailSpan = "Email not Available";
				}
			}).error(function(data, status, header, config) {
				alert('getfail');
				$scope.ResponseDetails = "Data: " + data;
			});
		};

	});
</script>


</html>