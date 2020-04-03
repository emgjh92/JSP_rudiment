<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
    <%
    //게시판에서 글 제목을 클릭하면 나오는 각각의 글 페이지 
    request.setCharacterEncoding("utf-8");
    String rbb_no = request.getParameter("rbb_no");
    
    
    String sql 
    	= String.format
    	("SELECT * FROM RB_Board, RB_Member WHERE RB_Member.rbm_no = RB_Board.rbm_no AND RB_Board.rbb_no=%s",rbb_no);
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
    	
    	String title = rs.getString("rbb_title"); //글제목
    	String content = rs.getString("rbb_content"); //글 내용
    	
    	//CSRF 방어
    	content = content.replaceAll("<", "&lt");
    	content = content.replaceAll(">", "&gt");
    	
    	//DB의 엔터 값을 <br>로 리플레이스
    	content = content.replaceAll("\n", "<br>");

    	String nick = rs.getString("rbm_nick"); //글쓴이
    	
    	
   		String writerNo = rs.getString("rbm_no");
  	//로직처리 끝....
    rs.close();
	stm.close();
	conn.close();
	
	//=============================================
    %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<style>
#comment_col{
    width:80px;
    text-align:center;
}
</style>
<title>클래식기타 커뮤니티</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" type="text/css" href="css/board_left.css">
<link rel="stylesheet" type="text/css" href="css/board_view_main.css">
</head>
<body>
<div id="wrap">
<header>
  <a href="index.jsp"><img id="logo" src="img/logo.png"></a>
<nav id="top_menu">
  HOME | LOGIN | JOIN | NOTICE
</nav>
<nav id="main_menu">
  <ul>
    <li><a href="board_list.jsp">자유 게시판</a></li>
    <li><a href="#">기타 연주</a></li>
    <li><a href="#">공동 구매</a></li>
    <li><a href="#">연주회 안내</a></li>
    <li><a href="#">회원 게시판</a></li>
  </ul>
</nav>
</header> <!-- header -->
<aside>
  <article id="login_box">
    <%
			//비회원인 경우
			String sessionNick = (String)session.getAttribute("sessionNick");
   			
			if(sessionNick == null){
			out.print("<form action='login_process.jsp' method='post'>");
			out.print("<img id='login_title' src='img/ttl_login.png'>");
			out.print("<div id='input_button'>");
			out.print("<ul id='login_input'>");
			out.print("<li><input type='text' name='id'></li>");
			out.print("<li><input type='password' name='pw'></li>");
			out.print("</ul>");
 			
			out.print("<input type='image' src='img/btn_login.gif' id='login_btn'>");
			out.print("</div> ");
			out.print("<div class='clear'></div>");
			out.print("<div id='join_search'>");
			out.print("<a href='./join_member_page.jsp'>");
			out.print("<img src='img/btn_join.gif'></a>");
			out.print("<img src='img/btn_search.gif'>");
			out.print("</div>");
			out.print("</form>");
			}else{
				out.println(sessionNick+"님 환영합니다."); //회원일 경우
				out.println("<a href='./logout_process.jsp'>로그아웃</a>");
			}
			
		%>
  </article>
  <nav id="sub_menu">
    <ul>
      <li><a href="board_list.jsp">+ 자유 게시판</a></li>
      <li><a href="#">+ 방명록</a></li>
      <li><a href="#">+ 공지사항</a></li>
      <li><a href="#">+ 등업요청</a></li>
      <li><a href="#">+ 포토갤러리</a></li>
    </ul>
  </nav>
  <article id="sub_banner">
    <ul>
      <li><img src="img/banner1.png"></li>
      <li><img src="img/banner2.png"></li>		
      <li><img src="img/banner3.png"></li>
    </ul>	
  </article>
</aside> 

<section id="main">
  <img src="img/comm.gif">
  <h2 id="board_title">자유 게시판 </h2>
  <div id="view_title_box"> 
    <span><%=title %></span>
    <span id="info"><%=nick %> |     <%
    request.setCharacterEncoding("utf-8");
    String rbb_no_hit = request.getParameter("rbb_no");
    //int idx_hit = Integer.parseInt(request.getParameter("idx"));
    
    String sql_hit 
    	= String.format
    	("UPDATE RB_Board SET RBB_HIT = RBB_HIT + 1 WHERE RBB_NO=%s",rbb_no);

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
    %>조회 : <%
    //게시판에서 글 제목을 클릭하면 나오는 각각의 글 페이지 
    request.setCharacterEncoding("utf-8");
    String rbb_no_re = request.getParameter("rbb_no");
    
    
    String sql_re 
    	= String.format
    	("SELECT * FROM RB_Board, RB_Member WHERE RB_Member.rbm_no = RB_Board.rbm_no AND RB_Board.rbb_no=%s",rbb_no);
    	//================DB 연동 (SELECT)==================
    	System.out.println("실행될 쿼리: "+sql_re);
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	
    	// DB 연결
    	String dbURL_re = "jdbc:oracle:thin:@localhost:1521:xe";
    	String dbUser_re = "scott";
    	String dbPW_re = "tiger";
    	Connection conn_re = DriverManager.getConnection(dbURL_re, dbUser_re, dbPW_re);
    	Statement stm_re = conn_re.createStatement();
   
    	ResultSet rs_re = stm_re.executeQuery(sql_re);
    	
    	//로직처리 시작....
    	rs_re.next();
    	String rbb_hit = rs_re.getString("rbb_hit"); //글제목
    	String writedate = rs_re.getString("rbb_writedate");//글쓴날짜
    	String rbb_up = rs_re.getString("rbb_up");//좋아요
    	String rbb_down = rs_re.getString("rbb_down");//싫어요

  	//로직처리 끝....
    	rs_re.close();
	stm_re.close();
	conn_re.close();
	
	//=============================================
