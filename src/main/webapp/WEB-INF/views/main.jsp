<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script src="data.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main2.css">
 <script type = "text/javascript">
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
                 dateFormat: "yymmdd",
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
                 dateFormat: "yymmdd",
                 maxDate: 100,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
                 }    
 
            });    
    });
</script>

</head>
<body>
    <div class="container">
        <div class="header">
            <h1><a href="#">ZAGOGA</a></h1>
            <div class="nav">
                <ul>
                    <li><a href="login">LOGIN</a></li>
                    <li><a href="javascript:checkPopup()">JOIN</a></li>
                </ul>
            </div>
        </div>
        <div class="hero">
            <h2>어디로 여행가시나요?</h2>
            <p>어디에서나, 여행은 살아보는거야!</p>
            <div class="searchArea">
             <form method="post" action="#">
                <span>위치</span><input type="text" placeholder="주소" name="" id="searchInput">
                 <script>
                     $(function() {	//화면 다 뜨면 시작
                         var searchSource = ['철원', '화천', '양구', '고성(강원)', '양주', '동두천', '연천', '포천', '의정부', '인제',
                             '춘천', '속초', '고양 덕양', '고양 일산동', '서울 도봉', '서울 노원', '남양주', '홍천', '횡성',
                             '양양', '파주', '고양 일산서', '김포', '서울 강북', '서울 성북', '가평', '구리', '하남',
                             '정선', '강릉', '부천 소사', '안양 만안', '광명', '서울 서대문', '서울 종로', '서울 동대문',
                             '서울 중랑', '양평', '태백', '동해', '인천 강화', '부천 원미', '안양 동안', '서울 은평',
                             '서울 마포', '서울 중구', '서울 성동', '서울 강동', '여주', '원주', '삼척', '인천 서구',
                             '부천 오정', '시흥', '서울 강서', '서울 동작', '서울 용산', '서울 광진', '서울 송파', '이천',
                             '평창', '울진', '인천 동구', '인천 계양', '안산 상록', '서울 양천', '서울 관악', '서울 서초',
                             '성남 중원', '과천', '광주', '영월', '영덕', '인천 부평', '안산 단원', '서울 영등포',
                             '서울 금천', '서울 강남', '성남 분당', '성남 수정', '용인 수지', '문경', '봉화', '울릉',
                             '인천 중구', '인천 남구', '화성', '서울 구로', '군포', '의왕', '수원 영통', '용인 기흥',
                             '용인 처인', '안동', '영양', '인천 옹진', '인천 연수', '인천 남동', '오산', '안성', '수원 권선',
                             '수원 장안', '제천', '예천', '영주', '구미', '청송', '포항 북구', '태안', '아산', '천안 동남',
                             '천안 서북', '평택', '음성', '수원 팔달', '단양', '상주', '김천', '군위', '의성', '포항 남구',
                             '당진', '홍성', '예산', '공주', '진천', '충주', '청주 흥덕', '괴산', '칠곡', '영천', '경산',
                             '경주', '서산', '보령', '청양', '세종', '대전 대덕', '증평', '청주 청원', '보은', '고령',
                             '청도', '성주', '울산 북구', '부여', '논산', '계룡', '대전 동구', '청주 상당', '청주 서원',
                             '대구 북구', '대구 중구', '대구 수성', '울산 울주', '울산 동구', '서천', '금산', '대전 유성',
                             '대전 중구', '옥천', '영동', '대구 서구', '대구 남구', '대구 동구', '울산 중구', '울산 남구',
                             '군산', '익산', '대전 서구', '무주', '거창', '합천', '대구 달서', '대구 달성', '부산 금정',
                             '부산 동래', '부산 기장', '부안', '김제', '완주', '장수', '함양', '창녕', '밀양', '부산 북구',
                             '부산 부산진', '부산 연제', '부산 해운대', '고창', '정읍', '전주 덕진', '진안', '남원', '진주',
                             '의령', '부산 강서', '부산 사상', '부산 동구', '부산 중구', '영광', '장성', '전주 완산', '임실',
                             '산청', '함안', '양산', '창원 합포', '부산 서구', '부산 사하', '부산 남구', '함평', '담양',
                             '순창', '구례', '하동', '창원 의창', '창원 성산', '창원 진해', '김해', '부산 영도', '부산 수영',
                             '신안', '무안', '광주 광산', '곡성', '화순', '광양', '사천', '창원 회원', '통영', '목포',
                             '나주', '광주 서구', '광주 북구', '순천', '고흥', '남해', '고성(경남)', '거제', '해남',
                             '영암', '광주 남구', '광주 동구', '여수', '진도', '강진', '장흥', '보성', '완도', '제주',
                             '서귀포'];// 배열 형태로

                         $("#searchInput").autocomplete({  //오토 컴플릿트 시작


                             source : searchSource,	// source 는 자동 완성 대상
                             select : function(event, ui) {	//아이템 선택시
                                 console.log(ui.item);
                             },
                             focus : function(event, ui) {	//포커스 가면
                                 return false;//한글 에러 잡기용도로 사용됨
                             },
                             minLength: 1,// 최소 글자수
                             autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
                             classes: {	//잘 모르겠음
                                 "ui-autocomplete": "highlight"
                             },
                             delay: 300,	//검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
              // 			disabled: true, //자동완성 기능 끄기
                             position: { my : "right top", at: "right bottom" },	//잘 모르겠음
                             close : function(event){	//자동완성창 닫아질때 호출
                                 console.log(event);
                             }
                         });
                         var searchValue =document.getElementById(searchInput);
                         searchValue.val= searchSource;

                     });
                 </script>

                 <span>체크인</span><input type="text" id="startDate" name="">
                <span>체크아웃</span><input type="text" id="endDate" name="" >
                <span>인원</span><input class="person" type="number" placeholder="인원수" name="">
            </form>
                <button>검색</button>
            </div>
        </div>
    </div>
    <div class="total">
    <center>
       <div class="main">
           <div class="reco">
                <h2>여기는 어때요?</h2>
           </div>
           <ul class="product_list">
               <li>
                   <dl>
                       <dt>
                           <a href="#">무더위엔 바다아이가!</a>
                       </dt>
                       <dd class="img">
                           <a href="#"><img src="${pageContext.request.contextPath}/resources/img/busan.jpg" alt=""></a>
                       </dd>
                       <dd class="price">여름에 가기 좋은 부산 숙소</dd>
                       <dd class="btm">
                       </dd>
                   </dl>
               </li>
               <li>
                   <dl>
                       <dt>
                           <a href="#">떠나요 둘이서 제주섬으로~</a>
                       </dt>
                       <dd class="img">
                           <a href="#"><img src="${pageContext.request.contextPath}/resources/img/jeju.jpg" alt=""></a>
                       </dd>
                       <dd class="price">힐링여행 푸른밤 제주 숙소</dd>
                       </dd>
                   </dl>
               </li>
               <li>
                   <dl>
                       <dt>
                           <a href="#">동해바다가 아름다운 강릉으로~</a>
                       </dt>
                       <dd class="img">
                           <a href="#"><img src="${pageContext.request.contextPath}/resources/img/kang.jpg" alt=""></a>
                       </dd>
                       <dd class="price">산과 바다를 아우르는 강릉숙소</dd>
                       </dd>
                   </dl>
               </li>
    </center>
    </div>
    <div class="main_text2">
        <ul>
          <li>
            <div><h1>호스트가 되어보세요</h1></div>
            <div>숙소를 공유하여 수입을 올리고 새로운 가능성을 만나세요.</div>
            <a class="host_register" href="#"><div class="more2">숙소등록하기</div></a>
          </li>
          <li></li>
        </ul>
    </div>
</body>
</html>