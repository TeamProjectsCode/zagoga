<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<center>
	<form action = "/pw_check" method="post">
	<h4>비밀번호를 입력해주세요</h4>
 		<input type = "password" name = "pw" id = "pw"><br>
 		<button type = "submit" onclick = "pw_check()">완료</button>
	</form>
</center>
	<script>
		function pw_check(){
			var pw = $("#pw").val()
			
			$.ajax({
				type:"POST",
				url:"/user/pw_check",
				data:{ pw:pw},
				success: function(data){
					if(data == "y"){
						
						alert("성공했습니다.");
						self.close();
					}
					else if(data == "n"){
						
						alert("실패했습니다");
					}
				},
				error: function (e){
					alert("인증번호 발송에 실패하였습니다.")
					console.log('실패',e);
				}
			});
		}
	</script>
</body>
</html>