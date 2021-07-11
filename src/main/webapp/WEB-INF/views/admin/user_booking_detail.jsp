<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_reading.css" />
	<script type="text/javascript" src="/resources/js/admin.js" charset="utf-8"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="mainbox">
		<div class = "table">
		<h2>예약 정보</h2>
			<table>
				<tr>
					<td>예약한 게스트 하우스</td>
					<td></td>
				</tr>
				<tr>
					<td>예약했던 방</td>
					<td></td>
				</tr>
				<tr>
					<td>예약 날짜</td>
					<td></td>
				</tr>
				<tr>
					<td>예약 완료 여부</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>