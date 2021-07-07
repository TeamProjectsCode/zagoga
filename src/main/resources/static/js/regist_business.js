function blankCheck() {
    var isFillOut = false;
    console.log('here');

    var pwCheck = $("#userPWCheck").val();
    if (pw !== pwCheck) {
        alert("비밀번호가 같지 않습니다.");
        $("#userPW").focus();
    }
    else {
        isFillOut = true;
    }

    return isFillOut;
}

function checkBusinessNumber() {
    var bNum = $(".inputHead").children(".businessNum");
    if (bNum[0].value == "" || bNum[1].value == "" || bNum[2].value == "") {
        alert("올바른 사업자 주소가 아닙니다.");
    }
    else {
        abile();
        $(".businessNum")[0].setAttribute("readonly", true);
        $(".businessNum")[1].setAttribute("readonly", true);
        $(".businessNum")[2].setAttribute("readonly", true);
        $("#checkBusinessNumberBtn").attr("disabled", true);
    }
}

$(".businessNum").keyup(function () {
    if (this.value.length == this.maxLength) {
        $(this).next(".businessNum").focus();
    }
})

$( function(){
    $( '#emailID' ).on("blur keyup", function() {
        $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣 | ~!@\#$%<>^&*\()\-=+_\’]/g, '' ) );
    });
})
function abile() {
    $("#brand").attr("disabled", false);
    $("#owner").attr("disabled", false);
    $("#userID").attr("disabled", false);
    $("#userPW").attr("disabled", false);
    $("#userPWCheck").attr("disabled", false);
    $("#userPWShow").attr("disabled", false);
    $(".phoneNum")[0].removeAttribute("disabled");
    $(".phoneNum")[1].removeAttribute("disabled");
    $(".phoneNum")[2].removeAttribute("disabled");
    $("#emailID").attr("disabled", false);
    $("#emailAddr").attr("disabled", false);
    $("#registerButton").attr("disabled", false);
}