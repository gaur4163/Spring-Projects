
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

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/styles.css" />">

<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
	
	function loadMore(count) {
		
	    var f = document.getElementById("fp");
	    
	    var msgtxt = document.createElement("input");
	    msgtxt.type = "file";
	    msgtxt.setAttribute("class", "form-control");
	    msgtxt.setAttribute("name", "imgs["+count+"].file");
	   
	    f.appendChild(msgtxt);
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


					<form:form class="form-horizontal" role="form"
						action="addmanyImages" id="fp" method="post"
						enctype="multipart/form-data" modelAttribute="listfileObj">
						<h3 align="center">Please Upload few Property Images</h3>


						<div class="form-group">

							<div class="col-sm-9">
								<form:input type="file" placeholder="fp" path="imgs[0].file"
									name="imgs[0].file" class="form-control" />

							</div>
						</div>
						<c:set var="count" value="0" />
						<input type="hidden" value="${requestScope.prop}" name="propId" />
						<input type="button" value="Add more Images"
							onclick="loadMore(${count})" />



						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<input class="btn btn-lg btn-primary btn-block" type="submit"
									value="Upload">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-3">
								<!-- <input type="button" value="skip" class="btn btn-primary btn-block"/> -->
								<p class="text-center">
									<a href="home" class="btn btn-primary btn-block" role="button">Done
									</a>
								</p>
							</div>
						</div>
					</form:form>

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