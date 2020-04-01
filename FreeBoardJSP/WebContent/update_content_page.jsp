<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "java.sql.*" %>
    <%
  	//글 수정 페이지
  		request.setCharacterEncoding("utf-8");
    	String b_no = request.getParameter("b_no");
    	
    	String sql = String.format("SELECT * FROM fb_board b, fb_member m WHERE b.m_no = m.m_no AND b.b_no=%s",b_no);
    	
    	
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
		rs.next();
    	
    	String title = rs.getString("b_title"); //글제목
    	String content = rs.getString("b_content"); //글 내용
    	String nick = rs.getString("m_nick"); //글쓴이
		
    	
    	//로직처리 끝....
    	
    	rs.close();
    	stm.close();
    	conn.close();;
	//=============================================
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글 수정</h2>
	<form action="./update_content_process.jsp" method="post">
		작성자 : <%=nick %><br>
		제목 : <input name="title" type="text" value="<%=title %>"><br>
		내용 : <br>
		<textarea name="content" rows="7" cols="40"><%=content %></textarea>
		<br>
		<input type="hidden" name="b_no" value="<%=b_no%>">
		<input type="submit" value="수정">
		
	</form>
	
	
</body>
</html>