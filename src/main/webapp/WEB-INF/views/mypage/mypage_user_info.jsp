<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/user_mypage_info.css" media="all" rel="Stylesheet" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원정보 변경</title>
    <script>
         function user_info () {

            var param1 = $("#no").val();
            var param2 = $("#nick").val();

            $.ajax({
                type:"POST",
                url:"/user/updateNick",
                data: {nick:param2},
                success:function (result){
                    console.log(result);
                    var msg = document.getElementById("msg");
                    if(0 < result){
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
    <script>
        function userDelete(){
        var check = confirm("정말로 탈퇴를 하시겠습니까?");

        if (check == true) {
            $.ajax({
                type: "POST",
                url: "/user/delete.do",
                data:{no:$('#no').val()},
                success:function (result){
                    if($.trim(result) == "Y"){
                        alert("삭제되었습니다.\n 메인화면으로 돌아갑니다");
                        location.href="/logout";
                    }else{
                        alert("삭제에 실패하였습니다.\n 다시 시도해주세요.");
                    }
                },
                error: function(e){
                        console.log(e);
                        alert("삭제에 실패하였습니다.\n 다시 시도해주세요.");
                }
            });
        }
     }
    </script>
</head>
<body>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../header.jsp"%>
    <center>
        <div class="mainbox">
        <fieldset class="main_a"> ${user.u_name}님의 소중한 개인정보입니다.</fieldset>

        <div class="info-table">
<<<<<<< Updated upstream
        <form action="/user/updateInfo" method="post">
            <table  border="2" class="info" >
                <tr>
                    <th class="title">이름</th>
                    <td>${user.u_name}</td>
                </tr>
                <tr height="20">
                    <th class="title">사용자 ID</th>
                    <td>${user.u_mail}</td>
                </tr>
                <tr height="20" >
                    <th class="title">닉네임</th>
                    <td>
                        <input name="u_nick" id="nick" value="${user.u_nick}">   <button id="nick_modify" type="button" onclick="user_info()">중복확인</button>
                        <br>
                        <div style="height: 12px"><span id="msg" style="font-size: 11px;"></span></div>
                    </td>
                    <input type="hidden" id="no" value="${user.u_no}">
                </tr>
                <tr height="20">
                    <th class="title">생년월일</th>
                    <td>${fn:substring(user.u_jumin, 0, 2)}년 ${fn:substring(user.u_jumin, 2, 4)}월 ${fn:substring(user.u_jumin, 4, 6)}일</td>
    <%--                <td><input name="u_jumin" value="1999">년 <input name="birth" value="1">월<input name="birth" value="1">일</td>--%>
                </tr>
                <tr height="20">
                    <th class="title">비밀번호</th>
                    <td><input name="u_pwd" id="pw" value="옆에 버튼 만들고 오프너 생성해서 작업하기?">&nbsp</td>
                </tr>
    <%--            <tr height="20">--%>
    <%--                <th class="title">E-mail</th>  --%>
    <%--                <td>aaa@naver.com</td>--%>
    <%--            </tr>--%>
                <tr height="20">
                    <th class="title">핸드폰 번호</th>
                    <c:set value="${fn:substring(user.u_phone, 0, 3)}" var="u_phone1" />
                    <c:choose>
                        <c:when test="${fn:length(user.u_phone) eq 11}">
                            <c:set value="${fn:substring(user.u_phone, 3, 7)}" var="u_phone2" />
                            <c:set value="${fn:substring(user.u_phone, 7,11)}" var="u_phone3" />
                        </c:when>
                        <c:when test="${fn:length(user.u_phone) eq 10}">
                            <c:set value="${fn:substring(user.u_phone, 3, 6)}" var="u_phone2" />
                            <c:set value="${fn:substring(user.u_phone, 6,10)}" var="u_phone3" />
                        </c:when>
                    </c:choose>
                    <td>
                        <input type="text" name="u_phone" value="${u_phone1}" maxlength="3" style="width: 55px;">-
                        <input type="text" name="u_phone" value="${u_phone2}" maxlength="4" style="width: 55px;">-
                        <input type="text" name="u_phone" value="${u_phone3}" maxlength="4" style="width: 55px;">
                    </td>
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
            <div class="btn">
                <button class="btn-m" type="submit">수정하기</button>
                <a href="#"><button class="btn-m">탈퇴하기</button></a>
            </div>
        </form>
=======
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
<%--                <td><fmt:formatDate pattern="yyyy년MM월dd일" value="${user.u_jumin}"/></td>--%>
                <td>${user.u_jumin}</td>
            </tr>
            <tr height="20">
                <th class="title">비밀번호</th>
                <td><input name="u_pwd" id="pw" value="12345">&nbsp</td>
            </tr>
            <tr height="20">
                <th class="title">전화번호</th>
                <td>${user.u_phone}</td>
            </tr>
            <tr height="20">
                <th class="title">가입일시</th>
                <td>${user.u_join}</td>
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
           <a href="#"><button class="btn-m" onclick="userUpdate()">수정완료</button></a>
           <a href="#"><button class="btn-m" onclick="userDelete()">탈퇴하기</button></a>

>>>>>>> Stashed changes
        </div>
    </div>
    </center>
    <%@ include file="../footer.jsp"%>
</body>
</html>