<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page errorPage = "/error/viewErrorMessage.jsp" %> <!-- 에러 처리 페이지 -->
<html>
<head><title>파라미터 출력</title></head>
<body>

name 파라미터 값: <%= request.getParameter("name").toUpperCase() %>

</body>
</html>