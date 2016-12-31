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
	<div class="container" style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
	  
	   <div class="col-lg-9 col-md-12">
		  <div class="row">
		  <br><br>
		       <p><h2 align="center" style="color:white">PROPERTIES AS PER SEARCH</h2></p>


	 <c:forEach var="property" items="${propertyList}">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
               <div class="thumbnail" > <img style = "width:300px; height:170px" src="<c:url value="/images/${property.getImage()}"/>" alt="Thumbnail Image 1" class="img-responsive">
                 <div class="caption">
                   <h3><c:out value="${property.getDescription()}"></c:out></h3>
                   <p><c:out value="${property.getDescription()}"></c:out> || <c:out value="${property.getPrice()}"></c:out> </p>
                  <hr>
                <p class="text-center"><a href="propertyDetailsPage?propertySearchId=${property.getPropertyId()}" class="btn btn-success" role="button"><c:out value="${property.getPropertyCategory()}"></c:out></a></p>
            </div>
              </div>
             </div>
	</c:forEach>
        
		  
		   </div>
	  </div>
	   <div class="col-lg-3 col-md-6 col-md-offset-3 col-lg-offset-0">
	  <br>
	  <br>
	  <br>
	  <br>
	  <br>
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
	<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>