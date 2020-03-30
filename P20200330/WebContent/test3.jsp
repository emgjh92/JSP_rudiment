<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	안녕하세요.....<br>
	
	<%
		int count = (int)(Math.random()*20);
		for(int i=0; i<count; i++){
				out.println("안녕하세요");
		}
	%>
	
</body>
</html>