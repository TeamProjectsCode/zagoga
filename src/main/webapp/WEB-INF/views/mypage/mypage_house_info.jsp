<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form method="post" action="/host/GhouseUpdate/${user.h_no}" onsubmit="return GHNO_Check()">
		<input type="hidden" value="${ghInfo.gh_no}" name="gh_no" id="gh_no">
		<input type="hidden" value="${user.h_no}" name="gh_hno">
		<div id="mainbox">
			<table>
				<h2>사업 등록 현황</h2>
				<tr>
					<td>상호명</td>
					<td>${ghInfo.gh_name}</td>
				</tr>
				<tr>
					<td>사업위치</td>
					<td>${ghInfo.gh_addr1},${ghInfo.gh_addr2}</td>
				</tr>
				<tr>
					<td style="padding-top: 10px;">등록된 방 개수</td>
					<td>${roomList.size()} 개</td>
<%--					<td><input type="text" value="${grList.size()}" readonly></td>--%>
				</tr>
				<tr>
					<td  colspan="2"><input type="button" id="roomInsertBtn" onclick="location.href='/room/write/${ghInfo.gh_no}'" value="방 등록하기">&nbsp;&nbsp;<span id="roomInsertWaring"></span></td>
					<script>
						if($('#gh_no').val() === ""){
							$('#roomInsertBtn').attr('disabled', true)
							$('#roomInsertWaring').text('게스트 하우스를 먼저 등록해주세요.').css("color", "red");
						}

						function GHNO_Check(){
							if($('#gh_no').val() === ""){
								alert("게스트 하우스를 먼저 등록해주세요.");
								return false;
							}
							return true;
						}
					</script>
				</tr>
				<tr><td></td><td></td></tr>
				<tr>
					<td style="padding-bottom: 170px;">기타사항 및 소개글</td>
					<td colspan="2"><textarea cols="50" rows="10" name="gh_detail">${ghInfo.gh_detail}</textarea></td>
				</tr>
			</table>
			<table id = "room_fix">
				<h2>등록된 방 현황</h2>
				<tr>
					<th>방 번호</th>
					<th>방 이름</th>
					<th>수용 인원</th>
					<th>상세보기</th>
				</tr>
				<c:forEach items="${roomList}" var="gr" varStatus="status">
				<tr>
					<th>${gr.r_no}</th>
					<th>${gr.r_name}</th>
					<th>${gr.r_pmax} 인실</th>
					<th><input type="button" onclick="location.href='/host/mypageRoomInfo/${gr.r_no}'" value="상세 보기"></th>
				</tr>
				</c:forEach>
			</table>
				<div id="button">
					<button type="submit">수정완료</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="location.href='/host/mypage_host/${user.h_no}'">취소</button>
<%--					<button type="button" onclick="location.href='/host/HostGhouseDelete/${user.h_no},${grList.get(0).gh_no}'">게스트하우스 삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;--%>
				</div>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>