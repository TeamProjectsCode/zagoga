<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.javalec.project_zagoga.dto.GhouseRoom" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게스트하우스 수정(host용)</title>
<link href="/resources/css/mypage_house_info.css" media="all"
	rel="Stylesheet" type="text/css" />
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form method="post" action="/ghouse/update">
		<div id="mainbox">
			<table>
				<h2>사업 등록 현황</h2>
				<tr>
					<td>상호명</td>
					<td>${grList.get(0).gh_name}</td>
				</tr>
				<tr>
					<td>사업위치</td>
					<td><input type="text" name="gh_addr1" value="${grList.get(0).gh_addr1},${grList.get(0).gh_addr2}" size="50%" readonly></td>
				</tr>
				<tr>
					<td style="padding-top: 10px;">등록된 방 개수</td>
					<td>${grList.get(0).gh_detail}</td>
<%--					<td><input type="text" value="${grList.size()}" readonly></td>--%>
				</tr>
				<tr>
					<td></td>
					<td><button onclick="location.href='/room//room_write/${grList.get(0).gh_no}'">방 등록하기(값을 어떻게 넘겨야할지 모르겠음)</button></td>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<td style="padding-bottom: 170px;">기타사항 및 소개글</td>
					<td colspan="2"><textarea cols="50" rows="10" name="${grList.get(0).gh_detail}>"></textarea></td>
				</tr>
			</table>
			<table id = "room_fix">
				<h2>등록된 방 현황</h2>
				<tr>
					<th>방 번호</th>
					<th>수용 인원</th>
					<th>상세보기</th>
				</tr>
				<c:forEach items="${grList}" var="gr" varStatus="status">
				<tr>
					<td><input name="r_no" value="${gr.r_no}" readonly></td>
				</tr>
				<tr>
					<td><input type="number" name="r_pmax" placeholder="${gr.r_pmax} 인실"></td>
				</tr>
				<tr>
					<td><button onclick="/room/getDetail/${gr.r_no}">상세 보기</button></td>
				</tr>
				</c:forEach>
				<input type="hidden" name="gh_hno" value="${grList.get(0).gh_hno}">
<%--				hno 연결					--%>
			</table>
				<div id="button">
					<button type="submit">수정완료</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="history.go(-1)">취소</button>
				</div>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>