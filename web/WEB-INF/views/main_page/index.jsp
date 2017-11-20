<%--
  Created by IntelliJ IDEA.
  User: GRu
  Date: 2017-11-12
  Time: 오후 9:24
  This page is main page.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>고먐미</title>
    <link rel="stylesheet" href="https://raw.github.com/necolas/normalize.css/master/normalize.css"/>
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/index/onlycss.css">
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/menucss.css">
    <link rel="stylesheet" href="${PageContext.request.ContextPath}resources/css/common/endcss.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="${PageContext.request.ContextPath}/resources/js/main_page/7-jqueryxcss.js"></script>
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
<section id="first" class="content">
    <p class="logo sprite" data-speed="-1.5" data-offsety="100">GOMYAMMI</p>
    <article>
        <h1>고먐미</h1>
        <h3 style="text-align: right">강력한 에프타-케어</h3>
        <p> 과연 이 사이트는 무엇을 하는 사이트일까요? 매우궁금띠
            앙궁금띠 바로바로 고양이를 입양하고 분양을 할수 있답니다!
            입양된 고양이, 분양된 고양이 어떻게 지내는지 궁금하시다구요?!
            확실한 에프터-케어 고먐미 사이트를 이용하세요!
        </p>
        <p>
            <a href="adapt" style="font-size: 20px; text-decoration:none">
                <h3 style="text-align: right">
                    <img src="/resources/img/main_image/nyang.png" width="60" height="60">
                    고먐미들 보러가기 ->
                </h3>
            </a>
        </p>
    </article>
</section>

<section id="second" class="content">
    <article>
        <h2>고먐고먐!!!!</h2>
        <p> 야옹! </p>
    </article>
</section>

<section id="third" class="content">
    <article>
        <h2>헷 됐당</h2>
        <p>냥냥펀치!</p>
    </article>
    <img src="${PageContext.request.ContextPath}/resources/img/main_image/main_sub_cat01.jpg" class="sprite"
         data-speed="2"
         data-offsety="1600"/>
</section>

<section id="theend" class="content">
    <h2 class="sprite" data-speed="0.8" data-offsety="4180">The End.</h2>
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