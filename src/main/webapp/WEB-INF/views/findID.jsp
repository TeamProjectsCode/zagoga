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
                <button class="dropbtn" onclick="location.href='/login/findID'">아이디 찾기</button>
            </div>
            <div class="dropdown">
                <button class="dropbtn" onclick="location.href='/login/findPW'">비밀번호 찾기</button>
            </div>
        </div>
    </header>
    <!-- 공간 비우기용-->
    <div class="space"></div>
    <div class="main">
        <div class="title">
            <li>아이디 찾기</li>
        </div>
        <p>아이디를 찾는 방식을 선택해 주세요.</p>
        <div class="box">
            <input type="radio" name="radio" id="info" onclick="dispList('0');"><label for="info">등록된 정보를 통한 아이디 찾기</label>
            <div id="infobox" style="display:none">
                <form name="form" action="/login/showID" method="post">
                    <table>
                        <tr>
                            <td>타입</td>
                            <td>
                                <input type="radio" name="type" id="user" value="USER"><label for="user">여행객</label>
                                <input type="radio" name="type" id="host" value="HOST"><label for="host">호스트</label>
                            </td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input name="name" id="name"></td>
                        </tr>
                        <tr>
                            <td>주민번호</td>
                            <td><input name="jumin" id="jumin" placeholder=" -제외하고 입력해주세요" maxlength="13" onkeyup="$(this).val($(this).val().replace(/\D/g,''));"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="box2">
            <input type="radio" name="radio" id="phone" onclick="dispList('1');"><label for="phone">본인명의의 휴대폰으로 찾기</label>
            <div id="phonebox" style="display:none">
                <p>너는.. 다음에 보자</p>
            </div>
        </div>
        <button class="btn" onclick="infoCheck();">다&nbsp;&nbsp;&nbsp;음</button>
    </div>
<div class="space"></div>
</body>
</html>
