<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오전 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.MemberDAO" %>
<html>
<head>
    <title>로그인 처리 JSP</title>
</head>
<body>
<%
    // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
    String email = request.getParameter("email");
    String pw = request.getParameter("password");

    // DB에서 아이디, 비밀번호 확인
    MemberDAO dao = MemberDAO.getInstance();
    int check = dao.loginCheck(email, pw);

    // URL 및 로그인관련 전달 메시지
    String msg = "";
    if (check == 1)    // 로그인 성공
    {
        // 세션에 현재 아이디 세팅
        session.setAttribute("sessionID", email);
        session.setAttribute("sessionName", dao.getName(email));
        msg = "/";
    } else if (check == 0) // 비밀번호가 틀릴경우
    {
        msg = "LoginForm?msg=0";
    } else    // 아이디가 틀릴경우
    {
        msg = "LoginForm?msg=-1";
    }
    // sendRedirect(String URL) : 해당 URL로 이동
    // URL뒤에 get방식 처럼 데이터를 전달가능
    response.sendRedirect(msg);
%>
</body>
</html>