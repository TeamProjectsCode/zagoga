<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 리스트(admin 용)</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_list.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="container">
		<div id="input-form">
		<hr>
			<h2>유저 목록</h2>
			<hr>
			<p></p>
		유저 닉네임  <input type="text" id="keyword">
		</div>
		<table id="user-table">
			<thead>
				<tr>
					<th>이름</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>전화 번호</th>
				</tr>
			</thead>
			<c:forEach var="user" items="${userlist}" >
			<tbody>
				<tr>
					<td>${user.u_name }</td>
					<td><a href = "user_detail?u_no=${user.u_no }">${user.u_mail }</a></td>
					<td>${user.u_nick }</td>
					<td>${user.u_phone }</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		<script>
			$("#keyword").keyup(function() {
								var k = $(this).val();
								$("#user-table > tbody > tr").hide();
								var temp = $("#user-table > tbody > tr > td:nth-child(4):contains('"+ k + "')");
								$(temp).parent().show();
							})
		</script>
	</div>
		<%@ include file="../footer.jsp" %>
</body>
</html>