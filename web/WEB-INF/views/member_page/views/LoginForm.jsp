<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-21
  Time: 오전 2:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>고먐미 로그인</title>
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/menucss.css">
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/endcss.css">
</head>
<body>
<section id="menuBar" class="menu-bar" style="">

    <ul style="text-align: right;">
        <li><a href="LoginForm" style="font-size: 10pt">Login</a></li>
        <li><a href="JoinForm" style="font-size: 10pt">Resister</a></li>
    </ul>

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

    function checkValue() {
        inputForm = eval("document.loginInfo");
        if (!inputForm.email.value) {
            alert("이메일 입력하세요");
            inputForm.email.focus();
            return false;
        }
        if (!inputForm.password.value) {
            alert("비밀번호를 입력하세요");
            inputForm.password.focus();
            return false;
        }
    }
</script>
<section id="login" style="">
    <div style="margin-top: 200px">
        <center>
            <form name="loginInfo" method="get" action="LoginPro"
                  onsubmit="return checkValue()">
                <table width="800">
                    <tr height="40">
                        <td align="center"><h1>[로그인]</h1></td>
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
                        <td width="15%">회원 이메일</td>
                        <td><input type="text" name="email"/></td>
                    </tr>
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
                <%
                    // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
                    // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
                    String msg = request.getParameter("msg");

                    if (msg != null && msg.equals("0")) {
                        out.println("<br>");
                        out.println("<font color='red' size='4'>비밀번호를 확인해 주세요.</font><br>");
                    } else if (msg != null && msg.equals("-1")) {
                        out.println("<br>");
                        out.println("<font color='red' size='4'>아이디를 확인해 주세요.</font><br>");
                    }
                %>
                <table>
                    <tr height="40">
                        <td><input width="120" type="image" src="/resources/img/member_image/btn_login.png"/>&nbsp;
                        </td>
                    </tr>
                </table>
                <table height="100">
                    <tr class="register" height="7">
                        <td>
                            아직 회원이 아니시라구요? <a href="JoinForm">>회원가입하러가기<</a>
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