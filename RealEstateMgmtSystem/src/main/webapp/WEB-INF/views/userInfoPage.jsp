<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
 
<html>
<head><title>${title}</title></head>
<body>
  <h2>Message : ${message}</h2>
 
  <c:if test="${pageContext.request.userPrincipal.name != null}">
     <h3>User Info : ${pageContext.request.userPrincipal.name}
         | <a href="<c:url value="/logout" />" >Logout</a></h3>  
  </c:if>  
</body>
</html>