<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");	// 한글이 들어가는 페이지에서 무조건 들어가야 함
	
	// 값 가져오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String b_no = request.getParameter("b_no");

	String sql 
	= String.format("UPDATE fb_board SET b_title ='%s', b_content='%s' WHERE b_no=%s",title, content, b_no);
	//================DB 연동 (SELECT)==================
	//String sql = ~~~~
	
	// Test Code - 개발자를 위해 log를 찍는 용도
	System.out.println("실행될 쿼리: "+sql);
	
	// class 동적 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// DB 연결
	String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
	String dbUser = "scott";
	String dbPW = "tiger";
	Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPW);	// 접속
	Statement stm = conn.createStatement();// 실행 객체- 실행 관련 처리 
	
	ResultSet rs = stm.executeQuery(sql);
	
	//로직처리 시작....

	//로직처리 끝....
	
	rs.close();
	stm.close();
	conn.close();;
	//=============================================
	
	response.sendRedirect("./main_page.jsp");
%>