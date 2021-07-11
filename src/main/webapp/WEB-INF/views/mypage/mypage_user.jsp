<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/user_mypage.css" />
<title>마이페이지(user용)</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	        <section>
            <div class="main">
              <div class="info">
                    <table>
                    <h5>개인정보</h5>
                    <hr>
                    <p>반갑습니다. ${user.u_nick}님</p>
                    <br>
                    <p>성명 : ${user.u_name}</p>
                    <p>성별 : ${user.u_gender}</p>
                    <p>전화번호 : ${user.u_phone}</p>
                    <p>email : ${user.u_mail}</p>
                    <p style="float:right">
                      <input type="button" value="수정 및 탈퇴" onclick="location.href='/user/mypage_user_info'"> &nbsp;&nbsp;&nbsp;
                    </p>
                    <br>
                  </table>
                  </div>
                  <div class="booking">
                    <table>
                    <h5>예약정보</h5>
                    <hr>
                    <p>${info.gh_name}</p>
                    <br>
                    <p>예약자 : ${user.u_name}</p>
                    <p>사업자 : ${info.h_brand}</p>
                    <P>체크 인 : ${info.b_in}</P>
                    <P>체크 아웃 : ${info.b_out}</P>
                    <p>위치 : ${info.gh_addr1}, ${info.gh_addr2}</p>
                    <p>사업자연락처 : ${info.h_phone}</p>
                        <br>
                    <P style="text-align: right;"><small>예약취소시, 사업자에게 연락해주세요</small></P>
                    <p style="float: right;">
                      <input type="button" value="예약목록" onclick="location.href='/user/mypage_user_booking_list/'+${info.b_uno}">
                    </p>
                  </table>
                  </div>
            </div>
        </section>
	<%@ include file="../footer.jsp"%>
</body>
</html>