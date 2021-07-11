<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="/resources/css/mypage_user_booking_detail.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q0a41zgk6j&submodules=geocoder"></script>
    <script type="text/javascript" src="/resources/js/user.js" charset="utf-8"></script>
    <title>Title</title>
</head>
<body>
<div class="main">
<div class="page_confirm_inner">
    <div class="confirm_item_top">
        <c:choose>
            <c:when test="${mbs.b_state >= 0}">
                <h3 class="confirm_title">승인대기중</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 1}">
                <h3 class="confirm_title">예약완료</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 2}">
                <h3 class="confirm_title">호스트비승인</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 3}">
                <h3 class="confirm_title">사용자취소</h3>
            </c:when>
        </c:choose>

        <div class="confirm_top_content">
            <p class="confirm_number"><span>No.${mbs.b_no}</span></p>
            <h4 class="tit"><a href="/room/getDetail/${mbs.r_no}" class="anchor">${mbs.r_name}</a></h4>
            <hr>
            <div class="detail_info">
                <ul class="info_lst">
                    <li class="info_item">
                        <div class="item_tit">일정</div>
                        <div class="item_desc"><span class="booked_date">${mbs.b_in} ~ ${mbs.b_out}</span></div>
                    </li>
                    <li class="info_item">
                        <div class="item_tit">상품</div>
                        <div class="item_desc"><span>${mbs.r_name}</span></div>
                    </li>
                    <li class="info_item">
                        <div class="item_tit">계좌번호</div>
                        <c:choose>
                            <c:when test="${mbs.h_bank != null}">
                                <div class="item_desc"><span>${mbs.h_bank}</span></div>
                            </c:when>
                            <c:otherwise>
                                <div class="item_desc"><span>등록된 계좌번호가 없습니다.</span></div>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
            <div class="detail_info">
                <ul class="info_lst">
                    <li class="info_item">
                        <div class="item_tit">
                            <span>안녕 제주도</span>
                            <span>에서 드리는 글</span>
                        </div>
                        <div class="item_desc">
                                <span class="box_info">
                                    <span>입금은1시간이내로 하지않으시면 예약이 취소됩니다</span>
                                </span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="map_info">
                <h3 class="map_info_tit">오시는길</h3>
                <div class="info_area">
                    <div class="info_row">
                        <img src="${pageContext.request.contextPath}/resources/img/tool.png"  class="img_ico">  <span class="road_name">주소</span>
                        "${mbs.gh_addr1} ${mbs.gh_addr2}"
                    </div>
                </div>
                <div class="info_area">
                    <div class="info_row">
                        <img src="${pageContext.request.contextPath}/resources/img/phone-call.png" class="img_ico"><a href="tel:${mbs.h_phone}">${mbs.h_phone}</a>
                    </div>
                </div>
                <div class="info_area">
                    <div class="info_row">
                        <img src="${pageContext.request.contextPath}/resources/img/car.png" class="img_ico"> <strong class="parking_title">주차가능</strong>
                    </div>
                    <div class="info_row">
                        <span class="row_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주차료무료</span>
                    </div>
                </div>
            </div>
            <div class="home_section">
                <div class="home_inner">
                    <!-- <h3 class="section_header">오시는길</h3> -->
                    <div class="section_map">
                        <div id="map" class="link_map" style="width:100%;height:500px;">
<%--                            <img class="img_map" src="${pageContext.request.contextPath}/resources/img/helloJeju.png">--%>
                        </div>
                    </div>
                </div>
            </div>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--            <c:set var="today" value="<%=new java.util.Date()%>"/>--%>
<%--            <c:set var="beginDt" value="${mbs.b_in}"/>--%>
<%--            <c:set var="finishDt" value="${mbs.b_out}"/>--%>

<%--            <fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>--%>
<%--            <fmt:parseDate var="checkIn" value="${beginDt}" pattern="yyyy-MM-dd"/>--%>
<%--            <fmt:parseDate var="checkOut" value="${finishDt}" pattern="yyyy-MM-dd"/>--%>

            <c:set var="today" value="<%=new java.util.Date()%>"/>
            <c:set var="beginDt" value="${mbs.b_in}"/>
            <c:set var="finishDt" value="${mbs.b_out}"/>

            <fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>

            <!-- Wed Jul 09 00:00:00 KST 2014 형태이므로 yyyy-MM-dd로 다시 변환 -->
            <fmt:formatDate var="checkIn" type="date" value="${beginDt}" pattern="yyyy-MM-dd"/>
            <fmt:formatDate var="checkOut" type="date" value="${finishDt}" pattern="yyyy-MM-dd"/>

            <c:choose>
                <c:when test="${now < checkIn}">
                    <!--현재일 < checkin -->
                    <button class="btn_aa" onclick="location.href='/user/userBookingCancel/${mbs.b_no},${mbs.b_uno}'">예약취소</button>
                    <button class="btn_a" onclick="history.go(-1)">뒤로가기</button>
                </c:when>
                <c:when test="${checkIn <= now && now <= checkOut}">
                    <!-- checkin <= 현재일 and 현재일 <= checkOut -->
                    <button class="btn_aaa" onclick="history.go(-1)">뒤로가기</button>
                </c:when>
                <c:when test="${checkOut < now}">
                    <!-- checkout < 현재일 -->
                    <button class="btn_aa" onclick="showPopup()">후기작성하기</button>
                    <button class="btn_a" onclick="history.go(-1)">뒤로가기</button>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>
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
        searchAddressToCoordinate('${mbs.gh_addr1}');
    }
    naver.maps.onJSContentLoaded = initGeocoder;
    naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
</script>

</body>
</html>
