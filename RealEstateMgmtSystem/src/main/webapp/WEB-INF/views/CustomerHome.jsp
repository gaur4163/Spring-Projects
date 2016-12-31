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

<style>
.bg-1 {
    background-color: #1abc9c; /* Green */
    color: #ffffff;
}
.bg-2 {
    background-color: #474e5d; /* Dark Blue */
    color: #ffffff;
}
.bg-3 {
    background-color: #ffffff; /* White */
    color: #555555;
}
</style>
	
	</head>
	<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">
	
	 

	
	<hr>
	<div class="container">
		<div class="col-lg-9 col-md-12">
		   <div class="row">
		   
		          <div class="container-fluid bg-1 text-center">
                  <img  src="<c:url value="/resources/images/buy.jpg"/>" class="img-circle" alt="">
                  <h3>Buying Options</h3>
						<p>Using this service, Customers can view all the Apartments 
						available for Purchase or rent and able to book Apartments.
						They will also be able to book an appointment with Agents.
					    </p>   
                  <a href="viewAllBuyProperty" class="btn btn-default btn-lg">Search</a>
                  </div>

                  <div class="container-fluid bg-2 text-center">
                 
                <img  src="<c:url value="/resources/images/rent.jpg"/>" class="img-circle" alt="">
                        <h3>Selling Options</h3>
						<p>Using this service, Customers can Add details of the Apartments 
						that they want to Rent out to other and make it available for booking.
						
					    </p>
               <a href="sell" class="btn btn-default btn-lg">Search</a>
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
       
 

	</body>
	</html>