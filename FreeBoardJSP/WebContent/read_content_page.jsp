<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 	<%@page import = "java.sql.*" %>
    <%
    //게시판에서 글 제목을 클릭하면 나오는 각각의 글 페이지 
    
    	request.setCharacterEncoding("utf-8");
    	String b_no = request.getParameter("b_no");
    	
    	/*
    	
    	SELECT * FROM FB_Board, FB_Member WHERE FB_Member.m_no = FB_Board.m_no
    	AND
    	FB_Board.b_no=3;
    	
    	*/
    	
    	String sql 
    	= String.format
    	("SELECT * FROM FB_Board, FB_Member WHERE FB_Member.m_no = FB_Board.m_no AND FB_Board.b_no=%s",b_no);
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
    	
    	//CSRF 방어
    	content = content.replaceAll("<", "&lt");
    	content = content.replaceAll(">", "&gt");
    	
    	//DB의 엔터 값을 <br>로 리플레이스
    	content = content.replaceAll("\n", "<br>");
    	
    	
    	/*
		//====본문에 들어가는 CSRF 코드 예제======    	
    	
    	<from id="f1" action="./write_content_process.jsp" method="post">
		<input type="hidden" value="하하하하바보들" name="title">
		<input type="hidden" value="하하하하바보들" name="content">
		</form>
		
		<script>
		f1.submit();
		</script>

    	*/
    	
    	
    	
    	String nick = rs.getString("m_nick"); //글쓴이
    	String writedate = rs.getString("b_writedate");//글쓴날짜
    	
    	
   		String writerNo = rs.getString("m_no");
   		
   		
   		
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
	<h2>게시글 보기</h2>
	작성자 : <%=nick %><br>
	작성일 : <%=writedate %><br>
	제목 : <%=title %><br>
	내용 : <br>
	<%=content %>
	
	<br><br>
	<a href="./main_page.jsp">목록으로</a>
	
	<%
		//자신이 쓴 글에만 삭제 버튼이 뜨도록 처리
		//자신이 쓴 글에만 수정 버튼이 뜨도록 처리
		String sessionNo = (String) session.getAttribute("sessionNo");
		
		if(sessionNo != null && sessionNo.equals(writerNo)){
			//한쪽만 False 면 결과가 AND로 인해 False 이므로, 글쓴이가 아닌 경우에도 nullPointerException 이 발생하지 않는다.
			
			out.println("<a href='./delete_content_process.jsp?b_no="+b_no+"'>삭제</a>");
			
			out.println("<a href='./update_content_page.jsp?b_no="+b_no+"'>수정</a>");
		}
	%>
	
	
	
</body>
</html>