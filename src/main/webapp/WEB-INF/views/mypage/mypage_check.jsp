<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<center>
	<form action = "/pw_check" method="post">
	<h4>��й�ȣ�� �Է����ּ���</h4>
 		<input type = "password" name = "pw" id = "pw"><br>
 		<button type = "submit" onclick = "pw_check()">�Ϸ�</button>
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
						
						alert("�����߽��ϴ�.");
						self.close();
					}
					else if(data == "n"){
						
						alert("�����߽��ϴ�");
					}
				},
				error: function (e){
					alert("������ȣ �߼ۿ� �����Ͽ����ϴ�.")
					console.log('����',e);
				}
			});
		}
	</script>
</body>
</html>