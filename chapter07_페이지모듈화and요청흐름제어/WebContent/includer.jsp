<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include 디렉티브</title>
</head>
<body>
<%
	int number = 10;

%>
<%@include file="/includee.jspf" %>
공통변수 DATAFOLDER = "<%=dataFolder %>"
</body>
</html>
<!-- 
main.jsp, sub.jsp 의 경우 : main.jsp 읽다가 => sub.jsp 읽고 => 다시 main.jsp로 돌아와서 출력

인클루드 디렉티브 : includer.jsp, includee.jspf 가 아예 하나의 파일로 서로 포함시켜 java 파일로 변환 됨 (하나의 파일 취급)
 -->