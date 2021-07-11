<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_list.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
		<%@ include file="../header.jsp" %>
	<div id="container">
		<div id="input-form">
		<hr>
			<h2>예약 관리</h2>
			<hr>
			<p></p>
		유저 이름 <input type="text" id="keyword">
		</div>
		<table id="user-table">
			<thead>
				<tr>
					<th>유저 이름</th>
					<th>유저 닉네임</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${userList }" var="user" > 
				<tr>
					<td>${user.u_name }</td>
					<td>${user.u_nick }</td>
					</td>
					<td><a href = "user_booking_detail?u_no=${user.u_no }">확인하기</a></td>
				</tr>
			</c:forEach> 
			</tbody>
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