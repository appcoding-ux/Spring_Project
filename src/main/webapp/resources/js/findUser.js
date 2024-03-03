
// 이메일로 보낸 인증코드와 대조를 위한 변수
var code = ""
// 비밀번호 찾기를 했을 때 이메일 입력 시
function findUser() {
	var email = $('#email').val();

	// input에 email의 값이 있을 경우에
	if (email != "") {
		$.ajax({
			type: 'get',
			url: '/shard/findPwd?email=' + email,
			
			// 데이터를 성공적으로 받고 예외처리
			success: function (data) {
				if (data == "noUser") { // 가입된 이메일이 없을 때
					alert("가입된 이메일이 없습니다.");
					location.href = '/shard/join';
				} else if (data == "kakaoUser") { // 카카오 회원가입을 통해 간편 회원가입을 했을 경우 (카카오 간편 회원가입은 데이터베이스에 비밀번호가 저장되지 않기 때문에 비밀번호 찾기를 이용할 수 없음)
					alert("카카오회원은 비밀번호 찾기를 이용할 수 없습니다.");
					location.href = '/shard/';
				} else { // 위 조건들이 거짓일 때 인증번호 입력을 위한 input이 나타나고 인증번호 전송 경고창 띄우기
					$('#findPwdCode').stop().show();
					$('#PwdCodeBtn').stop().show();
					console.log(data);
					code = data;
					alert("인증번호가 전송되었습니다.");
					return false;
				}
			},

			error: function () {
				console.log("에러에러에러");
			}
		});
	} else { // 이메일을 입력하지 않았을 경우
		alert("이메일을 입력해주세요");
		return false;
	}
}

//이메일 인증 번호 체크 -> 맞으면 true | 틀리면 fasle
function finePwdCodeCheck() {
	var inputCode = $('#findPwdCode').val();
	var check4 = false;


	if (inputCode != "") {
		if (inputCode === code) {
			alert("인증번호가 일치합니다.");
			$("#changePwd").submit();
		} else {
			alert("인증번호가 불일치 합니다. 다시 확인해주세요");
		}
	} else {
		emailText.text("인정번호를 입력해주세요");
	}

	return check4;
}

//비밀번호 확인 체크
function pwdDoubleCheck() {
	var pwd = $('#userPwd').val();
	var doublePwd = $('#userPwdCheck').val();

	if (pwd == doublePwd) {
		alert("비밀번호가 일치합니다.");
		$('#updatePwd').submit();
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	}
}