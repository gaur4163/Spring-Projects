	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Real Estate Management</title>

	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css" />">
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css" />">
	
	<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
	</head>
	<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">
	<%@include file="menu.jsp"%>
	 

	<hr>
	<div class="container">
	  
		<div class="col-lg-9 col-md-12">
		   <div class="row">
			 
			 
				<div class="account-wall">
					<h3 class="text-center">Property Saved</h3>
					
					
						<form:form class="form-horizontal" role="form" action="addMoreImages"
					id ="addhere"	method="post" enctype="multipart/form-data" modelAttribute="fileObj">
						<h3 align="center">Please Upload a Property Image</h3>
					
						
						<div class="form-group">
							
							<div class="col-sm-9" >
								<form:input type="file" id="fp" placeholder="fp"
								 path="file" name="file" 
									class="form-control" />
								 <form:errors path="file" cssStyle="color:#ff0000"></form:errors>
							</div>
						</div>
						<c:set var="count" value="0" />
						<input type = "hidden" value = "${requestScope.prop}" name = "propId"/>
						
						
						
						
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<input class="btn btn-lg btn-primary btn-block" type="submit" value="Upload">
							</div>
						</div>
					</form:form>
					
						
						
           <div> 		
		<c:set var="task" value="${requestScope.task}" />
	<c:choose>
		<c:when test="${task eq 'success'}">
			<h2 style="color: green;">${requestScope.message}</h2>
		</c:when>

		<c:otherwise>
			<h2 style="color: red;">${requestScope.message}</h2>
		</c:otherwise>
	</c:choose>	</div>			
					
						
						
						
						
						</div>
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