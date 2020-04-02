<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");	// 한글이 들어가는 페이지에서 무조건 들어가야 함
	
	// 값 가져오기
	String id = request.getParameter("id");	// request객체에서 제공하는 getparameter메소드(return type: String)
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	String phone = request.getParameter("phone");
	
	String sql = String.format("INSERT INTO RB_Member VALUES(RB_Member_seq.nextval,'%s', '%s', '%s', '%s',SYSDATE)",id,pw,nick,phone);	// API
	
	// Test Code - 개발자를 위해 log를 찍는 용도
	System.out.println("실행될 쿼리: "+sql);
	
	// DB 연동
	// class 동적 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// DB 연결
	String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
	String dbUser = "scott";
	String dbPW = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPW);	// 접속
	
	Statement stm = conn.createStatement();// 실행 객체- 실행 관련 처리 
	stm.executeUpdate(sql);	// return값이 int형: insert, update, delete      select는 executeQuery
	stm.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	회원가입을 축하드립니다.<br>
	<a href="./index.jsp">로그인 페이지로....</a>
</body>
</html>