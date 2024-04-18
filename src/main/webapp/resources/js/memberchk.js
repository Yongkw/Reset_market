$(document).ready(function() {

	 $("#pw2").prop('disabled', true);


    // 아이디 유효성 검사
    $("#sign_id").keyup(function() {
        var id = $("#sign_id").val();
       	var idrule = /^[a-z0-9]{4,12}$/;
        if (id == "" || id.length < 4 || id.length > 12 || !idrule.test(id)) {
            $(".idchk").text("아이디는 4자 이상 12자 이하로 설정해주세요");
            $(".idchk").css("color", "red");
            $("#IdDoubleChk").val("false");
            return;
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
                    } else{
                        $(".idchk").text("✘ 사용중인 아이디");
                        $(".idchk").css("color", "red");
                        $("#IdDoubleChk").val("false");
                        
                        return;
                    }
                },
                error: function() {
                    console.log("아이디 확인 중 오류가 발생했습니다.");
                }
            });
        }
    });
    
// 비밀번호 확인 필드에서 텍스트 입력 발생 시 처리
$("#pw1,#pw2").keyup(function(){
    var pw1 = $("#pw1").val();
    var pw2 = $("#pw2").val();
    var pwrule = /^(?=.*[a-z])(?=.*\d)[a-z\d]{7,12}$/;
    
    if (pw1 !== "" && pwrule.test(pw1)) {
        $(".pwchk1").text("✔");
        $(".pwchk1").css("color", "green");
        $("#PwDoubleChk").val("true");
         $("#pw2").prop('disabled', false);
        if(pw1 === pw2){
            $(".pwchk2").text("✔");
            $(".pwchk2").css("color", "green");
            $("#PwDoubleChk2").val("true");
        } else {
            $(".pwchk2").text("✘ 일치하지 않음");
            $(".pwchk2").css("color", "red");
            $("#PwDoubleChk2").val("false");
            return;
        }
    } else {
        $(".pwchk1").text("✘ 사용불가능한 비밀번호.");
        $(".pwchk1").css("color", "red");
        $("#PwDoubleChk").val("false");
       return;
    }
});

    
    // 이름 유효성 검사
    $("#name").keyup(function() {
        var name = $("#name").val();
        if (name == "" || !/^[가-힣]{2,5}$/.test(name)) {
            $(".namechk").text("✘ 이름은 2자 이상 5자 이하의 한글로 입력.");
            $(".namechk").css("color", "red");
            $("#NameDoubleChk").val("false");
            
            return;
        } else {
            $(".namechk").text("✔");
            $(".namechk").css("color","green");
            $("#NameDoubleChk").val("true");
        }
    });
    
     
   
    
    // 연락처 유효성 검사
    
    $("#phone1, #phone2, #phone3").keyup(function() {
        var phone1 = $("#phone1").val();
        var phone2 = $("#phone2").val();
        var phone3 = $("#phone3").val();
        if (!/^[0-9]{3}$/.test(phone1) || !/^[0-9]{4}$/.test(phone2) || !/^[0-9]{4}$/.test(phone3)) {
            $(".phonechk").text("✘ 연락처 형식이 맞지 않습니다.");
            $(".phonechk").css("color", "red");
            $("#PhoneDoubleChk").val("false");
            
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
       	
        if (addr2 === "" || addr2 == null) {
            $(".addrchk").text("✘ 주소를 입력해주세요.");
            $(".addrchk").css("color", "red");
            $("#AddrDoubleChk").val("false");
            return;
            
        } else {
            $(".addrchk").text("✔");
            $(".addrchk").css("color", "green");
            $("#AddrDoubleChk").val("true");
            $('#nickname').focus();
        }
    });
    
	     // 닉네임 유효성 검사
	     
	$("#nickname").keyup(function() {
	    var nickname = $("#nickname").val();
	   	    
	    
	    
	    if (!/^[a-zA-Z0-9가-힣]{2,8}$/.test(nickname)|| nickname === "") {
	        $(".nickchk").text("✘ 영대소문자, 숫자, 한글로 2~8자 입력가능.");
	        $(".nickchk").css("color", "red");
	        $("#NickDoubleChk").val("false");
	        
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
                        
                        return;
                    }
                },
                error: function() {
                    console.log("닉네임 확인 중 오류가 발생했습니다.");
                }
            });
        }
	    
	});
	
	//취소 버튼 클릭 시 
	
		$("#cancelBtn").click(function(){
	    // 사용자가 진행하던 작업을 중단하고 메인 페이지로 이동
	    window.location.href = "main_view";
	});
	
	// 회원가입 버튼 클릭 시
	    $("#signupBtn").click(function(e) {
	        var idCheck = $("#IdDoubleChk").val();
	        var pwCheck = $("#PwDoubleChk").val();
	        var pwCheck2 = $("#PwDoubleChk2").val();
	        var nameCheck = $("#NameDoubleChk").val();
	        var phoneCheck = $("#PhoneDoubleChk").val();
	        var addrCheck = $("#AddrDoubleChk").val();
	        var nickCheck = $("#NickDoubleChk").val();
	       
	      
	        
	        // 필수 입력 항목의 유효성 검사 결과 확인
	        if (idCheck !== "true") {
	            alert("아이디를 확인해주세요.");
	            e.preventDefault();//이벤트의 기본동작을 차단하는 함수..!
	            return;
	        }
	        if (pwCheck !== "true") {
	            alert("비밀번호를 확인해주세요.");
	            e.preventDefault();
	            return;
	        }
	        if (pwCheck2 !== "true") {
	            alert("비밀번호가 일치하지 않습니다!");
	            e.preventDefault();
	            return;
	        }
	        if (nameCheck !== "true") {
	            alert("이름을 확인해주세요.");
	            e.preventDefault();
	            return;
	        }
	        if (phoneCheck !== "true") {
	            alert("연락처를 확인해주세요.");
	            e.preventDefault();
	            return;
	        }
	        if (addrCheck !== "true") {
	            alert("주소를 확인해주세요.");
	            e.preventDefault();
	            return;
	        }
	        if (nickCheck !== "true") {
	            alert("닉네임을 확인해주세요.");
	            e.preventDefault();
	            return;
	        }
	        
	        // 모든 조건을 만족하면 회원가입 진행
	        var name = $("#name").val();
	        $("#signupform").submit();
	        alert(name+"님의 회원가입이 완료 되었습니다!");
	         window.location.href = "main_view";
	    });
	
    
});
