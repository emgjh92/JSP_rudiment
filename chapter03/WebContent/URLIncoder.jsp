<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder" %>    
    <%
    	String str = "안녕하세요";
    	str = URLEncoder.encode(str);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<a href="./URLDecoder.jsp?value=<%=str %>">클릭</a> 
</body>
</html>