
// 아이디 비번찾는 라디오 옵션
function search_check(num) {
    if (num == 1) {
        document.getElementById('search_P').style.display = "none";
        document.getElementById('search_I').style.display = "";
    } else {
        document.getElementById('search_I').style.display = "none";
        document.getElementById('search_P').style.display = "";
    }
}

// 이름,전화번호 값 받고 출력하는 함수
function idSch_click() {
    var name = $('#name_1').val(); // 이름 입력 필드 값
    var phone = $('#phone').val(); // 전화번호 입력 필드 값
    
    
    console.log(name);
    console.log(phone);
    $.ajax({
        type: "post",
        url: "idsearch",
        async: true,
        data: {
            "name": name,
            "phone": phone
        },
        success: function(data) {
            if (data == 0) {
                $('#value').text("일치하는 회원 정보가 없습니다.");
            } else {
            	console.log(data)
            	 $('#search_value').text(name+" 회원님의 아이디는");
                $('#value').text(data);
                
            }
        },
        error: function(data) {
            alert(data);
        }
    });
}


// 아이디 값 받고 출력하는 함수
function pwSch_click() {
    var id = $('#sch_id').val(); // 아이디 입력 필드 값
    var phone = $('#phone_2').val(); // 전화번호 입력 필드 값
    var name = $('#name_2').val(); // 이름 입력 필드 값
    console.log(id);
    console.log(phone);
    console.log(name);
    $.ajax({
        type: "post",
        url: "pwsearch",
        async: true,
        data: {
            "id": id,
            "phone": phone,
            "name" : name
        },
        success: function(data) {
            if (data == 0) {
                $('#value').text("일치하는 회원 정보가 없습니다.");
            } else {
            	console.log(data)
            	 $('#search_value').text(name+" 회원님의 임시 비밀번호는");
                $('#value').text(data);
                
            }
        },
        error: function(data) {
            alert(data);
        }
    });
}

// 모달 버튼 기능
$(document).ready(function(){
    // 모달 열기 버튼 클릭 이벤트
    $('#IdBtn').click(function(){
        $('#background_modal').show();
    });
    
    $('#PwBtn').click(function(){
        $('#background_modal').show();
    });

    // 모달 닫기 버튼 및 모달 바깥 영역 클릭 시 모달 숨기기
    $('.close').on('click', function(){
        $('#background_modal').hide();
    });

    $(window).on('click', function(){
        if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
        }
    });
});