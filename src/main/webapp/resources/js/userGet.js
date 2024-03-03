// 회원정보 수정 버튼 클릭 시 경고창을 띄운 후
// 회원 비밀번호를 체크
function updateUser() {
	if(confirm("회원 정보를 수정하시겠습니까?")) {
	    var userName = $('#userName').val();
	    var userPwd = $('#userPwd').val();
	    var pwdCheck = $('#pwdCheck').val();
	    
	    if(userPwd != ""){
		    if(userPwd === pwdCheck){
		    	$('#updateUser').submit();
		    }else {
		    	alert("비밀번호가 맞지 않습니다.");
		    }
	    }else {
			alert("비밀번호를 입력해주세요");
			return;
		}
	}
}

// 회원정보 수정시 수정이 가능한 목록은 readonly해제
// 수정 불가능한 목록은 disabled 해제 후 readonly로 변경
function update() {
	console.log("함수 실행");
	$("input[type=text]").removeAttr("readonly");
	$("input[type=text]").removeAttr("disabled");
	$("input[type=password]").removeAttr("readonly");
	$('#email').attr("readonly", "readonly"); // This line adds the readonly attribute
	$('#birth').attr("readonly", "readonly"); // This line adds the readonly attribute
	$('.update').stop().hide();
	$('.updateUser').stop().show();
}