%><%=rbb_hit %> | <%=writedate %>  | </span>
  </div>	
  <p id="view_content">
    <%=content %>
  </p>
  
  
  <form action="./like_process.jsp" method="post">
  <input type="submit" value="좋아요" name="like"> : <%=rbb_up %> 
  <input type="hidden" name="hidden_no" value="<%=rbb_no %>">
  </form> 
  
  <form action="./dislike_process.jsp" method="post">
  <input type="submit" value="싫어요" name="dislike"> : <%=rbb_down %>
   <input type="hidden" name="hidden_no" value="<%=rbb_no %>">
  </form>
  <table>
  	<% 
  	String rbb_no2 = request.getParameter("rbb_no");
  	
    String sql_c = String.format(
"select * from rb_comment, rb_member,rb_board WHERE rb_comment.rbm_no=rb_member.rbm_no AND rb_comment.rbb_no=rb_board.rbb_no AND rb_comment.rbb_no=%s ORDER BY rb_comment.rbc_no ASC",rbb_no2);
      
    
    /*
    
    CREATE TABLE RB_COMMENT(
    rbc_no NUMBER(8),
    rbm_no NUMBER(8),
    rbb_no NUMBER(8),
    rbc_content VARCHAR2(1000),
    rbc_writedate DATE
);
    
    */
      //================DB 연동 (SELECT)==================

      // Test Code - 개발자를 위해 log를 찍는 용도
      System.out.println("실행될 쿼리: "+sql_c);

      // class 동적 로드
      Class.forName("oracle.jdbc.driver.OracleDriver");

      // DB 연결
      String dbURL_c = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
      String dbUser_c = "scott";
      String dbPW_c = "tiger";
      Connection conn_c = DriverManager.getConnection(dbURL_c, dbUser_c, dbPW_c);	// 접속
      Statement stm_c = conn_c.createStatement();// 실행 객체- 실행 관련 처리 

      ResultSet rs_c = stm_c.executeQuery(sql_c);

      while(rs_c.next()){
	
	String rbc_no = rs_c.getString("rbc_no");
	String rbc_content = rs_c.getString("rbc_content");
	String rbm_nick = rs_c.getString("rbm_nick");
	String rbc_writedate = rs_c.getString("rbc_writedate");
	
	out.print("<tr>");
	out.print("<td>"+rbc_no+"</td>"); // 번호
	out.print("<td>"+rbc_content+"</a></td>"); //댓글내용
	out.print("<td>"+rbm_nick+"</td>  "); //글쓴이
	out.print("<td>"+rbc_writedate+"</td>  "); //일시
	out.print("</tr>");
	out.println();
	
}    
      
      rs_c.close();
      stm_c.close();
      conn_c.close(); 


      %> 
	</table>		
  <div id="comment_box">
    <img id="title_comment" src="img/title_comment.gif">
    
      <form action="./write_comment_process.jsp" method="post"><!-- ------------ -->
      <textarea name="rbc_content"></textarea><input type="hidden" name="hidden_no" value="<%=rbb_no %>">
    <input type="image" id="ok_ripple" src="img/ok_ripple.gif">
      </form><!-- ------------ -->
    
  </div>
  
  
  
  <div id="buttons">
  <%
  out.print(" <form action='./delete_content_process.jsp?rbb_no="+rbb_no+"' method='post' name='rbb_no'> ");
 
  
  String sessionNo = (String) session.getAttribute("sessionNo");
	
	if(sessionNo != null && sessionNo.equals(writerNo)){
		//한쪽만 False 면 결과가 AND로 인해 False 이므로, 글쓴이가 아닌 경우에도 nullPointerException 이 발생하지 않는다.
		
		out.println("<input type='image' src='img/delete.png'>");
	}
  
     
    out.print("</form>");
    %>
    <a href="board_list.jsp"><img src="img/list.png"></a>
    <a href="board_write.jsp"><img src="img/write.png"></a>			
  </div>
</section> <!-- section main -->
<div class="clear"></div>
<footer>
  <img id="footer_logo" src="img/footer_logo.gif">
  <ul id="address">
    <li>서울시 강남구 삼성동 1234 우 : 123-1234</li>  
    <li>TEL : 031-123-1234  Email : email@domain.com</li>
    <li>COPYRIGHT (C) 루바토 ALL RIGHTS RESERVED</li>
  </ul>
  <ul id="footer_sns">
    <li><img src="img/facebook.gif"></li>  
    <li><img src="img/blog.gif"></li>
    <li><img src="img/twitter.gif"></li>
  </ul>
</footer> <!-- footer -->
</div> <!-- wrap -->
</body>
</html>