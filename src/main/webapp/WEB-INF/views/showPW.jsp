<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/findID.css" />
    <script src="/resources/js/findid.js"></script>
</head>
<body>
    <header>
        <h2>
            <a href="/main">Zagoga</a>
        </h2>
        <div class="imgbox"></div>
        <div class="navbox">
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/findID'">아이디 찾기</button>
            </div>
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/findPW'">비밀번호 찾기</button>
            </div>
        </div>
    </header>
    <!-- 공간 비우기용-->
    <div class="space"></div>
    <div class="main">
        <div class="title">
            <li>비밀번호 찾기</li>
        </div>
        <p></p>
        <div class="box">
            <div>(이름)님의 비밀번호는</div><br>
           <div>비밀번호가 000000으로 초기화 되었습니다. </div><br>
            <div>초기화된 비밀번호로 로그인해주세요!</div><br>
            <div>로그인 하신 후 비밀번호를 꼭 수정해주세요</div>
        </div>
        <button class="btn" onclick="location.href='/login'">로그인</button>
    </div>
<div class="space"></div>
</body>
</html>
