<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>

	<center>
		<form action="#" method="post">
		<div class="container">
			<table class="table table-hover">
				<tr>
					<td>이름</td>
					<td><input type="text" name="u_name" required="required">
				</tr>
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="u_jumin" required="required">
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="u_address" required="required">
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="u_email" required="required">
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="u_pwd" required="required">
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="u_pwd2" required="required">
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" name="u_phone" required="required">
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
			</div>
		</form>
	</center>
</body>
</html>