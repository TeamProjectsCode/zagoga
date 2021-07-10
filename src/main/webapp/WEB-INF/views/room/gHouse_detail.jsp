<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.Timestamp"%>
<%@ page import="com.javalec.project_zagoga.dto.Ghouse" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게스트하우스 정보 + 방 정보(user용)</title>
	<link rel="stylesheet"
		  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
		  type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/ghouse_detail.css" />
	<script type="text/javascript" src="/resources/js/guesthouse.js" charset="utf-8"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<section>
	<div>
		<div class="main">
			<c:choose>
			<c:when test="${fn:length(griList) ne 0}">
			<img src="${pageContext.request.contextPath}/resources/gh_image/${griList.get(0).gh_image}" style="width: 650px; height: 550px;" alt="대표사진">
			<%--				<img src="/resources/img/busan.jpg" width="650px" height="500px" alt="대표사진">--%>
			<p>대표사진</p>
			<p>
<%--		<c:if test="${fn:length(griList)>0}">--%>
			<h3>게스트하우스 업체명 : ${griList.get(0).gh_name}</h3>
			<p>
				위치
					${griList.get(0).gh_addr1} ${griList.get(0).gh_addr2}</p>
			</p>
			<p class="star_rating">
				<a href="#" class="on">★</a>
				<a href="#" class="on">★</a>
				<a href="#" class="on">★</a>
				<a href="#">★</a>
				<a href="#">★</a>
			</p>
				<div style="width: 650px;">
					<table style="width: 650px;">
						<c:forEach items="${griList}" var="gri" varStatus="status">
							<br><br><tr>
								<td><a href="/room/getDetail/${gri.r_no}"
									   style="text-decoration-line: none; color: black;">
										<%--								 <img src="/resources/img/jeju.jpg" width="300px" style="float: left;">--%>
									<img src="${pageContext.request.contextPath}/resources/rooms_image/${gri.i_name}" width="300px" style="float: left;">
									<p>
									<h2>방 : ${gri.r_name}</h2>
									</p><br>
									<p>
										기준
											${gri.r_pmin}명 / 최대
											${gri.r_pmax}명
									</p>
									<p>
										침대
											${gri.r_pmax}</p> <br> <br> <br>
									<p style="text-align: right;">
										1박 :
											${gri.r_fee}원
									</p>
									<p>
										기타사항 <br><br>
											${gri.r_detail}</p>
								</a></td>
							</tr>
							<br><br>
						</c:forEach>
					</table>

					<%--			</c:if>--%>
					<table class="review">
						<tr>
							<th>평점</th>
							<!-- 평점 -->
							<th>별명</th>
							<th>내용</th>
						</tr>
						<tr>
							<td>★</td>
							<td>익명</td>
							<td>내용123</td>
						</tr>
					</table>
				</div>

<%--				<div class="room_date">--%>
<%--				<form>--%>
<%--					<center>--%>
<%--						<span>체크인</span><input type="text" id="startDate" name="B_in">--%>
<%--						<span>체크아웃</span><input type="text" id="endDate" name="B_out">--%>
<%--					</center>--%>
<%--				</form>--%>
<%--			</div>--%>
				<br>
				</div>
			</div>
			</c:when>
			<c:otherwise>
				<center>
					<p>준비중입니다 🥲.</p>
					<p>빠른시일내에 찾아뵙겠습니다.</p>
				</center>
			</c:otherwise>
			</c:choose>
		</div>
		</div>
	</section>
	<%@ include file="../footer.jsp"%>
</body>
</html>

<!--
https://cloudstudying.kr/lectures/236
스프링으로 만든 별평점
참고하기
-->