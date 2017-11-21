<%@ page import="member.MemberBean" %>
<%@ page import="member.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오후 8:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=session.getAttribute("sessionName") %>님의 회원정보</title>
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
<section id="login" style="">
    <jsp:useBean id="memberBean" class="member.MemberBean"/>
    <jsp:setProperty property="*" name="memberBean"/>
    <%
        String email = session.getAttribute("sessionID").toString();

        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDAO dao = MemberDAO.getInstance();
        MemberBean mb = dao.getUserInfo(email);
    %>
    <div style="margin-top: 200px">
        <center>
            <table width="800">
                <tr height="40">
                    <td align="center"><h2>[<b><%=session.getAttribute("sessionName")%>
                    </b>]님의 회원정보</h2></td>
                </tr>
            </table>

            <table width="500" height="100" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">회원 이메일</td>
                    <td><%=mb.getEmail() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="4">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">비밀번호</td>
                    <td width="25%"><%=mb.getPassword() %>
                    </td>
                    <td>
                        <a href="/ChangePsForm"><img src="/resources/img/member_image/btn_modifyPs.png" width="60"
                                                     height="25"/></a>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="4">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">이 름</td>
                    <td><%=mb.getName() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="4">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">성 별</td>
                    <td><%=mb.getGenderString() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="4">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="15%">휴대전화</td>
                    <td><%=mb.getPhone() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="4">
                        <hr/>
                    </td>
                </tr>
            </table>
            <br/>
            <table width="500" height="30" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                <tr height="30">
                    <td width="30%" align="left"><b>세부 정보</b></td>
                </tr>
            </table>
            <table width="500" height="100" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">나 이</td>
                    <td><%=mb.getAge() %>세
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">직 업</td>
                    <td><%=mb.getProfession() %>>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">동거인 수</td>
                    <td><%=mb.getNumOfFamily() %>명
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">주거 형태</td>
                    <td><%=mb.getHousing() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">준비된 환경</td>
                    <td><%=mb.getPreparedEnviro() %>
                    </td>
                </tr>
                <tr height="7">
                    <td colspan="3">
                        <hr/>
                    </td>
                </tr>
                <tr class="register" height="30">
                    <td width="5%" align="center">*</td>
                    <td width="25%" align="left">과거 애완경험 횟수</td>
                    <td><%=mb.getPastExperience() %>번
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
                        <a href="/ModifyForm"><img src="/resources/img/member_image/btn_modify.png" width="120"/></a>
                    </td>
                    <td>
                        <a href="/DeleteForm"><img src="/resources/img/member_image/btn_secession.png" width="120"/></a>
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
