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
<script src="/resources/js/pwShowToggle.js"></script>
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
    <script>
        function pwdFieldCheck(inputCode, new_pwd) {
            return inputCode === "" || new_pwd === ""
        }
    </script>
    <script>
        function updatUserPWD(){
            let inputCode = $('#inputCode').val();

            let new_pwd = $('#pw1').val();
            let new_pwd2 = $('#pw2').val();

            if(pwdFieldCheck(inputCode, new_pwd)){
                alert("인증번호와 새 비밀번호는 반드시 입력하셔야 합니다.")
                return 0;
            }

            if (new_pwd === new_pwd2 ){
                $.ajax({
                    type:"POST",
                    url:"/user/updatUserPWD",
                    data:{inputCode:inputCode, new_password:new_pwd},
                    success: function(isSuccess){
                        if( isSuccess === 1){
                            alert('비밀번호 변경 완료!');
                            self.close();
                        }else if(isSuccess === -1){
                            alert('인증번호가 잘못 되었습니다.\n새 인증 번호를 보내려면 비밀번호 변경 버튼을 다시 눌러주세요!');
                            $('#inputCode').focus();
                        }
                    },
                    error: function(e){
                        alert('전송오류')
                        console.log('에러' + e);
                    }
                });
            } else {
                alert("새로운 비밀번호를 확인해주세요.");
            }
        }
    </script>

</head>
<body>
<div class="total">
    <div class="a">
<%--        <form method="post" action="">--%>
    <h1>비밀번호 변경</h1>
    <h3>인증코드</h3>
    <input class="pw" type="password" name="inputCode" id="inputCode" maxlength="20" style="width: 330px"   required>
    <br><br>
    <h3>새 비밀번호</h3>
    <input class="pw" type="password" name="new_pw" id="pw1" maxlength="20" style="width: 330px"   required>
            <br><br>
    <h3> 새 비밀번호 확인</h3>
    <input class="pw" type="password" name="conf_pw" id="pw2" maxlength="20" style="width: 330px"   required>
        <br>
        <p id="alert_a" size="2"></p>
    <br>
    <button type="button" id="changePw" onclick="updatUserPWD()">수정완료</button>
    <button type="button"  onclick="self.close();">취소</button>
<%--        </form>--%>
    </div>
</div>
</body>
</html>
