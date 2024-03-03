$(function () {
    $('.content_box').not(":first").hide();

    // 마이페이지에 있는 메뉴들을 클릭했을 때 링크가 넘어가지 않고 css가 변하면서 각각의 메뉴가 보이게 변경
    $('.menu a').click(function (e) {
        $('.menu a').css({
            "background": "rgb(243, 243, 243)",
            "color": "rgb(117, 117, 117)",
            "border-right": "1px solid rgb(221, 221, 221)",
            "border-left": "1px solid rgb(221, 221, 221)"
        })

        $(this).css({
            "background": "#0e0e0e",
            "color": "#fff",
            "border-right": "1px solid #0e0e0e",
            "border-left": "1px solid #0e0e0e"
        });

        e.preventDefault();

        // 클릭하는 메뉴의 index를 가져와서 해당인덱스에 맞는 클래스 index를 찾아서 보여줌.
        var index = $(this).index();

        $('.content_box').stop().hide();
        $('.content_box').eq(index).stop().show();
    });

    // 배송버튼을 클릭했을 때 회원의 주소와 주문번호의 데이터가 input태그로 만들어지고 form태그 전송으로 배송 페이지로 넘어감.
    $('.myPageDeliver').click(function(e){
        e.preventDefault();
        var addr = $(this).attr("href");

        var orderId = parseInt($(this).closest("tr").find(".orderId").text());

        $('#Deliverytatus').append("<input type='hidden' name='roadAddress' value='"+ addr +"' />");
        $('#Deliverytatus').append("<input type='hidden' name='orderId' value='"+ orderId +"' />");

        $('#Deliverytatus').submit();
    });

    // 회원 탈퇴를 클릭했을 경우 다시 한 번 물어보는 경고창을 띄우고 form태그 전송
    $('.deleteUser').click(function(e){
        e.preventDefault();

        if(confirm("정말 회원탈퇴를 하시겠습니까?")){
            var email = $(this).attr("href");
            $('#myPageDeleteUser').append("<input type='hidden' name='email' value='"+email+"' />");
            $('#myPageDeleteUser').submit();
        }
    })
});
