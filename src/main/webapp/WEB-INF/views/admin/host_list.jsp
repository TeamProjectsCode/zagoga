<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 리스트(admin 용)</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/administration_list.css" />
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="container">
		<div id="input-form">
		<hr>
			<h2>사업 등록 현황</h2>
			<hr>
			<p>사업자 번호 또는 승인 상태를 통해 선택할 수 있습니다.</p>
		사업자번호 :<input type="text" id="keyword">
		<select id = "keyword2" onchange="typeSelect()">
		<option value="">선택</option>
		<option value="대기중">대기중</option>
		<option value="승인">승인</option>
		<option value="거절">거절</option>
		</select>
		</div>
		<table id="user-table">
			<thead>
				<tr>
					<th>사업자 번호</th>
					<th>이름</th>
					<th>사업장 이메일</th>
					<th>신청일</th>
					<th>승인 여부</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hList}" var="hlist" varStatus="status">
				<tr>
					<td>${hlist.h_bizno}</td>
					<td>${hlist.h_name}</td>
					<td>${hlist.h_mail}</td>
					<td style="font-size: smaller">${fn:substring(hlist.h_join, 0, 10)}</td>
					<c:choose>
						<c:when test="${hlist.h_active eq 1}">
							<td>승인</td>
						</c:when>
						<c:when test="${hlist.h_active eq 0}">
							<td>대기중</td>
						</c:when>
						<c:when test="${hlist.h_active eq 2}">
							<td>거절</td>
						</c:when>
						<%--<c:when test="${hlist.h_active eq -1}">
							<td>일시정지</td>
						</c:when>--%>
					</c:choose>
					<td><button onclick="location.href='/admin/host_detail?h_bizno=${hlist.h_bizno}'">상세 내용 확인</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<script>
			$("#keyword").keyup(function first() {
								var k = $(this).val();
								$("#user-table > tbody > tr").hide();
								var temp = $("#user-table > tbody > tr > td:nth-child(1):contains('"+ k + "')");
								$(temp).parent().show();
							})
		//동시에 안됨;
			function typeSelect(){
				var keyword = $('#keyword2 option:selected').val();
					$("#user-table > tbody > tr").hide();
					var temp = $("#user-table > tbody > tr > td:nth-child(5):contains('"+ keyword + "')");
						$(temp).parent().show();
				console.log(keyword);
			}
		</script>
	</div>
		<%@ include file="../footer.jsp" %>
</body>
</html>