<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.sql.*"
%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	String phone = request.getParameter("phone");
	
	//String sql = "INSERT INTO FB_Member VALUES(FB_Member_seq.nextval, '"+id+"','"+pw+"','"+nick+"','"+phone+"',SYSDATE)";
	String sql = String.format("INSERT INTO FB_Member VALUES(FB_Member_seq.nextval, '%s','%s','%s','%s',SYSDATE)",id,pw,nick,phone);
	
	//test code (로그 찍기 용)
	System.out.println("실행될 쿼리 : "+sql);
	
	//DB 연동...
		//클래스 동적 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>