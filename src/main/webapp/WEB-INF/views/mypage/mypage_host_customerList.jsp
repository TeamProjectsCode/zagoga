<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/resources/css/customer_list.css" />
    <title>승인/거부</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
  	<div id = "mainbox">
		<h2>고객 리스트</h2>
		<p>수락을 기다리는 고객이 있습니다.</p>

  <section>
        <table>
                <tr>
					<th>게스트하우스이름</th>
					<th>방이름</th>
                    <th>고객명</th>
                    <th>연락처</th>
                    <th>인원</th>
                    <th>성별</th>
                    <th>체크인</th>
                    <th>체크아웃</th>
                    <th>가격</th>
                    <th>승인 및 거절</th>
                </tr>
<%-- 리스트 출력--%>
				<tr>
					<td>
						ㅁㅁㅁ
					</td>
					<td>
						ㅁㅁㅁ
					</td>
					<td>
					ㅁㅁㅁㅁ
					</td>
					<td>
						01012345678
					</td>
					<td>
						n명
					</td>
					<td>
						성별
					</td>
					<td>
						21/7/9
					</td>
					<td>
						21/7/12
					</td>
					<td>
						130,000원
					</td>
					<td>
						<button onclick="booking_accept()">승인</button> &nbsp; / &nbsp;
						<button onclick="booking_cancel()">거부</button>
					</td>
				</tr>
        </table>
    </section>
  	</div>
    	<%@ include file="../footer.jsp" %>
<script>
	function booking_accept(){
		var ok = confirm("승인하시겠습니까?");

		if(ok == true){
			alert("승인되었습니다.");
		}
	}
</script>
<script>
	function booking_cancel(){
		var ok = confirm("거부하시겠습니까?\n 고객님과 충분한 상의 후 선택해 주십시오");

		if(ok == true){
			alert("거부하였습니다.");
		}
	}
</script>
</body>
</html>