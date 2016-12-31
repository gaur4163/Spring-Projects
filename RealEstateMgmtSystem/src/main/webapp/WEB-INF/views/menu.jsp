<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${not empty sessionScope.user.firstName}">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#myInverseNavbar2"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home">Real Estate Management</a>
				</div>

				<div class="collapse navbar-collapse" id="myInverseNavbar2">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="Agents">Our Agents</a></li>
						<li><a href="viewAllBuyProperty">Buy</a></li>
						<li><a href="sell">Sell</a></li>
						<li><a href="logout">LogOut</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
	<c:otherwise>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">

				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#myInverseNavbar2"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home">Real Estate Management</a>
				</div>

				<div class="collapse navbar-collapse" id="myInverseNavbar2">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="Agents">Our Agents</a></li>
						<li><a href="viewAllBuyProperty">Buy</a></li>
						<li><a href="signIn">Log In</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:otherwise>
</c:choose>

</body>
</html>