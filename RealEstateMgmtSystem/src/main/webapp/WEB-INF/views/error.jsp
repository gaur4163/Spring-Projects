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
		  <h1 style="color:red">Something went wrong!! Please try again</h1>
	  </div>
	</div>
	<hr>

      
	<%@include file="footer.jsp"%>
	
	</body>
	</html>

