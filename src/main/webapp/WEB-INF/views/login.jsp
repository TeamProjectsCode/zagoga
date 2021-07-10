<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="/resources/css/login.css" media="all" rel="Stylesheet" type="text/css" />
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/login.js" type="text/javascript"></script>
    <script src="/resources/js/pwShowToggle.js" type="text/javascript"></script>
    <script src="/resources/js/guesthouse.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="./header.jsp" %>
	<form action="/loginNormal" method="POST" onsubmit="return blankCheck();">
    <div id = "mainbox">
        <c:choose>
            <c:when test="${user eq null}">

                <h2>로그인</h2>
                <table aria-describedby="loginTable">
                    <th id="loginTable"></th>
                    <tr><td class="inputHead">아이디</td></tr>
                    <tr><td colspan="2" class="inputID" ><input type="text" id="userID" name="username" placeholder="please enter your id"></td></tr>
                    <tr><td class="inputHead">비밀번호</td></tr>
                    <tr>
                        <td class="inputPW"><input type="password" id="userPW" name="password" placeholder="please enter your password"></td>
                        <td class="inputPWShow"><input type="image" id="userPWShow" onclick="pwShowToggle(); return false;" src="resources/img/visibility.png" alt="show password"/></td>
                    </tr>
                    <tr></tr>
                    <tr><td colspan="2"><input class="inputButton" type="submit" value="로그인"></td></tr>
                    <tr>
                        <td class="inputFinder"><a href="/login/findID">아이디</a><a href="/login/findPW">/비밀번호 찾기</a></td>
                        <td class="inputRegister"><a href="javascript:checkPopup()">회원가입</a></td>
                    </tr>
                </table>
                <div>
                    <a href="/oauth2/authorization/google"><img src="/resources/img/btn_google_signin_light.png" alt="구글 로그인" style="width: 55%; height: 55%"></a>
                    <a href="/oauth2/authorization/naver"><img src="/resources/img/btn_naver_signin_official.png" alt="네이버 로그인" style="width: 55%; height: 55%"></a>
                    <a href="/oauth2/authorization/kakao"><img src="/resources/img/btn_kakao_signin_large_narrow.png" alt="카카오 로그인" style="width: 55%; height: 55%"></a>
                </div>

            </c:when>
            <c:otherwise>

                이미 로그인 된 상태입니다 🤪.

            </c:otherwise>
        </c:choose>

    </div>
    </form>
    <%@ include file="./footer.jsp" %>

</body>
</html>