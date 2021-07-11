<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/review.css"/>
<script src="../resources/js/jquery.js"></script>

	<script type="text/javascript" src="/resources/js/user.js" charset="utf-8"></script>
	<title>리뷰 작성 (user용)</title>
</head>
<body><!-- 팝업사이즈 조절 : <body onload="window.resizeTo(400,200)"> -->
<center>
<img src="/resources/img/review.png">
<br>
	<p>이용하신 숙소는 어떠셨나요? </p>
	<p>따뜻한 격려의 말은 힘이 됩니다</p>
	<form name="form" action="#" method="post">
        <input type="hidden" name="rv_uno" id="uno" value="${u_no}">
        <input type="hidden" name="rv_ghno" id="ghno" value="${gh_no}">
	<p class="star_rating">
 		<a href="#" value="1" name="RV_STAR">★</a>
        <a href="#" value="2" name="RV_STAR">★</a>
        <a href="#" value="3" name="RV_STAR">★</a>
        <a href="#" value="4" name="RV_STAR">★</a>
        <a href="#" value="5" name="RV_STAR">★</a>
    </p>
        <input type="hidden" id="rating" name="rv_star" value="">
    <br>
    <textarea rows="10" cols="40" placeholder="10자 이상 입력해주세요" id="content" name="rv_content"></textarea>
    <br>
    <br>
    <input class="btn" type="button" onclick="review()" value="작성">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input class="btn" type="button" value="취소" onclick="self.close();">
    </form>
    </center>
    <script>
        function review(){
            var rv_uno = $('#uno').val();
            var rv_ghno = $('#ghno').val();
            var rv_star = $('.on').length;
            var rv_content = $('#content').val();

            $.ajax({
                type:"POST",
                url:"/user/review.do",
                data:{rv_uno:rv_uno,rv_ghno:rv_ghno,
                      rv_star:rv_star, rv_content:rv_content},
                success: function(){
                   window.close();
                }
            });
        }

    </script>
</body>
</html>