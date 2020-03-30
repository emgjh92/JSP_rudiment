<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
안녕하세요 <br>

<%
	String value1 = request.getParameter("aaa");
	out.print(value1);
	String value2 = request.getParameter("bbb");
%>

<%=value2 %>
</body>
</html>