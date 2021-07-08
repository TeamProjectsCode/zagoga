<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:forEach var="user" items="${userInfo}" >
<center>
	<table>
	<tr>
		<th>유저 이메일</th>
		<td>${user.u_mail }</td>
	</tr>
	<tr>
		<th>유저 이름</th>
		<td>${user.u_name }</td>
	</tr>
	<tr>
		<th>유저 닉네임</th>
		<td>${user.u_nick }</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${user.u_gender }</td>
	</tr>
	<tr>
		<th>주민등록 번호</th>
		<td>${user.u_jumin }</td>
	</tr>
	<tr>
		<th>전화 번호</th>
		<td>${user.u_phone }</td>
	</tr>
	</table>
</center>
	</c:forEach>
<%@ include file="../footer.jsp" %>
</body>
</html>