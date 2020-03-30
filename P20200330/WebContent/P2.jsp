<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
  <%-- <%@ %>사이의 내용은 변환되는 java 파일에 import 문으로 들어간다 (패키지 import) --%>
    
  
    <%! 
   		int a = 10;
    //int a = 10; --> 컴파일 할 때 주석으로 처리 되 버린다.
    %>
    <%-- <%! %>사이의 내용은 변환되는 java 파일에 맴버변수 선언문으로 들어간다 --%>
    
    
    
    <% 
    	int b = 20;
    	System.out.println("xxxxxx");
    	
    %>
     <%-- <%%>사이의 내용은 변환되는 java 파일에 메소드 내부에 그대로 코드가 들어간다. --%>
     
    <%=b   
    %>
   <%-- <%=%>사이의 내용은 변환되는 java 파일에 출력문(out.print(b);)으로 들어간다 --%>
    
    <%-- JSP 주석 --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 안녕하세요.... --%><%-- JSP 주석 : 클라이언트 단에서 볼 수 없음(JAVA 코드로 변환 자체를 안한다) --%>
<!-- 안녕하세요.... --><!-- HTML 주석 : 클라이언트 단에서 볼 수 있음 -->

</body>
</html>