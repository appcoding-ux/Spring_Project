// 상품 수정할 때 상품 데이터 예외처리
function itemUpdateSubmit() {
    var itemName = $('#itemName').val(); // 상품명
    var sale = $('#sale').val(); // 가격
    var countM = $('#itemCountM').val(); // M 재고
    var countL = $('#itemCountL').val(); // L 재고
    var countXL = $('#itemCountXL').val(); // XL 재고
    var category = $('#categoryNum').val(); // 카테고리 번호

    // 메인이미지부터 서브이미지 4개까지 input file로 받은 5개 이미지파일
    var mainImg = $('#mainImg')[0].files.length; // 메인이미지
    var subImg1 = $('#subImg1')[0].files.length; // 서브이미지1
    var subImg2 = $('#subImg2')[0].files.length; // 서브이미지2
    var subImg3 = $('#subImg3')[0].files.length; // 서브이미지3
    var subImg4 = $('#subImg4')[0].files.length; // 서브이미지4

    if (itemName == "" || sale == "" || countM == "" || countL == "" || countXL == "" || category== "") { // 상품 정보 예외처리
        alert("상품 정보를 정확히 입력해주세요");
    } else if (mainImg === 0) { // 메인이미지 예외처리
        alert("메인 이미지는 반드시 등록해야합니다.");
    } else if (subImg1 === 0 || subImg2 === 0 || subImg3 === 0 || subImg4 === 0) { // 나머지 서브 이미지 4개 예외처리
        alert("서브 이미지는 반드시 등록해야합니다.");
    } else {
        $('#itemGet').submit();
    }
}

// 상품 삭제 시 경고창 띄우기
function itemDelete() {
	var form = $('#itemGet').attr("action");
	console.log(form);
	if(confirm("정말 상품을 삭제하시겠습니까?")) {
	    // 새로운 액션 설정
	    $("#itemGet").attr("action", "/admin/deleteItem");
	    $("#itemGet").attr("method", "get");
	    
	    // form 제출
	    $("#itemGet").submit();
	}
}

// 상품 수정을 눌렀을 때 수정하기 버튼 표시 및 readonly 해제 
// 수정 불가능한 정보들은 readonly
function itemUpdate() {
	$("input[type=text]").removeAttr("readonly");
	$("input[type=file]").removeAttr("disabled");
	$('.updateStart').stop().hide();
	$('.updateEnd').stop().show();
}

// 상품수정할 때 사진 미리보기
function itemInsertImg(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgSrc = e.target.result;

            // 형제 엘리먼트에 이미지 추가
            $(input).siblings("img").attr("src", imgSrc);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
