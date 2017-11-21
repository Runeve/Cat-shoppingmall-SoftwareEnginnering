<%@ page import="member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오후 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>회원탈퇴 처리완료</title>
        <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/menucss.css">
        <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/endcss.css">
    </head>
<body>

<section id="menuBar" class="menu-bar" style="">
    <%
        if (session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        {
    %>
    <ul style="text-align: right;">
        <li><a href="LoginForm" style="font-size: 10pt">Login</a></li>
        <li><a href="JoinForm" style="font-size: 10pt">Resister</a></li>
    </ul>
    <%
    } else // 로그인 했을 경우
    {%>
    <ul style="text-align: right;">
        <li><p style="font-size: 8pt"><b><%=session.getAttribute("sessionName") %>
        </b>님, 환영합니다!</p></li>
        <li><a href="UserInfoForm" style="font-size: 10pt">My Page</a></li>
        <li><a href="LogoutPro" style="font-size: 10pt">Logout</a></li>
    </ul>
    <%}%>
    <a href="/"><img src="${PageContext.request.ContextPath}/resources/img/main_image/logo.png"/></a>
    <ul>
        <li><a href="adapt">입양</a></li>
        <li>|</li>
        <li><a href="#">분양</a></li>
        <li>|</li>
        <li><a href="#">용품</a></li>
        <li>|</li>
        <li><a href="#">커뮤니티</a></li>
        <li>|</li>
        <li><a href="#">Contact Us</a></li>
    </ul>
</section>
<section id="delte" style="">
    <div style="margin-top: 200px">
        <center>
            <%
                String email = (String) session.getAttribute("sessionID");
                String pw = request.getParameter("password");

                // 세션에서 아이디를, DeleteForm.jsp에서 입력받은 비밀번호를 가져온다.
                // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
                MemberDAO dao = MemberDAO.getInstance();
                int check = dao.deleteMember(email, pw);

                if (check == 1) {
                    session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
            %>
            <table width="800">
                <tr height="40">
                    <td align="center"><h1>회원 정보가 삭제되었습니다.</h1></td>
                </tr>
            </table>
            <table>
                <tr height="40">
                    <td>
                        <a href="/"><img src="/resources/img/member_image/btn_home.png" width="120"/></a>
                    </td>
                </tr>
            </table>
            <%
                // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
            } else {
            %>
            <script>
                alert("비밀번호가 맞지 않습니다.");
                history.go(-1);
            </script>
            <%
                }
            %>
        </center>
    </div>
</section>
<section id="end">
    <section id="endcover">
    </section>
    <article>
        <h2><a href="/">고먐미</a></h2>
        <p><b>회사명</b> 고먐미 <b>대표</b> 이승연, 이혜린 <b>대표전화</b> 02-123-4567</p>
        <p><b>주소</b> 123456 서울특별시 중구 동국대학교</p>
        <p><b>이메일</b> gomyammi@naver.com</p>
    </article>
</section>
</body>
</html>
