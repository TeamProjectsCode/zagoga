<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 (host용)</title>
    <link href="/resources/css/regist_business.css" media="all" rel="Stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/resources/js/regist_business.js" type="text/javascript"></script>
    <script src="/resources/js/pwShowToggle.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<form action="/register/host" method="POST" onsubmit="return blankCheck();">
        <div class="inputHead">
            <h2>사업자 인증</h2>
            <input type="text" name="h_bizno" class="businessNum"  maxlength="3" pattern="[0-9]+"> - <input type="text" class="businessNum" name="h_bizno" maxlength="2" pattern="[0-9]+"> - <input type="text" class="businessNum" name="h_bizno" maxlength="5" pattern="[0-9]+">
            <button type="button" id="checkBusinessNumberBtn" onclick="checkBusinessNumber();">인증하기</button>
        </div>
        <h2>정보입력</h2>
        <table aria-describedby="registBusinessTable">
            <th id="registBusinessTable"></th>
            <tr><td class="input"><input type="text" id="brand" name="h_brand" placeholder="상호명" disabled required></td></tr>
            <tr><td class="input"><input type="text" id="owner" name="h_name" placeholder="대표자명" disabled required></td></tr>
            <tr>
                <td><input type="text" id="jumin1" name="h_jumin" size="16" maxlength="6" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" placeholder="주민번호" disabled required>
                    - <input type="password"  id="jumin2" name="h_jumin" size="16" maxlength="7" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" disabled required> </td>
            </tr>
            <tr>
                <td >
                    <input type="text" id="emailID" name="username" placeholder="이메일" disabled required>
                    @ <select id="emailAddr" name="username" disabled required>
                    <option>선택</option>
                    <option value="@naver.com" >naver.com</option>
                    <option value="@daum.net">daum.net</option>
                    <option value="@gmail.com">gmail.com</option>
                    <option value="@nate.com">nate.com</option>
                </select>
                </td>
            </tr>
            <tr>
                <td class="inputPW"><input type="password" id="userPW" name="password" placeholder="비밀번호" disabled required></td>
                <td class="inputPWShow"><input type="image" id="userPWShow" onclick="pwShowToggle(); return false;" src="../resources/img/visibility.png" alt="show password" disabled/></td>
            </tr>
            <tr><td class="inputPW"><input type="password" id="userPWCheck" name="userPWCheck" placeholder="비밀번호 재입력" disabled required></td></tr>
            <tr>
                <td>
                    <select  class="phoneNum" name="h_phone" disabled>
                        <option>선택</option>
                        <option selected >010</option>
                    </select>
                    - <input type="text" id="phone1" class="phoneNum" size="5" name="h_phone" maxlength="4" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" disabled required>
                    - <input type="text" id="phone2" class="phoneNum" size="5" name="h_phone" maxlength="4"  onkeyup="$(this).val($(this).val().replace(/\D/g,''));" disabled required>
                </td>
            </tr>
            <tr>
                <td>
                    <select id="bankSelect" name="h_bank" disabled required >
                        <option>계좌번호선택</option>
                        <option value="국민은행" >국민은행</option>
                        <option value="기업은행">IBK기업은행</option>
                        <option value="농협은행">NH농협은행</option>
                        <option value="신한은행">신한은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="하나은행">KEB하나은행</option>
                        <option value="씨티은행">씨티은행</option>
                        <option value="대구은행">DGB대구은행</option>
                        <option value="부산은행">BNK부산은행</option>
                        <option value="제일은행">SC제일은행</option>
                        <option value="케이뱅크">케이뱅크</option>
                </select>
                    <input type="text" id="bank" name="h_bank" maxlength="14" size="18" onkeyup="$(this).val($(this).val().replace(/\D/g,''));" disabled required>
                </td>
            </tr>
            <tr>
                <td class="inputButtonLayout">
                    <input class="inputButton" id="registerButton" type="submit" value="회원가입" disabled>
                    <input class="inputButton" type="button" value="취소" onclick="location.href='/main'">
                </td>
            </tr>
        </table>
    </form>
<%@ include file="../footer.jsp" %>
</body>
</html>