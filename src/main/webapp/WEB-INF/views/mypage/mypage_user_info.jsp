<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/user_mypage_info.css" media="all" rel="Stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
    <script>
         function user_info () {

            var param1 = $("#no").val();
            var param2 = $("#nick").val();

            $.ajax({
                type:"POST",
                url:"/ajax/info",
                data: {nick:param2},
                success:function (result){
                    console.log(result);
                    var msg = document.getElementById("msg");
                    if(result == 1){
                        $("#msg").text("사용 불가능한 아이디입니다.");
                        $("#msg").css("color", "red");
                    }else{
                        $("#msg").text("사용 가능한 아이디입니다.");
                        $("#msg").css("color", "blue");
                    }
                },
                error:function (e) {
                    console.log(e);
                }

            });
        }
    </script>
</head>
<body>
<%@ include file="../header.jsp"%>
    <center>
        <div class="mainbox">
        <fieldset class="main_a"> ${user.u_name}님의 소중한 개인정보입니다.</fieldset>

        <div class="info-table">
        <table  border="2" class="info" >
            <tr>
                <th class="title">이름</th>
                <td>${user.u_name}</td>
            </tr>
            <tr height="20">
                <th class="title">사용자ID</th>
                <td>${user.u_mail}</td>
            </tr>
            <tr height="20" >
                <th class="title">닉네임</th>
                <td><input name="u_nick" id="nick" value="${user.u_nick}"><span id="msg"></span><button id="nick_modify" onclick="user_info()">수정</button></td>
                <input type="hidden" id="no" value="${user.u_no}">
            </tr>
            <tr height="20">
                <th class="title">주민번호</th>
                <td><input name="u_jumin" value="1999">년 <input name="birth" value="1">월<input name="birth" value="1">일</td>
            </tr>
            <tr height="20">
                <th class="title">비밀번호</th>
                <td><input name="u_pwd" id="pw" value="12345">&nbsp</td>
            </tr>
<%--            <tr height="20">--%>
<%--                <th class="title">E-mail</th>  --%>
<%--                <td>aaa@naver.com</td>--%>
<%--            </tr>--%>
            <tr height="20">
                <th class="title">전화번호</th>
                <td>${user.u_phone}</td>
            </tr>
<%--            <tr height="20">--%>
<%--                <th class="title">주소</th> --%>
<%--                <td><input name="add" id="#" value="부산시 수영구">&nbsp;&nbsp;<button>수정</button></td>--%>
<%--            </tr>--%>
<%--            <tr height="20">--%>
<%--                <th class="title">상세주소</th> --%>
<%--                <td><input name="add" id="#" value="111-342호"></td>--%>
<%--            </tr>--%>
        </table>
        </div>

        <div class="btn">

           <a href="#"><button class="btn-m">탈퇴하기</button></a>
        </div>
    </div>
    </center>
    <%@ include file="../footer.jsp"%>
</body>
</html>