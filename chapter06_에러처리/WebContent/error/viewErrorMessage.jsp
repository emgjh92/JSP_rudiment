<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
에러가 발생 했습니다...잠시 후 다시 시도해 주세요~~~<br>

이런 코드 : 
<%
	out.print(exception.getMessage());
%>

</body>
</html>


