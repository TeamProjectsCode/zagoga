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
				<td><input type="text" id ="name" name = "name" value="${user.h_name}" disabled></td>
			</tr>
			<tr height="20">
				<td>생년월일</td>
				<td>${fn:substring(user.h_jumin, 0, 2)}년 ${fn:substring(user.h_jumin, 2, 4)}월 ${fn:substring(user.h_jumin, 4, 6)}일</td>
			</tr>
			<tr height="20">
				<td>핸드폰 번호</td>
				<c:set value="${fn:substring(user.h_phone, 0, 3)}" var="h_phone1" />
				<c:choose>
					<c:when test="${fn:length(user.h_phone) eq 11}">
						<c:set value="${fn:substring(user.h_phone, 3, 7)}" var="h_phone2" />
						<c:set value="${fn:substring(user.h_phone, 7,11)}" var="h_phone3" />
					</c:when>
					<c:when test="${fn:length(user.h_phone) eq 10}">
						<c:set value="${fn:substring(user.h_phone, 3, 6)}" var="h_phone2" />
						<c:set value="${fn:substring(user.h_phone, 6,10)}" var="h_phone3" />
					</c:when>
				</c:choose>
				<td>
					<input type="text" name="u_phone" value="${h_phone1}" maxlength="3" style="width: 55px;">-
					<input type="text" name="u_phone" value="${h_phone2}" maxlength="4" style="width: 55px;">-
					<input type="text" name="u_phone" value="${h_phone3}" maxlength="4" style="width: 55px;">
				</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" id = "id" value="${user.h_mail}" disabled></td>
			</tr>
			<tr>
				<td>계좌번호</td>
				<c:set value="${fn:substring(user.h_bank,0 , 3)}" var="h_bank1"/>
				<c:set value="${fn:substring(user.h_bank,3,fn:length(user.h_bank))}" var="h_bank2"/>
				<td>
					<input type="text" id="bank1" name="h_bank" value="${h_bank1}" size="6"><br>
					<input type="text" id="bank2" name="h_bank" value="${h_bank2}" maxlength="14">
				</td>
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