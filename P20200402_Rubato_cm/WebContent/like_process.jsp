<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="java.sql.*" 
    %>
    
     <%
    request.setCharacterEncoding("utf-8");
		String rbb_no = request.getParameter("hidden_no");
    
    String sql_hit 
    	= String.format
    	("UPDATE RB_Board SET RBB_up = RBB_up+1 WHERE RBB_NO=%s",rbb_no);

    	//================DB 연동 (SELECT)==================
    	//String sql = ~~~~
    	
    	// Test Code - 개발자를 위해 log를 찍는 용도
    	System.out.println("실행될 쿼리: "+sql_hit);
    	
    	// class 동적 로드
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	
    	// DB 연결
    	String dbURL_hit = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
    	String dbUser_hit = "scott";
    	String dbPW_hit = "tiger";
    	Connection conn_hit = DriverManager.getConnection(dbURL_hit, dbUser_hit, dbPW_hit);	// 접속
    	Statement stm_hit = conn_hit.createStatement();// 실행 객체- 실행 관련 처리 
    	
    	ResultSet rs_hit = stm_hit.executeQuery(sql_hit);
    	
    	//로직처리 시작....
    	rs_hit.next();
  	//로직처리 끝....
	    rs_hit.close();
		stm_hit.close();
		conn_hit.close(); 
	
	//=============================================
    	
    	response.sendRedirect("./board_view.jsp?rbb_no="+rbb_no);
    %>
