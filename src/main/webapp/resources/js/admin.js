$(function(){
	$('.logoutBtn').click(function(e){
		e.preventDefault();
		$('#logoutForm').submit();
	});

	// 회원삭제 시 다시 한 번 물어보는 경고창 띄우기
	$('.adminDeleteUser').click(function(e){
		e.preventDefault();

		if(confirm("정말 회원을 삭제하시겠습니까?")){
			var email = $(this).attr("href");

			$('#deleteUser').append("<input type='hidden' name='email' value="+ email +" />");
			$("#deleteUser").submit();
		}
	});
	
	// 공지사항을 하나를 클릭했을 때 공지사항의 상세 정보가기
	$('.getNotice').click(function(e){
		e.preventDefault();
		var noticeNum = $(this).attr("href");
		
		$('#noticeGet').append("<input type='hidden' name='noticeNum' value='"+noticeNum+"' /> ");
		$('#noticeGet').submit();
	});
});

// 공지사항 등록할 시 예외처리 함수
function NoticeCheck() {
	if ($('#noticeTitle').val() == "") {
    	alert("제목은 필수입력 사항입니다.");
        $('#noticeTitle').focus();
        return false;
    }
	
	if ($('#noticeContent').val() == "") {
    	alert("내용은 필수입력 사항입니다.");
        $('#noticeContent').focus();
        return false;
    }
	
	$('#noticeInsert').submit();
};

// 공지사항 등록할 때 이미지 삽입 시 이미지 미리보기 함수
function noticeInsertImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgSrc = e.target.result;

            // 형제 엘리먼트에 이미지 추가
			$(input).parent().append("<img src='" + imgSrc + "' width='300' height='100' style='float:right'/>");
        };
        reader.readAsDataURL(input.files[0]);
    }
};

// 공지사항 삭제 시 물어보는 경고창
function deleteNotice(){
	if(confirm("정말 공지사항을 삭제하시겠습니까?")){
		$('#noticeDeleteForm').submit();
	};
};

// 공지사항 업데이트할 때 바꾼 사진 미리보기
function noticeUpdateImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgSrc = e.target.result;

            // 형제 엘리먼트에 이미지 추가
            $(input).siblings("img").attr("src", imgSrc);
        };
        reader.readAsDataURL(input.files[0]);
    };
};



