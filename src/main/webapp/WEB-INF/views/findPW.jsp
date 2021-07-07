<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/findID.css" />
    <script src="/resources/js/findpw.js"></script>
    <script src="/resources/js/pwShowToggle.js"></script>
    <script>
        function change(e){
            if(e.value == "선택"){
                document.getElementById('emailAddr').value;
            }else if (e.value=="@naver.com"){
                document.getElementById('emailAddr').value;
            }else if (e.value=="@daum.net"){
                document.getElementById('emailAddr').value;
            }else if (e.value=="@gmail.com"){
                document.getElementById('emailAddr').value;
            }else if (e.value=="@nate.com"){
                document.getElementById('emailAddr').value;
            }
        }
    </script>
    <script>
        //이메일 보냄
        function emailSend(){//이메일 보냄
            let jumin = $('#jumin1').val() + $('#jumin2').val();
            let clientEmail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
            console.log('입력한 메일' + clientEmail);
            if(clientEmail !== ""){
                $.ajax({
                    type:"POST",
                    url:"/login/Checkmail",
                    data:{jumin:jumin, username:clientEmail, name: $('#name').val()},
                    success: function(isSuccess){
                        if(isSuccess){
                            alert("인증번호가 발송되었습니다.");
                            $('#certificationNumber').attr("disabled",false);
                            $('#certificationButton').attr("disabled",false);
                            $('#userPW').attr("disabled",false);
                            $('#userPWShow').attr("disabled",false);
                            $('#userPWCheck').attr("disabled",false);
                        }
                        else {
                            alert("조회 할 수 없는 사용자 정보입니다.")
                        }
                        console.log('오류없음', isSuccess);
                    },
                    error: function (e){
                        alert("인증번호 발송에 실패하였습니다.")
                        console.log('실패',e);
                    }
                });
            }
        }
    </script>
    <script>
        function emailCertification(){
            let clientEmail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
            let inputCode = document.getElementById('certificationNumber').value;
            console.log('이메일' + clientEmail);
            console.log('인증코드' + inputCode);

            $.ajax({
                type:"POST",
                url:"/register/certification.do",
                data:{u_mail:clientEmail, inputCode:inputCode},
                success: function(data){
                    console.log(data);
                    if(data == true){
                        alert('인증완료');
                        document.getElementById('certificationYN').value = "true";
                        $('#certificationButton').attr("disabled",true);
                        console.log($('#certificationYN').val());
                    }else{
                        alert('인증을 다시 시도해주세요');
                    }
                },
                error: function(e){
                    alert('전송오류')
                    console.log('에러' + e);
                }
            });
        }
    </script>
</head>
<body>
<header>
    <h2>
        <a href="/main">Zagoga</a>
    </h2>
    <div class="imgbox"></div>
    <div class="navbox">
        <div class="dropdown">
            <button class="dropbtn" onclick="location.href='/login/findID'">아이디 찾기</button>
        </div>
        <div class="dropdown">
            <button class="dropbtn" onclick="location.href='/login/findPW'">비밀번호 찾기</button>
        </div>
    </div>
</header>
<!-- 공간 비우기용-->
<div class="space"></div>
<div class="main">
    <div class="title">
        <li>비밀번호 찾기</li>
    </div>
    <p>비밀번호를 찾는 방식을 선택해 주세요.</p>
    <div class="box">
<%--        <input type="radio" name="radio" id="info" onclick="dispbox('0');"><label for="info">이메일을 통한 비밀번호 찾기</label>--%>
        <div id="infobox">
            <form name="form" action="/login/showPW" method="post" onsubmit="return updatePW();">
                <table>
<%--                    <tr>--%>
<%--                        <td>타입</td>--%>
<%--                        <td>--%>
<%--                            <input type="radio" name="type" id="user" value="USER"><label for="user">여행객</label>--%>
<%--                            <input type="radio" name="type" id="host" value="HOST"><label for="host">호스트</label>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td>이름</td>
                        <td><input class="findPWInput" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td>주민번호</td>
                        <td><input type="text" class="findPWInput" id="jumin1" name="jumin" size="10" maxlength="6" onkeyup="$(this).val($(this).val().replace(/\D/g,''));">
                            - <input type="password" class="findPWInput"  id="jumin2" name="jumin" size="10" maxlength="7" onkeyup="$(this).val($(this).val().replace(/\D/g,''));"> </td>
                    </tr>
                    <tr>
                        <td>아이디  </td>
                        <td>
                            <input type="text" class="findPWInput" id="emailID" name="username" placeholder="이메일" required>
                            @ <select id="emailAddr" class="findPWInput" name="username" onchange="change(this)" required>
                            <option>선택</option>
                            <option value="@naver.com">naver.com</option>
                            <option value="@daum.net">daum.net</option>
                            <option value="@gmail.com">gmail.com</option>
                            <option value="@nate.com">nate.com</option>
                        </select>
                            <div id="mail_check"></div>
                            <div><button type="button" id="emailCheck" onclick="emailSend()">인증번호 받기</button></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><div id="waring">텍스트 적힐 곳</div> </td>
                    </tr>
                    <tr>
                        <td>
                            인증번호 :
                        </td>
                        <td>
                            <input type="text" id="certificationNumber" disabled>&nbsp;&nbsp;
                            <input type="button" id="certificationButton" onclick="emailCertification()" value="인증하기" disabled>
                            <input type="hidden" name="certificationYN" id="certificationYN" value="false">
                        </td>
                    </tr>
                    <tr>
                        <td class="inputPW"><input type="password" id="userPW" name="password" placeholder="비밀번호" disabled required></td>
                        <td class="inputPWShow"><input type="image" id="userPWShow" onclick="pwShowToggle(); return false;" src="/resources/img/visibility.png" alt="show password" disabled/></td>
                    </tr>
                    <tr><td class="inputPW"><input type="password" id="userPWCheck" name="userPWCheck" placeholder="비밀번호 재입력" disabled required></td></tr>
                    <tr>
                        <td>
                            <button class="btn" type="submit">다&nbsp;&nbsp;&nbsp;음</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
<%--    <div class="box2">
        <input type="radio" name="radio" id="phone" onclick="dispbox('1');"><label for="phone">본인명의의 휴대폰으로 찾기</label>
        <div id="phonebox" style="display:none">
            <p>너는.. 다음에 보자</p>
        </div>
    </div>--%>
</div>
<div class="space"></div>
</body>
</html>
