// function dispbox(select) {
//     var obj1 = document.getElementById("infobox");
//     var obj2 = document.getElementById("phonebox");
//     if( select == "0" ) { // infobox
//         obj1.style.display = "block";
//         obj2.style.display = "none";
//     } else { //phonebox
//         obj1.style.display = "none";
//         obj2.style.display = "block";
//     }
// }

function updatePW() {
    var isFillOut =false;

    var pw = $("#userPW").val();
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

$( function(){ // 이메일 막기
    $( '#mail' ).on("blur keyup", function() {
        $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣 | ~!\#$%<>^&*\()=+_\’]/g, '' ) );
    });
});