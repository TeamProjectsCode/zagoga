<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage_host.css" />
	<script type="text/javascript" src="/resources/js/user.js" charset="utf-8"></script>
<title>마이페이지(host용)</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	        <section>
            <div class="main">
              <div class="info">
                    <h4>개인정보</h4>
                    <hr>
                    <p>반갑습니다. ${user.h_name}님</p>
                    <br>
                    <p>사업자명 : ${user.h_brand}</p>
                    <p>전화번호 : ${user.h_phone}</p>
                    <p>email : ${user.h_mail}</p>
                    <p>사업자 번호 : ${user.h_bizno}</p>
                    <p>계좌번호 : ${user.h_bank}</p>
                    <p style="float:right">
                      <input type="button" value="정보수정" onclick="location.href='/host/mypage_host_info'"> &nbsp;&nbsp;&nbsp;
                      <input type="button" value="회원탈퇴" onclick="">
                    </p>
                  </div>
                  <div class="booking">

                    <h4>사업장 정보</h4>
                    <hr>
                    <p>${gh.gh_name}</p>
                    <br>
                    <p>규모 : ㅁㅇㅁ</p>
                    <p>위치 : ${gh.gh_addr1}</p>
                    <p>등록 연락처: ${user.h_phone}</p>
                    <br>
                    <p style="float: right;">
                      <input type="button" value="수정하기" onclick="location.href='/host/mypage_house_info/${user.h_no}'">
                    </p>
                  </div>
            </div>
        </section>
	<%@ include file="../footer.jsp"%>
</body>
</html>