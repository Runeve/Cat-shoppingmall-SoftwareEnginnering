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
    <title>회원정보 수정 완료</title>
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
            <%-- 자바빈 관련 액션태그 사용 --%>
            <jsp:useBean id="memberBean" class="member.MemberBean"/>
            <jsp:setProperty property="*" name="memberBean"/>
            <%
                // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
                String email = (String) session.getAttribute("sessionID");
                String ps = request.getParameter("password");

                // DB에서 아이디, 비밀번호 확인
                MemberDAO dao = MemberDAO.getInstance();
                int check = dao.loginCheck(email, ps);

                // URL 및 로그인관련 전달 메시지
                String msg = "";

                if (check == 0)    // 비밀번호가 틀림
                {
                    //메세지와 함께 다시 JoinForm으로 돌아감.
                    msg = "ModifyForm?msg=0";
                    response.sendRedirect(msg);
                } else if (check == 1) //로그인 성공
                {
                    // 세션에서 아이디를 가져와 MemberBean에 세팅한다.
                    memberBean.setEmail(email);

                    // 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한다.
                    dao.updateMember(memberBean);
                }
            %>
            <table width="800">
                <tr height="40">
                    <td align="center"><h1>회원 정보가 수정되었습니다.</h1></td>
                </tr>
            </table>
            <table>
                <tr height="40">
                    <td>
                        <a href="/"><img src="/resources/img/member_image/btn_home.png" width="120"/></a>
                    </td>
                </tr>
            </table>
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
