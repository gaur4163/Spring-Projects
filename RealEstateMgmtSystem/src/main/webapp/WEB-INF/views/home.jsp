<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<%-- <script src="${pageContext.request.contextPath}/resources/JS/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/bootstrap.js"></script> --%>
<script src="<c:url value="/resources/JS/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/JS/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/JS/valid.js"/>"></script>
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

	<div class="container" style="">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden-xs">
				<div id="carousel-299058" class="carousel slide">
					<ol class="carousel-indicators">
						<li data-target="#carousel-299058" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-299058" data-slide-to="1" class="">
						</li>
						<li data-target="#carousel-299058" data-slide-to="2" class="">
						</li>
					</ol>
					<div class="carousel-inner" style="width: 100%;">
						<div class="item">
							<img class="img-responsive"
								src="<c:url value="/resources/images/front1.jpg"/>" alt="thumb">
							<div class="carousel-caption">Welcome To Real Estate
								Management</div>
						</div>
						<div class="item active">
							<img class="img-responsive"
								src="<c:url value="/resources/images/front2.jpg"/>" alt="thumb">
							<div class="carousel-caption">Welcome To Real Estate
								Management</div>
						</div>
						<div class="item">
							<img class="img-responsive"
								src="<c:url value="/resources/images/front3.jpg"/>" alt="thumb">
							<div class="carousel-caption">Welcome To Real Estate
								Management</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-299058"
						data-slide="prev"><span class="icon-prev"></span></a> <a
						class="right carousel-control" href="#carousel-299058"
						data-slide="next"><span class="icon-next"></span></a>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<section>
	<div class="container">
		<div class="row">
			<c:forEach var="office" items="${listOfOffice}">
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
					<div class="media-object-default">
						<div class="media">
							<div class="media-left">
								<img style="width: 200px; height: 110px"
									class="media-object img-circle"
									src="<c:url value="/images/${office.getImage()}"/>"
									alt="placeholder image">
							</div>
							<div class="media-body">
								<h4 class="media-heading">
									<a
										href="propertyDetailsPage?propertySearchId=${office.getPropertyId()}"><c:out
											value="${office.getDescription()}"></c:out></a>
								</h4>
								<p>
									<c:out value="${office.getDescription()}"></c:out>
									||
									<c:out value="${office.getPrice()}"></c:out>
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>
	</section>
	<hr>
	<div class="container"
		style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
		<br>
		<div class="row">
			<div class="col-lg-9 col-md-12">




				<c:forEach var="property" items="${listOfProperty}">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
						<div class="thumbnail">
							<img style="width: 300px; height: 170px"
								src="<c:url value="/images/${property.getImage()}"/>"
								alt="Thumbnail Image 1" class="img-responsive">
							<div class="caption">
								<h3>
									<c:out value="${property.getDescription()}"></c:out>
								</h3>
								<p>
									<c:out value="${property.getDescription()}"></c:out>
									||
									<c:out value="${property.getPrice()}"></c:out>
								</p>
								<hr>
								<p class="text-center">
									<a
										href="propertyDetailsPage?propertySearchId=${property.getPropertyId()}"
										class="btn btn-success" role="button"><c:out
											value="${property.getPropertyCategory()}"></c:out></a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>






			</div>
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

</body>
</html>