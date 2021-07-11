function admin_approve(){
	var check = confirm("해당 계정을 승인하시겠습니까?");
	var h_no = $('#hno').val();

	if(check == true){
		document.location.href="/admin/admin_approve?h_no="+h_no

	}else{
	}
}
function admin_reject(){
	var check = confirm("해당 계정을 비승인 하시겠습니까?");
	var h_no = $('#hno').val();
	if(check == true){
		document.location.href="/admin/admin_reject?h_no="+h_no

	}else{
	}
}

function admin_stop(){
	var check = confirm("해당 계정을 정지하시겠습니까? \n 정지상태는 영구정지를 의미하며, 비승인상태와 동일합니다." )
	var h_no = $('#hno').val();

	if(check == true){
		document.location.href="/admin/admin_reject?h_no="+h_no
	}
}

function admin_rollback(){
	var check = confirm("해당 계정을 승인하시겠습니까?");
	var h_no = $('#hno').val();

	if(check == true){
		document.location.href="/admin/admin_approve?h_no="+h_no
	}
}