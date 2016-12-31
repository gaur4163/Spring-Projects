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
</head>
<body>

	<%@include file="menu.jsp"%>
 

<hr>
<div class="container">
  <div class="row">
    <div class="col-lg-9 col-md-12">
       <div class="row">
         
		 <h1 class="text-center login-title">Sign in to continue to Application</h1>
            <div class="account-wall">
                <img class="profile-img" src=""
                    alt="">
                <form name='f' class="form-signin" action="j_spring_security_check" method='POST'>
                <input type="text" class="form-control" placeholder="Email" required autofocus>
                <input type="password" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign in</button>
                <label class="checkbox pull-left">
                   <a href="#" class="text-center new-account">Create an account </a> 
                </label>
                <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
            
		
		
       </div>
    </div>
    <div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
      <div class="well">
        <h3 class="text-center">Find Your Home</h3>
        <form class="form-horizontal" action="searchbycriteria" method="get">
          <div class="form-group">
            <label for="location" class="control-label">Location</label>
            <select id="location" class="form-control" name="location">
                    <option value="any">Any</option>
					<option value="boston">Boston</option>
					<option value="newyork">New York</option>
									
		   </select>
          </div>
          <div class="form-group">
            <label for="type" class="control-label">Type</label>
           <select id="type" class="form-control" name="type">
					<option value="rent">Rent</option>
					<option value="sell">Sell</option>
									
		   </select>
          </div>
          <div class="form-group">
            <label for="pricefrom" class="control-label">Price From</label>
            <div class="input-group">
              <div class="input-group-addon" id="pricefrom">$</div>
              <input type="text" class="form-control" id="pricefrom" name="pricefrom" aria-describedby="basic-addon1">
            </div>
          </div>
          <div class="form-group">
            <label for="priceto" class="control-label">Price To</label>
            <div class="input-group">
              <div class="input-group-addon" id="priceto">$</div>
              <input type="text" class="form-control" id="priceto" name="priceto" aria-describedby="basic-addon1">
            </div>
          </div>
          <p><input type="submit" id="Search" name="Search" value="Search" class="btn btn-danger" role="button"></p>
        </form>
      </div>
    
      <hr>
      <h3 class="text-center">Agents</h3>
      <div class="media-object-default">
        <div class="media">
          <div class="media-left"> <a href="#"> <img class="media-object img-rounded" src="<c:url value="/resources/images/64X64.gif"/>" alt="placeholder image"> </a> </div>
          <div class="media-body">
            <h4 class="media-heading">Mark Thomas</h4>
            <abbr title="Phone">P:</abbr> (617) 286-9801 <a href="mailto:#">mark.thomas@realestate.com</a> </div>
        </div>
        <div class="media">
          <div class="media-left"> <a href="#"> <img class="media-object img-rounded" src="<c:url value="/resources/images/64X64.gif"/>" alt="placeholder image"> </a> </div>
          <div class="media-body">
            <h4 class="media-heading">Bill Warne</h4>
            <abbr title="Phone">P:</abbr> (617) 380-8017 <a href="mailto:#">bill.warne@realestate.com</a> </div>
        </div>
      </div>
    </div>
  </div>
</div>
<hr>

      
<hr>

	<%@include file="footer.jsp"%>
</body>
</html>