function dispList(select) {
    var obj1 = document.getElementById("infobox");
    var obj2 = document.getElementById("phonebox");
    if( select == "0" ) { // infobox
        obj1.style.display = "block";
        obj2.style.display = "none";
    } else { //phonebox
        obj1.style.display = "none";
        obj2.style.display = "block";
    }
}

function infoCheck(){
    var name =  $("#name").val();
    var jumin =  $("#jumin").val();
    var type = $(':radio[name="type"]:checked').val();
    var checking = false;

    if(type == null){
        alert("타입을 선택해주세요");
    }else if(jumin == ""){
        alert("주민번호를 입력해주세요")
        console.log(type)
        $("#jumin").focus();
    }else if(name == ""){
        alert("이름을 입력해주세요");
        $("#name").focus();
    }
    else{
        checking = true;
    }
    if(checking == true){
        document.form.submit();
    }
}
