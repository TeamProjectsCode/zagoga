
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bookingList.css">
</head>
<body>
	<%@ include file="./header.jsp"%>
	<div class="total">

		<center>
			<div class="main">
				<ul class="product_list">
					<li>
						<dl>
							<dt>
								<a href="banana.jsp">제주하늘펜션</a>
							</dt>
							<dd class="img">
								<a href="#"><img src="resources/img/room1.jpg" alt=""></a>
							</dd>
							<dd class="price">13,000</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<a href="icecream.jsp">강릉stay</a>
							</dt>
							<dd class="img">
								<a href="icecream.jsp"><img src="resources/img/room2.jpg"
									alt=""></a>
							</dd>
							<dd class="price">30,000</dd>

						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<a href="bigmac.jsp">광안리오션뷰숙소</a>
							</dt>
							<dd class="img">
								<a href="bigmac.jsp"><img src="resources/img/room3.jpg"
									alt=""></a>
							</dd>
							<dd class="price">23,000</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<a href="subway.jsp">경주힐링스테이</a>
							</dt>
							<dd class="img">
								<a href="subway.jsp"><img src="resources/img/rom4.jpg"
									alt=""></a>
							</dd>
							<dd class="price">34,000</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<a href="coffee.jsp">하동녹차밭숙소</a>
							</dt>
							<dd class="img">
								<a href="coffee.jsp"><img src="resources/img/room5.jpg"
									alt=""></a>
							</dd>
							<dd class="price">29,100</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<a href="chicken.jsp">전주한옥숙소</a>
							</dt>
							<dd class="img">
								<a href="chicken.jsp"><img src="resources/img/room1.jpg"
									alt=""></a>
							</dd>
							<dd class="price">15,900</dd>
						</dl>
					</li>
				</ul>
			</div>
		</center>
		</div>
		<%@ include file="./footer.jsp"%>
</body>
</html>