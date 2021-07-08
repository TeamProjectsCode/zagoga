<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경 (host용)</title>
<link href="/resources/css/mypage_host_info.css" media="all"
	rel="Stylesheet" type="text/css" />
	  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/mypage_host_info.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form>
	<div id="mainbox">
	<h2>회원 정보 변경 (사업자)</h2>
		<form action="#" method="post">
		<table>
			<tr>
				<td>사업자 번호</td>
				<td><input type="text" id = "businessNumber" value="${user.h_bizno}" disabled></td>
			</tr>
			<tr>
				<td>브랜드 명</td>
				<td><input type="text" id = "email" name="email" value="${user.h_brand}" disabled></td>
			</tr>
			<tr>
				<td>사업자 이름</td>
				<td><input type="text" id ="name" name = "name" value="${user.h_name}"></td>
			</tr>
			<tr>
				<td>전화 번호</td>
				<td><input type="text" id = "phoneNumber" name = "phoneNumber" value="${user.h_phone}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id = "id" value="${user.h_mail}" disabled></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id = "pw"  name = "pw" type="password"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input id = "pw2" type="password"></td>
				<td><button type="button" onclick = "hostPw()">확인하기</button></td>
			</tr>
			<tr>
				<td></td>
				<td id="msg"></td>
			</tr>
		</table>
		</form>
		<div id = "button">
			<!-- js 추가 필요 -->
			<button type="submit" onclick = "check()">수정완료</button>
			<button onclick="history.go(-1)">취소</button>
		</div>
	</div>
	<script>
		function check(){
			var win = window.open('/host/mypage_check?no=' + ${user.h_no},'','width=400px,height=400px')
		}
		
	</script>
	</form>
	<%@ include file="../footer.jsp"%>
<script>
	function hostPw () {
		var pw01 = $("#pw").val();
		var pw02 = $("#pw2").val();

		$.ajax({
			type: "POST",
			url:"/host/pw_check.do",
			data:{pw01: pw01 , pw02:pw02},
			success: function(data){
				console.log(data)
				if (data == 0) {
					$("#msg").text("비밀번호가 일치하지 않습니다.");
					$("#msg").css("color", "red");
				}
				else if(data == 1){
					$("#msg").text("비밀번호가 일치합니다.");
					$("#msg").css("color", "blue");
					document.getElementById('pw').readOnly = true;
					document.getElementById('pw2').readOnly = true;
				}
			}
		});
	}
</script>
</body>
</html>