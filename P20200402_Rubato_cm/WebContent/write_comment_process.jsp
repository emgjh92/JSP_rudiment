<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="java.sql.*" 
    %>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	//String c_no = request.getParameter("rbm_no");
    	String content = request.getParameter("rbc_content");
    	String member_no = (String)session.getAttribute("sessionNo");	
		String rbb_no = request.getParameter("hidden_no");
    	String sql = String.format("INSERT INTO RB_COMMENT VALUES(RB_COMMENT_seq.nextval,%s,%s,'%s',SYSDATE)",member_no,rbb_no,content);	
    	
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
    	
    	response.sendRedirect("./board_view.jsp?rbb_no="+rbb_no);
	
    	%>
