<%@ page import="member.MemberBean" %>
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
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/menucss.css">
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/endcss.css">
</head>
<body onload="init()">
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
    <%
        String email = session.getAttribute("sessionID").toString();

        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        MemberDAO dao = MemberDAO.getInstance();
        MemberBean memberBean = dao.getUserInfo(email);
    %>
    <script type="text/javascript">
        function init() {
            setComboValue("<%=memberBean.getGender()%>", "<%=memberBean.getNumOfFamily()%>", "<%=memberBean.getPastExperience()%>");
        }

        function setComboValue(val1, val2, val3) {

            var selectGenderM = document.getElementById('genderM'); // 각 라디오의 아이디를 가져온다.
            var selectGenderF = document.getElementById('genderF');

            if (selectGenderM.value == val1)  // 입력된값과 option의 value가 같은지 비교
                selectGenderM.checked = true; // 같은경우라면 체크되도록 한다.
            else if (selectGenderF.value == val1)
                selectGenderF.checked = true; // 같은경우라면 체크되도록 한다

            var selectNumOfFamily = document.getElementById('numOfFamily'); // select 아이디를 가져온다.
            for (i = 0, j = selectNumOfFamily.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectNumOfFamily.options[i].value == val2)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectNumOfFamily.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
            var selectPastExperience = document.getElementById('pastExperience'); // select 아이디를 가져온다.
            for (i = 0, j = selectNumOfFamily.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectPastExperience.options[i].value == val3)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectPastExperience.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }

        // 비밀번호 입력여부 체크
        function checkValue() {
            if (!document.userInfo.password.value) {
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
    </script>
    <div style="margin-top: 200px">
        <center>
            <form method="get" action="ModifyPro" name="userInfo" onsubmit="return checkValue()">
                <table width="800">
                    <tr height="40">
                        <td align="center"><h2>회원 정보 수정</h2></td>
                    </tr>
                </table>

                <table width="500" height="100" cellpadding="0" style="border-collapse:collapse; font-size:9pt;">
                    <tr class="register" height="30">
                        <td width="5%" align="center">*</td>
                        <td width="15%">회원 이메일</td>
                        <td><b><%=memberBean.getEmail() %>
                        </b>
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
                        <td><input type="password" name="password" id="password" placeholder="수정하기 위해선 비밀번호를 꼭 입력하세요."/>
                            <%
                                // 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
                                // LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
                                String msg = request.getParameter("msg");

                                if (msg != null && msg.equals("0")) {
                            %>
                            <script type="text/javascript">
                                inputForm.password.focus();
                            </script>
                            <font color='red' size='2'>비밀번호가 틀립니다.</font>
                            <%
                                }
                            %>
                        </td>
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
                        <td><input type="text" name="name" id="name" value="<%=memberBean.getName()%>"/></td>
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
                            남 성<input type="radio" name="gender" id="genderM" value="1"/>&nbsp;
                            여 성<input type="radio" name="gender" id="genderF" value="2"/>
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
                        <td><input type="tel" name="phone" value="<%=memberBean.getPhone()%>"/></td>
                    </tr>
                    <tr height="7">
                        <td colspan="3">
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
                        <td><input type="text" name="age" id="age" size="5" value="<%=memberBean.getAge()%>"/>세</td>
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
                        <td><input type="text" name="profession" id="profession"
                                   value="<%=memberBean.getProfession()%>"/></td>
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
                        <td>
                            <select name="numOfFamily" id="numOfFamily">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6 이상</option>
                            </select>명
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
                        <td><input type="text" name="housing" id="housing" value="<%=memberBean.getHousing()%>"/></td>
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
                        <td>
                            <textarea name="preparedEnviro" id="preparedEnviro" class="input" style="resize: none;"
                                      cols="40" rows="8"><%=memberBean.getPreparedEnviro()%></textarea>
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
                        <td>
                            <select name="pastExperience" id="pastExperience">
                                <option value="0">0</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6 이상</option>
                            </select>번
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
                            <input width="120" type="image" src="/resources/img/member_image/btn_confirm.png"/>
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
