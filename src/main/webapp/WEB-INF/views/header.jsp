<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String path= request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/header.css" />
</head>
<body>
<header>
	<h2>Zagoga</h2>
	<div class = "imgbox">
	</div>
      <div class="navbox">
        <div class="dropdown">
          <button class="dropbtn">Dropdown</button>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">Dropdown</button>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <div class="dropdown">
          <button class="dropbtn">Dropdown</button>
          <div class="dropdown-content">
            <a href="#">Link 1</a>
            <a href="#">Link 2</a>
            <a href="#">Link 3</a>
          </div>
        </div>
        <!-- 세션에 따라 버튼 변경 추가 필요 -->
        <div class="dropdown">
          <button class="dropbtn" onclick="location.href='../login'">login</button>
        </div>
      </div>
</header>
    <!-- 공간 비우기용-->
    <div class = "space"></div>
</body>
</html>