 <%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String GH_name ="111111", GH_image ="",GH_addr1 ="위치테스트", GH_addr2 ="";
	String R_name="",R_detail="", R_image="";
	int R_pmin=0, R_pmax=0, R_fee=0;
	Timestamp B_in =null,B_out=null;
%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/header.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script type="text/javascript">
    $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "MM/dd일 DD",
                 maxDate: 100,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "MM/dd일 DD",
                 maxDate: 100,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
            });    
    });
    $( ".star_rating a" ).click(function() {
        $(this).parent().children("a").removeClass("on");
        $(this).addClass("on").prevAll("a").addClass("on");
        return false;

        });


</script>
</head>
<body>
	<%@ include file="./header.jsp"%>
    <section>
        <div class="p-3 mb-2 bg-light text-dark">
            <div class="mx-auto" style="width: 650px;">
                <img src="<%=GH_image %>" width="650px" height="500px" alt="대표사진">
                <p>대표사진</p>
                <p><h3><%=GH_name %></h3></p>
                    <p class="star_rating">

                        <a href="#" class="on">★</a>
                    
                        <a href="#" class="on">★</a>
                    
                        <a href="#" class="on">★</a>
                    
                        <a href="#">★</a>
                    
                        <a href="#">★</a>
                    </p>
                    <p>위치 <%=GH_addr1 %></p>
                    <div class="room_date">
                        <form>
                            <center>
                                <span >체크인</span><input type="text" id="startDate" name="B_in">
                                <span>체크아웃</span><input type="text" id="endDate" name="B_out" >
                            </center>
                        </form>
                       </div>
                       <br>
                       <div style="width: 650px;">
                        <table style="width: 650px;">
       	  	<%
           				for(int i =0 ; i<5 ; i++){
           					//리스트 추가
           	%>
                        <a href="room_detail.jsp" style="text-decoration-line: none; color: black;" >
                            <tr>
                                <td>
                                    <img src="<%=R_image %>" width="300px" style="float: left;">
                                    <p>
                                        <h6><%=R_name%></h6>
                                    </p>
                                        <br>
                                    <p>
                              		       기준 <%=R_pmin%>명 / 최대 <%=R_pmax%>명
                                    </p>
                                     <p>침대 <%=R_pmax%></p>
                                     <br>
                                     <br>
                                     <br>
                                     <p style="text-align: right;">1박 <%=R_fee%>원  </p>
                                     <p>기타사항 <%=R_detail %></p>
                                </td>
                            </tr>
                            </a>
              <%
          			}
              %>
                        </table>
                       </div>
                </div>
            </div>
        </div>
    </section>
   	<%@ include file="./footer.jsp" %>
</body>
</html>