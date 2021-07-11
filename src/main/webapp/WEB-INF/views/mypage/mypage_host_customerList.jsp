<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/customer_list.css" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>승인/거부</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
  	<div id = "mainbox">
		<h2>고객 리스트</h2>
		<p>수락을 기다리는 고객이 있습니다.</p>

		게스트 하우스 방 이름? 여기?

  <section>
        <table style="width: 100%">
                <tr>
					<th>방이름</th>
                    <th>고객명</th>
                    <th>연락처</th>
                    <th>인원</th>
                    <th>체크인</th>
                    <th>체크아웃</th>
                    <th>가격</th>
					<th>상태</th>
                    <th></th>
                </tr>
<%-- 리스트 출력--%>
			<c:forEach var="book" items="${bookList}">
				<tr>
					<td>
						${book.r_name}
					</td>
					<td>
						${book.u_name}
					</td>
					<td>
						${book.u_phone}
					</td>
					<td>
						${book.b_pno}
					</td>
					<td style="font-size: smaller">
						${fn:substring(book.b_in, 0, 10)}
					</td>
					<td style="font-size: smaller">
						${fn:substring(book.b_out, 0, 10)}
					</td>
					<td>
						${book.b_price}
					</td>
					<td id="b_state_${book.b_no}">
						<c:choose>
							<c:when test="${book.b_state eq 0}">
								대기중
							</c:when>
							<c:when test="${book.b_state eq 1}">
								승인
							</c:when>
							<c:when test="${book.b_state eq 2}">
								거부
							</c:when>
						</c:choose>
					</td>
					<td>
						<button onclick="booking_accept(${book.b_no});" style="cursor: pointer" >😍 승인</button>
						<button onclick="booking_cancel(${book.b_no});" style="cursor: pointer">😥 거부</button>
					</td>
				</tr>
			</c:forEach>
        </table>
    </section>
  	</div>
    	<%@ include file="../footer.jsp" %>
<script>
	function booking_accept(b_no){
		let ok = confirm("승인하시겠습니까?");
		if(ok === true){
			$.ajax({
				type:"POST",
				url:"/host/updateBookingState",
				data:{b_no: b_no, b_state: 1},
				success: function (isSuccess) {
					// console.log(isSuccess);
					$('#b_state_'+b_no).text('승인');
				},
				error: function (e){
					alert("업데이트 하지 못했습니다. 잠시 후 다시 시도해주세요.");
					console.log("updateBookingState error: "+e);
				}
			});
		}
	}
</script>
<script>
	function booking_cancel(b_no){
		let ok = confirm("거부하시겠습니까?\n 고객님과 충분한 상의 후 선택해 주십시오");
		if(ok === true){
			$.ajax({
				type:"POST",
				url:"/host/updateBookingState",
				data:{b_no: b_no, b_state: 2},
				success: function (isSuccess) {
					// console.log(isSuccess);
					$('#b_state_'+b_no).text('거부');
				},
				error: function (e){
					alert("업데이트 하지 못했습니다. 잠시 후 다시 시도해주세요.");
					console.log("updateBookingState error: "+e);
				}
			});
		}
	}
</script>
</body>
</html>