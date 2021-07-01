<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 회원가입(user용)</title>
	<link href="/resources/css/user_join.css" media="all" rel="Stylesheet" type="text/css" />
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/user.js" type="text/javascript"></script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<center>
		<form name="form" action="/register/user" method="post">
		<div class="container">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" id="name" name="u_name">
				</tr>
				<tr>
					<td>성별</td> <!--값 제대로 안넘어가면 말씀해주세요 -->
					<td><input type="radio" id="man" name = "u_gender" value="남"><label for="man">남성</label>
						<input type="radio" id="woman" name = "u_gender" value="여" ><label for="woman">여성</label></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="u_nick" id="nick">
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" id="jumin1" name="u_jumin" size="10" maxlength="6"> - <input type="password"  id="jumin2" name="u_jumin" size="10" maxlength="7"> </td>
				</tr>
                <tr>
                    <td>이메일 : </td>
					<td >
						<input type="text" id="emailID" name="u_mail" placeholder="이메일" >
						@ <select id="emailAddr" name="u_mail" >
						<option>선택</option>
						<option value="@naver.com" >naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@nate.com">nate.com</option>
					</select>
					</td>
                </tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="pw"name="u_pwd" >
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" id="pwCheck" name="u_pwd2">
				</tr>
                <tr>
                    <td>주소 : </td>
                    <td>
                    	<input type="text" id="sample6_address" name="u_addr" placeholder="주소" readonly>&nbsp;&nbsp;
                    	<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색"><br>
						<input type="text" id="sample6_detailAddress" name="u_addr" placeholder="상세주소">
                    </td>
                </tr>
				<tr>
					<td>전화 번호</td>
					<td>
						<select class="u_phone">
							<option>선택</option>
							<option selected>010</option>
						</select>
						- <input type="text" id="phone1" class="u_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));">
						- <input type="text" id="phone2" class="u_phone" maxlength="4" size="5" onkeyup="$(this).val($(this).val().replace(/\D/g,''));">
					</td>
				</tr>
				<tr align="center">
					<td colspan="4" class="btn">
						<input type="button" onclick="check()" value="등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="취소" onclick="location.href='/main'">
					</td>
				</tr>
			</table>
			</div>
		</form>
	</center>
	<%@ include file="../footer.jsp" %>
</body>
</html>