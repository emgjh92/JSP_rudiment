<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	pageContext.setAttribute("xxx", "p");
    	request.setAttribute("xxx", "r");
    	session.setAttribute("xxx", "s");
    	application.setAttribute("xxx","a");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${aaa } <br>
${xxx } <br> 

${pageScope.xxx } <br> 
${requestScope.xxx } <br> 
${sessionScope.xxx } <br> 
${applicationScope.xxx } <br> 
</body>
</html>