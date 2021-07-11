<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보보기(admin 용)</title>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_reading.css" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/admin.js" charset="utf-8"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="mainbox">
		<div class = "table">
		<h2>사업자 정보</h2>
			<table>
				<input type="hidden" name="h_no" id="hno" value="${hostInfo.h_no}">
				<tr>
					<td>상호명: </td>
					<td>${hostInfo.h_brand }</td>
				</tr>
				<tr>
					<td>사업자 번호: </td>
					<td>${hostInfo.h_bizno}</td>
				</tr>
				<tr>
					<td>사업자 이름: </td>
					<td>${hostInfo.h_name }</td>
				</tr>
				<tr>
					<td>사업자 전화번호 : </td>
					<td>${hostInfo.h_phone }</td>
				</tr>
				<tr>
					<td>사업자 이메일 : </td>
					<td>${hostInfo.h_mail }</td>
				</tr>
				<tr>
					<td>상태: </td>
					<c:choose>
						<c:when test="${hostInfo.h_active eq 0}">
							<td>대기중</td>
						</c:when>
						<c:when test="${hostInfo.h_active eq 1}">
							<td style="color: blue">승인</td>
						</c:when>
						<c:when test="${hostInfo.h_active eq 2}">
							<td style="color: red">비승인</td>
						</c:when>
					</c:choose>
				</tr>

				<tr>
					<c:choose>
						<c:when test="${hostInfo.h_active eq 0}">
							<td colspan="3">
								<button class="btn_b" onclick="admin_approve()">승인</button>
								<button class="btn_b" onclick="admin_reject()">비승인</button>
								<button class="btn_b" onclick="history.back()">뒤로 가기</button>
							</td>
						</c:when>
						<c:when test="${hostInfo.h_active eq 1}">
							<td><button class="btn_m" onclick="admin_stop()">정지</button></td>
							<td><button class="btn_m" onclick="history.back()">뒤로 가기</button></td>
						</c:when>
						<c:when test="${hostInfo.h_active eq 2}">
							<td><button class="btn_m" onclick="admin_rollback()">승인</button></td>
							<td><button class="btn_m" onclick="history.back()">뒤로 가기</button></td>
						</c:when>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>