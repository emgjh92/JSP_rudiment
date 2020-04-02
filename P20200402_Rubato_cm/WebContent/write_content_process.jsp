<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@
    page import="java.sql.*" 
    %>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String title = request.getParameter("rbb_title");
    	String content = request.getParameter("rbb_content");
    	String member_no = (String)session.getAttribute("sessionNo");	
    	
    	//INSERT INTO FB_Board VALUES(FB_Board_seq.nextval,1,'제목입니다','내용입니다',SYSDATE);
    	// 1 이 %d 가 아닌 %s 인 이유는 1은 어디까지나 "DB 기준으로만" 숫자 이기 때문!
    	String sql = String.format("INSERT INTO RB_Board VALUES(RB_Board_seq.nextval,%s,'%s','%s',SYSDATE)",member_no,title,content);	
    	
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
    	
    	response.sendRedirect("./board_list.jsp");
    %>
