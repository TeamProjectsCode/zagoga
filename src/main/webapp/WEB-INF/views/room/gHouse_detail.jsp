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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<link rel="stylesheet"
		  href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
		  type="text/css" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/resources/css/ghouse_detail.css" />
	<script type="text/javascript" src="/resources/js/guesthouse.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j&submodules=geocoder"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
<section>
	<div>
		<div class="main">
			<c:choose>
			<c:when test="${fn:length(griList) ne 0}">
			<p>
<%--		<c:if test="${fn:length(griList)>0}">--%>
			<h3>게스트하우스 업체명 : ${griList.get(0).gh_name}</h3><br>
				<a id="kakao-link-btn" href="javascript:sendLink()">
					<img
							src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
					style="width: 35px"/>
				</a>

				<%--<kakao script 자리>--%>

			<p><img src="/resources/img/placeholder.png"><strong>위치</strong></p>
					${griList.get(0).gh_addr1} ${griList.get(0).gh_addr2}
				<br>
			<strong><p>상세내용</p></strong>
				${griList.get(0).gh_detail}
			<p class="star_rating">
				<a href="#" class="on">★</a>
				<a href="#" class="on">★</a>
				<a href="#" class="on">★</a>
				<a href="#">★</a>
				<a href="#">★</a>
			</p>
				<c:forEach items="${griList}" var="gri" varStatus="status">
				<div class="total">
					<div class="product_view">
						<h2>${gri.r_name}</h2>
						<table>
							<colgroup>
								<col style="width:173px;">
								<col>
							</colgroup>
							<tbody>
							<tr>
								<th>인원수</th>
								<th>기준${gri.r_pmin} 명 /최대 ${gri.r_pmax}명</th>

							</tr>
							<tr>
								<th>침대</th>
								<td>${gri.r_pmax}</td>
							</tr>
							<tr>
								<th>1박</th>
								<td class="total"><b><span>\</span>${gri.r_fee}</b></td>
							</tr>
							<tr>
								<th>기타사항</th>
								<td>${gri.r_detail}</td>
							</tr>
							</tbody>
						</table>
						<div class="img">
							<img src="${pageContext.request.contextPath}/resources/rooms_image/${gri.i_name}" alt="">
							<ul>
								<!-- <li class="on"><a href="#a"><img src="images/s-cof.jpg" alt=""></a></li> -->
							</ul>
						</div>
						<div class="btns">
							<a href="/room/getDetail/${gri.r_no}" class="btn2">예약하기</a>

						</div>
					</div>
					<div class="clear"></div>
				</div>
					</c:forEach>

					<%--			</c:if>--%>
				<div class="section_map">
					<p2>오시는길</p2>
					<div id="map" class="link_map" style="width:100%;height:500px;"></div>
				</div>
				<script>
					var map = new naver.maps.Map("map", {
						center: new naver.maps.LatLng(37.3595316, 127.1052133),
						zoom: 15,
						mapTypeControl: true
					});

					var infoWindow = new naver.maps.InfoWindow({
						anchorSkew: true
					});

					function searchAddressToCoordinate(address) {
						naver.maps.Service.geocode({
							query: address
						}, function(status, response) {
							if (status === naver.maps.Service.Status.ERROR) {
								return alert('Something Wrong!');
							}

							if (response.v2.meta.totalCount === 0) {
								return alert('totalCount' + response.v2.meta.totalCount);
							}

							var htmlAddresses = [],
									item = response.v2.addresses[0],
									point = new naver.maps.Point(item.x, item.y);

							if (item.roadAddress) {
								htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
							}

							if (item.jibunAddress) {
								htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
							}

							if (item.englishAddress) {
								htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
							}

							infoWindow.setContent([//말풍선 크기 및 내용
								'<div style="padding:10px;min-width:200px;line-height:100%;">',
								'<h4 style="margin-top:5px;">위치 : '+ address +'</h4><br />',
								htmlAddresses.join('<br />'),
								'</div>'
							].join('\n'));

							map.setCenter(point);
							infoWindow.open(map, point);
						});
					}

					function initGeocoder() {
						if (!map.isStyleMapReady) {
							return;
						}
						//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@주소 입력할 부분@@@@@@@@@@@@@@@@@@@@@
						searchAddressToCoordinate('${griList.get(0).gh_addr1}');
					}
					naver.maps.onJSContentLoaded = initGeocoder;
					naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
				</script>
					<table class="review">
						<tr>
							<th>평점</th>
							<!-- 평점 -->
							<th>별명</th>
							<th>내용</th>
						</tr>
						<c:forEach items="${reviewList}" var="review">
								<tr>
									<td id="start_${review.rv_no}">
									</td>
									<td>${review.u_nick}</td>
									<td>${review.rv_content}</td>
									<script>
										var startStr = "";
										for(i=0; i<${review.rv_star}; i++){
											startStr += "⭐";
										}
										$('#start_${review.rv_no}').text(startStr);
								</script>
								</tr>
						</c:forEach>
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
					<p>준비중입니다 😥.</p>
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