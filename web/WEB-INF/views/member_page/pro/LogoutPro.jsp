<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오전 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고먐미 로그아웃</title>
</head>
<body>
<%
    session.invalidate(); // 모든세션정보 삭제
    response.sendRedirect("/"); // 로그인 화면으로 다시 돌아간다.
%>
</body>
</html>
