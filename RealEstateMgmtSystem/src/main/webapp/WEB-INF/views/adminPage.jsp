
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en" ng-app="myApp">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Real Estate Management</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/styles.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/table.css" />">
<script src="<c:url value="/resources/JS/valid.js"/>"></script>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.js"></script>


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
<body ng-controller="myCTRL" onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">

    <%@include file="menu1.jsp"%>


	<hr>
	<div class="container" style="background-image: url(<c:url value="/resources/images/propertyBack.jpg"/>);width=100%">
		<div class="col-lg-9 col-md-12">
			<div class="row">
				<h2 style="color:White">Message : ${message}</h2>

				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<h3 style="color:White">
						Welcome : ${pageContext.request.userPrincipal.name} 
							
					</h3>
				</c:if>

				<div class="container-fluid bg-2 text-center">
					<img src="<c:url value="/resources/images/buy.jpg"/>"
						class="img-circle" alt="">
					<h3>Show All Bookings</h3>
					<p>Using this service, You can view All the Bookings Done for the Apartments.</p>
					<a href="#" ng-click="showAllBookings()"
						class="btn btn-default btn-lg">SHOW</a>
				</div>

				
				<div class="text-center">
					<table ng-show="showTable" border="2" >
						<thead>
							<tr style="color:White">
								<th>BookingId</th>
								<th>BookingDate</th>
								<th>PropertyDescription</th>
								<th>BookingAmount</th>
								<th>PropertyPrice</th>
								<th>PropertyAddress</th>
								<th>PropertyType</th>
								<th>PropertyCategory</th>
								<th>User Name</th>
								
								<th>PropertyImage</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="booking in bookingList | limitTo:increease" style="color:White">
								<td>{{booking.BookingId}}</td>
								<td>{{booking.BookingDate}}</td>
								<td>{{booking.PropertyDescription}}</td>
								<td>{{booking.BookingAmount}}</td>
								<td>{{booking.PropertyPrice}}</td>
								<td>{{booking.PropertyAddress}}</td>
								<td>{{booking.PropertyType}}</td>
								<td>{{booking.PropertyCategory}}</td>
								<td>{{booking.UserFirstName}} {{booking.UserLastName}}</td>
								
								<td><img class="img-square" style="width: 100px; height: 80px;" 
								ng-src="${pageContext.request.contextPath}/images/{{booking.PropertyImage}}"></td>
							
							</tr>
						</tbody>
						<td><input type="button" ng-click="showMore()"
							value="show 2 more"></td>

					</table>

				</div>



			</div>
		</div>

	</div>
	<hr>

    <%@include file="footer.jsp"%>

</body>

<script>
    var myApp = angular.module("myApp", []);
    myApp.controller("myCTRL", function($scope, $http) {
    	$scope.increease=2;
    	$scope.showTable=false;
                $scope.showAllBookings = function() { 
                	$http.get('returnbooking').success(function(data, status, headers, config, response) {
       				
       				$scope.showTable=true;
       				$scope.bookingList=data;
       				
            }).error(function(data, status, header, config) {
                alert('getfail');
                $scope.ResponseDetails = "Data: " + data;
            });
        };    
        $scope.showMore = function() {
        	$scope.increease=$scope.increease+2;;
        }
    });
</script>


</html>
<%
	response.setHeader("Cache-Control", "no-cache,no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>