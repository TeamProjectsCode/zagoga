<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 박지은
  Date: 2021-07-04
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/resources/css/mypage_user_booking_detail.css">
    <title>Title</title>
</head>
<body>
<div class="page_confirm_inner">
    <div class="confirm_item_top">
        <c:choose>
            <c:when test="${mbs.b_state >= 0}">
                <h3 class="confirm_title">예약 완료</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 1}">
                <h3 class="confirm_title">승인 대기중</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 2}">
                <h3 class="confirm_title">승인 거부</h3>
            </c:when>
            <c:when test="${mbs.b_state >= 3}">
                <h3 class="confirm_title">취소 완료</h3>
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
                        <img src="${pageContext.request.contextPath}/resources/img/phone-call.png" class="img_ico"><a href="tel:010-1111-1111">${mbs.h_phone}</a>
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
                        <a href="#" class="link_map">
                            <img class="img_map" src="${pageContext.request.contextPath}/resources/img/helloJeju.png">
                        </a>
                    </div>
                </div>
            </div>
                <button class="btn_a" onclick="history.go(-1)">확인</button>
        </div>
    </div>
</div>
</body>
</html>
