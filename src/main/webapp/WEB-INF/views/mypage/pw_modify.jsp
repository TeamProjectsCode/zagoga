<%--
  Created by IntelliJ IDEA.
  User: 박지은
  Date: 2021-07-10
  Time: 오후 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../resources/js/jquery.js"></script>
<script src="../resources/js/user.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/pw_modify.css">
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        $(function(){
            $('#pw1').keyup(function(){
                $('#alert_a').html('');
            });

            $('#pw2').keyup(function(){

                if($('#pw1').val() != $('#pw2').val()){
                    $('#alert_a').html('비밀번호 일치하지 않음<br><br>');
                    $('#alert_a').css("color", "red");
                } else{
                    $('#alert_a').html('비밀번호 일치함<br><br>');
                    $('#alert_a').css("color", "#0100C6");
                }

            });
        });
    </script>
</head>
<body>
<div class="total">
    <div class="a">
        <form method="post" action="">
    <h1>비밀번호 변경</h1>
    <h3>현재 비밀번호</h3>
    <input class="pw" type="password" name="now_pw" maxlength="20" style="width: 330px"   required>
    <h3>새 비밀번호</h3>
    <input class="pw" type="password" name="new_pw" id="pw1" maxlength="20" style="width: 330px"   required>
            <br><br>
    <h3> 새 비밀번호 확인</h3>
    <input class="pw" type="password" name="conf_pw" id="pw2" maxlength="20" style="width: 330px"   required>
        <br>
        <p id="alert_a" size="2"></p>
    <br>
    <button type="submit" id="changePw" onclick="'#'">수정완료</button>
    <button type="button"  onclick="self.close();">취소</button>
        </form>
    </div>
</div>
</body>
</html>
