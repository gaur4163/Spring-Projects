<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<tiles:insertAttribute name="title"></tiles:insertAttribute>
</title>
</head>
<body>
   <div class="container" style="border: #C1C1C1 solid 1px; border-radius: 10px;">
       
           <div><tiles:insertAttribute name="menu" /></div>
       
       <!-- Body Page
       <div class="span-19 last">
           <tiles:insertAttribute name="body" />
       </div>-->
       
       
       <div style="background-color: grey;">
           <tiles:insertAttribute name="body" />
       </div>
       
       <!-- Footer Page -->
       <tiles:insertAttribute name="footer" />
   </div></body>
</html>