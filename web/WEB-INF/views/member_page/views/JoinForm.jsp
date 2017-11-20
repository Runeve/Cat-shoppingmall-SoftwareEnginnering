<%--
  Created by IntelliJ IDEA.
  User: Hyerin
  Date: 2017-11-20
  Time: 오전 2:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>고먐미 회원가입</title>
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/menucss.css">
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/endcss.css">
</head>
<body>
<section id="menuBar" class="menu-bar" style="">

    <ul style="text-align: right;">
        <li><a href="#" style="font-size: 10pt">Login</a></li>
        <li><a href="#" style="font-size: 10pt">Resister</a></li>
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
<section id="register" style="">
    <div style="margin-top: 200px">
        <center>
            <form method="get" action="join">
                <table width="800">
                    <tr height="40">
                        <td align="center"><h1>[회원가입]</h1></td>
                    </tr>
                </table>
                <table width="700" height="600" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">회원 이메일</td>
                        <td><input type="text" name="email"/></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">비밀번호</td>
                        <td><input type="password" name="password" id="password"/></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">비밀번호 확인</td>
                        <td><input type="password" name="passwordcheck" id="passwordcheck"></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">이 름</td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
                            <hr/>
                        </td>
                    </tr>
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">성 별</td>
                        <td>
                            남 성<input type="radio" name="gender" value="1" checked/>&nbsp;
                            여 성<input type="radio" name="gender" value="2"/>
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
                        <td><input type="tel" name="phone"/></td>
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
                        <td><input width="120" type="image" src="/resources/img/member_image/btn_register.PNG"/>&nbsp;<a
                                href="/"><img src="/resources/img/member_image/btn_cancel.PNG" width="120"/></a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </div>
    <script type="text/javascript">

        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue() {
            if (!document.userInfo.email.value) {
                alert("아이디를 입력하세요.");
                return false;
            }

            if (!document.userInfo.password.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if (document.userInfo.password.value != document.userInfo.passwordcheck.value) {
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
        }
    </script>
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
