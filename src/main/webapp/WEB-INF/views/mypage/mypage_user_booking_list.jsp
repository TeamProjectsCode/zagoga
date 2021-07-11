<%--
  Created by IntelliJ IDEA.
  User: 박지은
  Date: 2021-07-02
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="/resources/css/mypage_user_booking_list.css">
  <script type="text/javascript" src="/resources/js/user.js" charset="utf-8"></script>
    <title>Title</title>
</head>
<body>
<%@ include file="../header.jsp"%>
  <h1 class="main_title">${myBookList.get(0).u_name} 님의 예약내역리스트</h1>
<div>
    <c:forEach items="${myBookList}" var="mbl" varStatus="status">
<ul class="used_list" >
  <div>
  <li class="card_item">
    <div class="card_header">
      <!-- <div class="service">
          <img class="ico_images" src="images/bed.png" width="100">
      </div> -->
      <a href="/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}" class="service_link">
        <div class="title">${mbl.gh_name}</div>
        <div class="info_box">
          <span class="info">${mbl.b_in} ~ ${mbl.b_out}</span>
          <span class="info"> <span class="aa">||</span> ${mbl.b_out.date - mbl.b_in.date}박 ${(mbl.b_out.date - mbl.b_in.date)+1}일</span>
        </div>
      </a>
    </div>
    <div class="card_body">
      <a href="/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}" class="upper_box">
        <div class="review_area">
          <div class="review_header">
            <c:choose>
              <c:when test="${mbl.b_state >= 0}">
                <div class="text">승인대기중</div>
              </c:when>
              <c:when test="${mbl.b_state >= 1}">
                <div class="text">예약완료</div>
              </c:when>
              <c:when test="${mbl.b_state >= 2}">
                <div class="text">호스트거부</div>
              </c:when>
              <c:when test="${mbl.b_state >= 3}">
                <div class="text">사용자취소</div>
              </c:when>
            </c:choose>
            <div class="text"></div>
          </div>
        </div>
      </a>
      <div class="lower_box">
        <div class="info">
          <div class="title_">${mbl.r_name}</div>
          <a href="/user/mypage_user_booking_detail/${mbl.b_no},${mbl.u_no}"><div class="desc">상세보기</div></a>
        </div>
        <div class="price">
          "결제 ${mbl.b_pno * mbl.r_fee * (mbl.b_out.date - mbl.b_in.date)} 원"
        </div>
      </div>
    </div>
  </li>
  </div>
</ul>
    </c:forEach>
</div>
<%--<%@ include file="../footer.jsp"%>--%>
</body>
</html>
