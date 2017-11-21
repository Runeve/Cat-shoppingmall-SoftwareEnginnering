<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-20
  Time: 오후 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 자바빈 클래스 import --%>
<%@ page import="member.MemberDAO" %>
<%-- DAO import --%>
<html>
<head>
    <meta charset="UTF-8">
    <title>고먐미 회원가입을 축하합니다</title>
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
<section id="join" style="">
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="member.MemberBean"/>
    <jsp:setProperty property="*" name="memberBean"/>
    <%
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String email1 = request.getParameter("email1");
        String email2 = request.getParameter("email2");

        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        String email = email1 + "@" + email2;
        int check = dao.joinCheck(email);

        // URL 및 로그인관련 전달 메시지
        String msg = "";

        if (check == 0)    // 이미 이메일이 있음
        {
            //메세지와 함께 다시 JoinForm으로 돌아감.
            msg = "JoinForm?msg=0";
            response.sendRedirect(msg);
        } else if (check == 1) //이메일이 없고 신규 가입일 경우
        {
            dao.insertMember(memberBean);
        }
    %>
    <div style="margin-top: 200px">
        <center>
            <table width="800">
                <tr height="40">
                    <td align="center"><h1>고먐미 회원이 되신 걸 축하합니다!</h1></td>
                </tr>
                <tr height="40">
                    <td align="center"><h2>회원정보를 확인하세요</h2></td>
                </tr>
            </table>

            <table width="500" height="100" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">회원 이메일</td>
                    <td><%=memberBean.getEmail() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">비밀번호</td>
                    <td><%=memberBean.getPassword() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이 름</td>
                    <td><%=memberBean.getName() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">성 별</td>
                    <td><%=memberBean.getGenderString() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">휴대전화</td>
                    <td><%=memberBean.getPhone() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
            </table>
            <br/>
            <table>
                <tr height="40">
                    <td>
                        <a href="/"><img src="/resources/img/member_image/btn_home.png" width="120"/></a>
                    </td>
                </tr>
            </table>
            </form>
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