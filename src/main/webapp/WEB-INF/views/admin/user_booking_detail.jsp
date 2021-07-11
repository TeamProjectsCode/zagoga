<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_booking_detail.css" />
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
					<th>예약한 게스트 하우스</th>
					<th>예약했던 방</th>
					<th>예약 날짜</th>
					<th>예약 완료 여부</th>
				</tr>

			 <c:forEach items="${bookingList }" var="booking" >

				<tr>
					<td>${booking.gh_name }</td>
					<td>${booking.r_name}</td>
					<td>${booking.b_in }</td>
					<c:choose>
						<c:when test="${booking.b_state == 0 }">
							<td>승인 대기중</td>
						</c:when>
						<c:when test="${booking.b_state == 1 }">
							<td>예약 완료</td>
						</c:when>
						<c:when test="${booking.b_state == 2 }">
							<td>예약 거절</td>
						</c:when>
						<c:when test="${booking.b_state == 3 }">
							<td>예약 취소</td>
						</c:when>
					</c:choose>					
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>