<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%@page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<title>클래식기타 커뮤니티</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
  <link rel="stylesheet" type="text/css" href="css/header.css">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
  <link rel="stylesheet" type="text/css" href="css/board_left.css">
  <link rel="stylesheet" type="text/css" href="css/board_list_main.css">
  <style>
	table{
	text-align : center;
	}
  </style>
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
			
			//----------------------------------------
			
			//-----------------------------------------
			
		%>
  </article>
  <nav id="sub_menu">
    <ul>
      <li><a href="board_list.jsp">+ 자유 게시판</a></li>
      <li><a href="#">+ 방명록</a></li>
      <li><a href="#">+ 공지사항</a></li>
      <li><a href="#">+ 등업 요청</a></li>
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
    <div id="total_search">
      <div id="total">▷ 총 <% 

//String sql = "select * from rb_Board, rb_member WHERE rb_board.rbm_no=rb_member.rbm_no ORDER BY rb_Board.rbb_no DESC";
String sql2 = "select count(*) as cnt from rb_Board";
//================DB 연동 (SELECT)==================

// Test Code - 개발자를 위해 log를 찍는 용도
System.out.println("실행될 쿼리: "+sql2);

// class 동적 로드
Class.forName("oracle.jdbc.driver.OracleDriver");

// DB 연결
String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
String dbUser = "scott";
String dbPW = "tiger";
Connection conn2 = DriverManager.getConnection(dbURL, dbUser, dbPW);	// 접속
Statement stm = conn2.createStatement();// 실행 객체- 실행 관련 처리 

//ResultSet rs = stm.executeQuery(sql2);

//로직처리 시작...



//로직처리 끝....
      
      ResultSet rs2 = stm.executeQuery(sql2);
      rs2.next();

      out.print(rs2.getString("cnt"));%>개의 게시물이 있습니다.</div>
      <%   
      rs2.close();
      stm.close();
      conn2.close(); 
      %>
      <div id="search">
        <div id="select_img"><img src="img/select_search.gif"></div>
        <div id="search_select">
          <select>
            <option>제목</option>
            <option>내용</option>
            <option>글쓴이</option>
          </select> 
        </div>
        <div id="search_input"><input type="text"></div>
        <div id="search_btn"><img src="img/search_button.gif"></div>
      </div>
    </div>
    <table>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>일시</th>
        <th>조회수</th>
      </tr>
      <% 
    String sql0 = "select * from rb_Board, rb_member WHERE rb_board.rbm_no=rb_member.rbm_no ORDER BY rb_Board.rbb_no DESC";
      
      //================DB 연동 (SELECT)==================

      // Test Code - 개발자를 위해 log를 찍는 용도
      System.out.println("실행될 쿼리: "+sql2);

      // class 동적 로드
      Class.forName("oracle.jdbc.driver.OracleDriver");

      // DB 연결
      String dbURL0 = "jdbc:oracle:thin:@localhost:1521:xe";	// 1521: Listener Port, xe: xe데이터베이스
      String dbUser0 = "scott";
      String dbPW0 = "tiger";
      Connection conn0 = DriverManager.getConnection(dbURL0, dbUser0, dbPW0);	// 접속
      Statement stm0 = conn0.createStatement();// 실행 객체- 실행 관련 처리 

      ResultSet rs0 = stm0.executeQuery(sql0);

      //로직처리 시작...



      //로직처리 끝....
	//------------------------------------------------------------------					
			
//------------------------------------------------------------------					

      while(rs0.next()){
	
	String rbb_no = rs0.getString("rbb_no");
	String rbb_title = rs0.getString("rbb_title");
	String rbm_nick = rs0.getString("rbm_nick");
	String rbb_writedate = rs0.getString("rbb_writedate");
	
	out.print("<tr>");
	out.print("<td>"+rbb_no+"</td>"); // 번호
	out.print("<td><a href='./board_view.jsp?rbb_no="+rbb_no+"'>"+rbb_title+"</a></td>"); //제목
	out.print("<td>"+rbm_nick+"</td>"); //글쓴이
	out.print("<td>"+rbb_writedate+"</td>"); //일시
	out.print("<td>"+"</td>"); //조회수
	out.print("</tr>");
	out.println();
	
}    
      
      rs0.close();
      stm0.close();
      conn0.close(); 


      %>   

    </table>
    <div id="buttons">
      <div class="col1">◀ 이전 1 다음 ▶</div>
      <div class="col2">
        <img src="img/list.png"> 
       
      <%
			//회원인 경우
			if(sessionNick != null){out.print("<a href='board_write.jsp'><img src='img/write.png'></a>");}
			else{out.print("<img src='img/write.png'>");}//비회원인 경우
      %>
      </div>
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