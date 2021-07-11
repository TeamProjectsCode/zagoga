<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 정보 수정(host용)</title>
<link href="/resources/css/mypage_room_info.css" media="all"
	rel="Stylesheet" type="text/css" />
	<script src="/resources/js/mypage_room_info.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<form name="form" action="/room/update" method="post">
		<div id="mainbox">
			<table>
				<h2>방 등록 현황</h2>

				<tr>
					<td>방 번호</td>
					<td style="padding-left: 30px"><input type="text" value="${room.get(0).r_no}" name="r_no" readonly></td>
				</tr>
				<tr>
					<td>방 이름</td>
					<td style="padding-left: 30px"><input type="text" value="${room.get(0).r_name}" name="r_name"></td>
				</tr>
				<tr>
					<td>숙박비</td>
					<td style="padding-left: 30px"><input type="text" value="${room.get(0).r_fee}" name="r_fee"></td>
				</tr>
				<tr>
					<td>최저 인원수</td>
					<td style="padding-left: 30px"><input type="text" value="${room.get(0).r_pmin}" name="r_pmin"></td>
				</tr>
				<tr>
					<td>최대 인원수</td>
					<td style="padding-left: 30px"><input type="text" value="${room.get(0).r_pmax}" name="r_pmax"></td>
				</tr>
				<tr>
					<td style="padding-bottom: 170px;">기타사항 및 소개글</td>
<%--					<td><input type="text" value="${room.get(0).r_detail}" name="r_detail" width="300px" height="600px"></td>--%>
					<td style="padding-left: 30px"><textarea name="r_detail" cols="50" rows="10">${room.get(0).r_detail}</textarea></td>
				</tr>


			</table>
			<td>등록된 이미지 파일</td><br>
				<c:forEach items="${room}" var="room" varStatus="status">
					<img src="${pageContext.request.contextPath}/resources/rooms_image/${room.i_name}" style="width:290px; height: 290px">
					<c:choose>
						<c:when test="${status.count % 6 == 0}">
							<br>
						</c:when>
					</c:choose>
				</c:forEach>

			<div id="button">
<%--				<input type="hidden" value="${room.get(0).r_no}" name="r_no" readonly>--%>
					<button type ="submit">수정완료</button>&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="location.href='/host/ImagesDelete/${room.get(0).r_no},${user.h_no}'" value="삭제하기">&nbsp;
					<button onclick="history.go(-1)">취소</button>
				</div>
		</div>
	</form>
	<%@ include file="../footer.jsp"%>
<script>
	function roomDelete(){
		var ok = confirm("등록된 방을 삭제하시겠습니까?");

		if(ok == true){
			location.href="/room/ImagesDelete/${room.get(0).r_no}";
		}
	}

</script>
</body>
</html>