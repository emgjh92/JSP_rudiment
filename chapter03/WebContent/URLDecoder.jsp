<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder" %>
    <%
    	String str = request.getParameter("value");
    
    	str = URLDecoder.decode(str); 
    
    	System.out.println(str);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=str %>
</body>
</html>