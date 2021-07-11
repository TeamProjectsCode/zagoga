<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보보기(admin 용)</title>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_reading.css" />
	<script type="text/javascript" src="/resources/js/admin.js" charset="utf-8"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="mainbox">
		<div class = "table">
		<h2>사업자 정보</h2>
			<table>
				<tr>
					<td>사업자 이름: </td>
					<td>${hostInfo.h_name }</td>
					<hr>
				</tr>
				<tr>
					<td>사업자 등록번호 : </td>
					<td>${hostInfo.h_bizno }</td>
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
					<td>기타 특이 사항 : </td>
					<td></td>
				</tr>
				<tr>
					<td><button class="btn_a" onclick="admin_approve()">승인</button></td>
					<td><button class="btn_b" onclick="admin_delete()">승인해제</button></td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>