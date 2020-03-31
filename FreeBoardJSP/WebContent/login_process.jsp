<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	//================DB 연동 (SELECT)==================
    	String sql = String.format("SELECT * FROM fb_member where m_id='%s' AND m_pw='%s'",id,pw);
    	
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
    	
    	boolean isSucess = true;
    	
    	if(rs.next()){
    		//로그인 성공 경우
    		isSucess = true;
    		
    		String no = rs.getString("m_no");
    		session.setAttribute("sessionNo", no); //(키[string], 값[어떤 값이든 가능])
    		//value 값으로는 ID의 index값(넘버) = 회원번호 를 담는 것이 좋다.
    		
    		String nick = rs.getString("m_nick");
    		session.setAttribute("sessionNick", nick);
    		
    	}else{
    		//로그인 실패
    		isSucess = false;
    	}
    	
    	//로직처리 끝....
    	
    	rs.close();
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
	
	<%
	if(isSucess){
		out.println("로그인성공<br>");
		out.println("<a href='./main_page.jsp'>메인페이지로...</a><br>");
	}else{
		out.println("아이디 혹은 비밀 번호를 확인해 주세요<br>");
		out.println("<a href='./login_page.jsp'>로그인 페이지로...</a><br>");
	}
	%>
	
</body>
</html>