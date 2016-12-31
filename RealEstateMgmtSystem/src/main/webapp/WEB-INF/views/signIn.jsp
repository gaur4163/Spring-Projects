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
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
	</head>
	<body>
	
	<%@include file="menu.jsp"%>
	 

	<hr>
	<div class="container">
	  
		<div class="col-lg-9 col-md-12">
		   <div class="row">
			 
			 
				<div class="account-wall">
					<h3 class="text-center">Sign In To Continue</h3>
					<img class="profile-img" src="<c:url value="/resources/images/SignIn.jpg"/>" alt="">
					<form name='f' class="form-signin" action="login" method="post" modelAttribute="user">
					<input name ="username" type="text" class="form-control" placeholder="Username" onBlur="if(this.value=='') this.value='Enter Username'"
										onFocus="if(this.value =='Enter Username' ) this.value=''">
					<input name = "password" type="password" class="form-control" placeholder="Password" onBlur="if(this.value=='') this.value='Enter Password'"
										onFocus="if(this.value =='Enter Password' ) this.value=''">
					
					<input class="btn btn-lg btn-primary btn-block" type="submit" value="Login">
					<label class="checkbox pull-left">
						<p><a href="signup" >Register?</a></p>
					</label>
					<a href="ForgotPassword" class="pull-right need-help">Forgot Password? </a><span class="clearfix"></span><br>
					<div>
					<h4 style="color: red;">${requestScope.loginFailed}</h4>
					</div>
					</form>
					
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
      <div class="well">
        <h3 class="text-center">Find Your Home</h3>
        <form class="form-horizontal" action="searchbycriteria" method="post" Onsubmit = "return validate_nop();">
          <div class="form-group">
            <label for="location" class="control-label">Location</label>
            <select id="location" class="form-control" name="location" >
                    <option value="any">Any</option>
					<option value="boston" selected="selected">Boston</option>
					<option value="newyork">New York</option>
									
		   </select>
          </div>
          <div class="form-group">
            <label for="type" class="control-label">Type</label>
           <select id="type" class="form-control" name="type">
					<option value="rent" selected="selected">Rent</option>
					<option value="sell">Sell</option>
									
		   </select>
          </div>
          <div class="form-group">
            <label for="pricefrom" class="control-label">Price From</label>
            <div class="input-group">
              <div class="input-group-addon" >$</div>
              <input type="text" class="form-control" id="pricefrom" name="pricefrom" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="form-group">
            <label for="priceto" class="control-label">Price To</label>
            <div class="input-group">
              <div class="input-group-addon" >$</div>
              <input type="text" class="form-control" id="priceto" name="priceto" aria-describedby="basic-addon1">
            </div>
          </div>
          <p><input type="submit" id="Search" name="Search" value="Search" class="btn btn-danger" role="button"></p>
          <p><label id="ErrorMsg" class="control-label"></label></p>
          
        </form>
      </div>
	  
	</div>
	</div>
	<hr>

      <%@include file="footer.jsp"%>
	</body>
	</html>