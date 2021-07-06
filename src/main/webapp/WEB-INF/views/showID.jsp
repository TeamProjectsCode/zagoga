<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/showID.css" />
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
            <li>아이디 찾기</li>
        </div>
        <p></p>
        <div class="box">
            <div>${name}님의 아이디는 다음과 같습니다.</div><br>
           <div>아이디 : ${mail} </div>
        </div>
        <button class="btn" onclick="location.href='/login'">로그인</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="btn" onclick="location.href='/findPW'">비밀번호 찾기</button>
    </div>
<div class="space"></div>
</body>
</html>
