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
	<!-- <script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
	
</script> -->
	</head>
	<body>
	
	<%@include file="menu.jsp"%>
	
	

	<hr>
	<div class="container" style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
	  
	   <div class="col-lg-9 col-md-12">
	       <div class="row">
		  <c:set var="from" value="${requestScope.from}" />

			<c:choose>
				<c:when test="${from eq 'userRetrieved'}">
					<br><br>
		                <p><h2 align="center" style="color:White">${requestScope.message}</h2></p>
					<form action="forgotPasswordAnswer">
					
						<table>
							  <tr>
								<td><label>${requestScope.securityQuestion}</label></td>
								<td><input size="55" type="text" style="height: 30px"
									name="answer" required="required"  /></td>
								<td><br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input id="bigbutton" type="submit" value="Submit"> <br>
									<br></td>
							<tr>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>

						</table>

					</form>
				</c:when>
				
				<c:when test="${from eq 'error'}">
					<h2 style="color:red;" class="top-1 p3">${requestScope.message}</h2>
					
				</c:when>
				
				<c:when test="${from eq 'answerCorrect'}">
					<h2 class="top-1 p3">${requestScope.message}</h2>
					
				</c:when>
				
				<c:otherwise>

				

						
						<h2 align="center" style="color:White">Forgot Password? Enter your username</h2>
						<form action="forgotPasswordUsername">

							<table>
								<tr>
									<td><label>Username*:</label></td>
									<td><input size="55" type="text" style="height: 30px"
										name="username" required="required" /></td>
									<td><br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input id="bigbutton" type="submit" value="Sign Up"> <br>
										<br></td>
								<tr>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								</tr>

							</table>



						</form>
				</c:otherwise>





			</c:choose>


			<div class="clear">
				<br> <br>
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

