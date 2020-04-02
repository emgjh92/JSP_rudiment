<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	//글 삭제 페이지 => 다른 곳으로 리다이렉트 시킴
	request.setCharacterEncoding("utf-8");
	String rbb_no=request.getParameter("rbb_no");
	
	
	String sql = String.format("DELETE FROM RB_Board WHERE rbb_no=%s",rbb_no);
			
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

	response.sendRedirect("./board_list.jsp");
%>