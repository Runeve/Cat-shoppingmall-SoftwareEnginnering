<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오후 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>고먐미 회원탈퇴</title>
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
<script type="text/javascript">
    // 비밀번호 미입력시 경고창
    function checkValue() {
        if (!document.deleteform.password.value) {
            alert("비밀번호를 입력하지 않았습니다.");
            return false;
        }
    }
</script>
<section id="register" style="">
    <div style="margin-top: 200px">
        <center>
            <form name="deleteform" method="get" action="DeletePro"
                  onsubmit="return checkValue()">
                <table width="800">
                    <tr height="40">
                        <td align="center"><h1>정말로 탈퇴하시겠습니까?</h1></td>
                    </tr>
                    <tr height="40">
                        <td align="center"><h2>비밀번호를 입력해주세요.</h2></td>
                    </tr>
                </table>
                <table width="500" height="100" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                    <tr height="3">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                    <tr class="register" height="10">
                        <td width="5%" align="center">*</td>
                        <td width="15%">비밀번호</td>
                        <td><input type="password" name="password" id="password"/></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr height="40">
                        <td><input width="120" type="image"
                                   src="/resources/img/member_image/btn_secession.png"/>&nbsp;<a
                                href="/"><img src="/resources/img/member_image/btn_cancel.png" width="120"/></a>
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
