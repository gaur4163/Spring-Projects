
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/signup.css" />">

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
	
	<div class="container" style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
		<div class="row">
			<div class="col-lg-9 col-md-12">
				<div class="row">



					<form class="form-horizontal" action="confirmBooking" method="post">
					   <input type = "hidden" value = "${property.getPropertyId()}" name = "propertySearchId"/>
						<h2 align="center" style="color:white">PROPERTY DETAILS</h2>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Type</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getPropertyCategory()}"></c:out>" disabled="disabled" id="propertyType" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Id</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getPropertyId()}"></c:out>" disabled="disabled" id="propertyId" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Availability</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getAvailability()}"></c:out>" disabled="disabled" id="availability" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Area</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getAreaOfProperty()}"></c:out>" disabled="disabled" id="area" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Description</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getDescription()}"></c:out>" disabled="disabled" id="propertyDescription" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">No.of Rooms </label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getNumOfRooms()}"></c:out>" disabled="disabled" id="noOfrooms" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Price (In USD)</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getPrice()}"></c:out>" disabled="disabled" id="price" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Property Address</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getAddress()}"></c:out>" disabled="disabled" id="address" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Seller</label>
							<div class="col-sm-9">
								<input type="text" value="<c:out value="${property.getUser().toString()}"></c:out>" disabled="disabled" id="propertyType" class="form-control" />
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="propertyType"
								class="col-sm-3 control-label" style="color:white">Booking Amount(Min-$500)</label>
							<div class="col-sm-9">
								<input type="text" name="bookingAmount" readOnly="readonly"  value = "${bookingAmount}"  class="form-control" />
							</div>
						</div>
						
						
						
						
						<!-- /.form-group -->
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<p class="text-center">
							<input type="submit" value="Confirm Booking"  class="btn btn-danger" role="button"/>
						</p>
							</div>
						</div>
						<table>
							<c:forEach var="img" items="${property.getFileattached()}">
								<td><div class="thumbnail">
										<img style="width: 300px; height: 170px"
											src="<c:url value="/images/${img.getFileName()}"/>"
											alt="Thumbnail Image 1" class="img-responsive">
									</div></td>
							</c:forEach>
						</table>
					</form>
					<br>
				<br>
				<c:set var="task" value="${requestScope.task}" />
				<c:choose>
					<c:when test="${task eq 'success'}">
						<h2 style="color: green;">${requestScope.message}</h2>
					</c:when>

					<c:otherwise>
						<h2 style="color: red;">${requestScope.message}</h2>
					</c:otherwise>
				</c:choose>
				</div>
				<!-- /form -->
			</div>
			
		</div>
	</div>
			<!-- ./container -->
	
	
	<hr>


	<%@include file="footer.jsp"%>

</body>
</html>
<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>