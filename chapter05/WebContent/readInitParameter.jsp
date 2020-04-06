<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.Enumeration" %>
    <%@page import = "chapter05.DBUserInfo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 파라미터 읽어오기</title>
</head>
<body>
<%
	//String user="SCOTT";
	//String pw = "TIGER";

	//String user = DBUserInfo.user;
	//String pw = DBUserInfo.pw;
	
	//....DB연동 코드....
	String user = application.getInitParameter("db_user");
	String pw = application.getInitParameter("db_pw"); //web.xml 파일과 연동
%>
</body>
</html>