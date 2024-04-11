$(document).ready(function() {
    // 아이디 유효성 검사
    $("#id").blur(function() {
        var id = $("#id").val();
        if (id == "" || id.length < 4 || id.length > 12 || !/^[a-z0-9]{4,12}$/.test(id)) {
            $(".idchk").text("아이디는 4자 이상 12자 이하로 설정해주세요");
            $(".idchk").css("color", "red");
            $("#IdDoubleChk").val("false");
            e.preventDefault();
            reutrn;
        } 
        else {
            $.ajax({
                url: 'checkid',
                type: 'post',
                cache: false,
                data: {
                    "id": id
                },
                success: function(data) {
                    if (data == "ok") {
                        $(".idchk").text("✔");
                        $(".idchk").css("color", "green");
                        $("#IdDoubleChk").val("true");
                    } else if(data == 'no') {
                        $(".idchk").text("✘ 사용중인 아이디");
                        $(".idchk").css("color", "red");
                        $("#IdDoubleChk").val("false");
                        e.preventDefault();
                        return;
                    }
                },
                error: function() {
                    console.log("아이디 확인 중 오류가 발생했습니다.");
                }
            });
        }
    });
    
    // 비밀번호 유효성 검사
    $("#pw2").blur(function(){
        var pw1 = $("#pw1").val();
        var pw2 = $("#pw2").val();
        if (pw1 !== "" && pw2 !== "" && /^[A-Za-z0-9]{7,12}$/.test(pw1)) {
            $(".pwchk1").text("✔");
            $(".pwchk1").css("color", "green");
            $("#PwDoubleChk").val("true");
            if(pw1 === pw2){
                $(".pwchk2").text("✔");
                $(".pwchk2").css("color", "green");
                $("#PwDoubleChk").val("true");
            } else {
                $(".pwchk2").text("✘ 일치하지 않음");
                $(".pwchk2").css("color", "red");
                $("#PwDoubleChk").val("false");
                $('#pw1').focus();
                e.preventDefault();
                return;
            }
        } else {
            $(".pwchk1").text("✘ 사용불가능한 비밀번호.");
            $(".pwchk1").css("color", "red");
            $("#PwDoubleChk").val("false");
            $('#pw1').focus();
            e.preventDefault();
            return;
        }
    });
    
    // 이름 유효성 검사
    $("#name").blur(function() {
        var name = $("#name").val();
        if (name == "" || !/^[가-힣]{2,5}$/.test(name)) {
            $(".namechk").text("✘ 이름은 2자 이상 5자 이하의 한글로 입력.");
            $(".namechk").css("color", "red");
            $("#NameDoubleChk").val("false");
            e.preventDefault();
            return;
        } else {
            $(".namechk").text("✔");
            $(".namechk").css("color","green");
            $("#NameDoubleChk").val("true");
        }
    });
    
     
   
    
    // 연락처 유효성 검사
    
    $("#phone1, #phone2, #phone3").blur(function() {
        var phone1 = $("#phone1").val();
        var phone2 = $("#phone2").val();
        var phone3 = $("#phone3").val();
        if (!/^[0-9]{3}$/.test(phone1) || !/^[0-9]{4}$/.test(phone2) || !/^[0-9]{4}$/.test(phone3)) {
            $(".phonechk").text("✘ 연락처 형식이 맞지 않습니다.");
            $(".phonechk").css("color", "red");
            $("#PhoneDoubleChk").val("false");
            e.preventDefault();
            return;
        } else {
            $(".phonechk").text("✔");
            $(".phonechk").css("color", "green");
            $("#PhoneDoubleChk").val("true");
        }
    });
    
    
    // 주소 유효성 검사
    $("#addr2").blur(function() {
        var addr2 = $("#addr2").val();
       	
        if (addr2.trim() == "") {
            $(".addrchk").text("✘ 주소를 입력해주세요.");
            $(".addrchk").css("color", "red");
            $("#AddrDoubleChk").val("false");
            e.preventDefault();
            return;
            
        } else {
            $(".addrchk").text("✔");
            $(".addrchk").css("color", "green");
            $("#AddrDoubleChk").val("true");
        }
    });
    
	     // 닉네임 유효성 검사
	     
	$("#nickname").blur(function() {
	    var nickname = $("#nickname").val();
	    if (!/^[a-zA-Z0-9가-힣]{2,8}$/.test(nickname)) {
	        $(".nickchk").text("✘ 영대소문자, 숫자, 한글로 2~8자 입력가능.");
	        $(".nickchk").css("color", "red");
	        $("#NickDoubleChk").val("false");
	        e.preventDefault();
	        return;
	    } 
	     else {
            $.ajax({
                url: 'checknick',
                type: 'post',
                cache: false,
                data: {
                    "nick":nickname 
                },
                success: function(data) {
                    if (data == "ok") {
                        $(".nickchk").text("✔");
                        $(".nickchk").css("color", "green");
                        $("#NickDoubleChk").val("true");
                    } else{
                        $(".nickchk").text("✘ 사용중인 닉네임");
                        $(".nickchk").css("color", "red");
                        $("#NickDoubleChk").val("false");
                        e.preventDefault();
                        return;
                    }
                },
                error: function() {
                    console.log("닉네임 확인 중 오류가 발생했습니다.");
                }
            });
        }
	    
	});

	 // 회원가입 버튼 클릭 시
	    $("#signupBtn").click(function() {
	        var idCheck = $("#IdDoubleChk").val();
	        var pwCheck = $("#PwDoubleChk").val();
	        var nameCheck = $("#NameDoubleChk").val();
	        var juminCheck = $("#JuminDoubleChk").val();
	        var phoneCheck = $("#PhoneDoubleChk").val();
	        var addrCheck = $("#AddrDoubleChk").val();
	        var nickCheck = $("#NickDoubleChk").val();
	       
	        
	        // 필수 입력 항목의 유효성 검사 결과 확인
	        if (idCheck !== "true") {
	            alert("아이디를 확인해주세요.");
	            return;
	        }
	        if (pwCheck !== "true") {
	            alert("비밀번호를 확인해주세요.");
	            return;
	        }
	        if (nameCheck !== "true") {
	            alert("이름을 확인해주세요.");
	            return;
	        }
	        if (phoneCheck !== "true") {
	            alert("연락처를 확인해주세요.");
	            return;
	        }
	        if (addrCheck !== "true") {
	            alert("주소를 확인해주세요.");
	            return;
	        }
	        if (nickCheck !== "true") {
	            alert("닉네임을 확인해주세요.");
	            return;
	        }
	        
	        // 모든 조건을 만족하면 회원가입 진행
	        $("#signupform").submit();
	    });
	
    
});
