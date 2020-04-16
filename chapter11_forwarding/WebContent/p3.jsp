<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="chapter11_forwarding.*" %>
    <%@page import="java.util.*" %>
<%
	STData data1 = new STData("한조",90);
	STData data2 = new STData("트레이서",70);
	
	HashMap<String,STData> map = new HashMap<String,STData>();
	
	map.put("s1",data1);
	map.put("s2",data2);
	
	map.get("s1");
	
	request.setAttribute("student",map);
	//request.setAttribute("s1",data1);
	//request.setAttribute("s2",data2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${student.s1.name } <br>
	${student.s2.score } <br>
	
	${aaa.bbb.ccc.ddd.eee } <br>
	
</body>
</html>