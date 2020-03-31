<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ 
    	page import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrapper{
	weidth:600px;
	height:800px;
	border:1px solid black;
	margin : 30px auto;
}
</style>
</head>
<body>
	<div id="wrapper">
		<h1>게시판</h1>
		<br>
		<%
			String sessionNick = (String)session.getAttribute("sessionNick");
			//들어갈땐 string 값을 넣을 수 있지만, 나올땐 Object 형 이므로 String 으로 받으려면 casting 이 필요하다.
			if(sessionNick == null){
				out.println("비회원으로 접근 하였습니다.");
				out.println("<a href='./login_page.jsp'>로그인 페이지로....</a>");
			}else{
				out.println(sessionNick+"님 환영합니다.");
				out.println("<a href='./logout_process.jsp'>로그아웃</a>");
			}
		%>
		<!-- 내용 테이블 -->
		<table border="1">
			<tr><td>글번호</td><td>제목</td><td>작성자</td></tr>
<%
			String sql = "select * from fb_Board, fb_member WHERE fb_board.m_no=fb_member.m_no ORDER BY fb_Board.b_no DESC";
			//================DB 연동 (SELECT)==================
			
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
	    	//로직처리 시작...
			while(rs.next()){
				
				String b_no = rs.getString("b_no");
				String b_title = rs.getString("b_title");
				String m_nick = rs.getString("m_nick");
				
				
				out.print("<tr>");
				out.print("<td>"+b_no+"</td>");
				out.print("<td>"+b_title+"</td>");
				out.print("<td>"+m_nick+"</td>");
				out.print("</tr>");
			}    	
	    	
	    	
    		//로직처리 끝....

	    	rs.close();
	    	stm.close();
	    	conn.close();
%>
		</table>
		<br>
		<%
			if(sessionNick != null){
				out.println("<a href='./write_content_page.jsp'>글쓰기</a>");	
			}
		%>

		
	</div>						
</body>
</html>