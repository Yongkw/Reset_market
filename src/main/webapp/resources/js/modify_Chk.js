$(document).ready(function(){
	
	
	// 변경할 비밀번호 입력창 비활성화
        $("#new_pw,#new_pw2").prop('disabled', true);

    // 현재 비밀번호 확인...
    $("#nowpw").keyup(function(){
        var nowpw = $("#nowpw").val(); 
        var pw = $("#member_pw").val();
        
        
       //1.조건 현재 비밀번호 입력란에 값이 공백이거나 널이면 false값 지정 
        if (nowpw === "" || nowpw == null) {
            $(".nowpw").text(" ✘ 비밀번호를 입력해주세요!"); 
            $(".nowpw").css("color","red")
            $("#PwChk").val("false"); 
            
            return;
        }
        
        //2.조건 현재비밀번호가 같지 않으면 false 값 지정
       else if(nowpw !== pw) {
            $(".nowpw").text(" ✘ 비밀번호가 일치하지 않습니다!");
            $(".nowpw").css("color","red");
            $("#PwChk").val("false");

            return;
        } 
        
        else {
            $(".nowpw").text("✔");
            $(".nowpw").css("color","green");
            $("#PwChk").val("true");
            
            // 비밀번호가 일치하면 변경할 비밀번호 입력창 활성화
            $("#new_pw,#new_pw2").prop('disabled', false);
            
            
        }
    });
    
    $("#new_pw").focusout(function(){
    var nowpw = $("#nowpw").val(); 
    var new_pw = $("#new_pw").val();
    var pwrule = /^(?=.*[a-z])(?=.*\d)[a-z\d]{7,12}$/;
    
   //1조건. 변경할 비밀번호가 공백일 경우 true 값

	if(new_pw === "" || new_pw == null){
		
		$("#PwDoubleChk").val("true");
		return;
	}    
   
   //2조건. 현재 비밀번호와 동일시 에러 창과 비동기식 문자 출력
   else if(nowpw == new_pw){
    	$(".pwchk1").text("✘ 현재 비밀번호와 동일합니다!");
    	$(".pwchk1").css("color","red");
    	$("#PwDoubleChk").val("false");
    	
    	return;
     }
     
	
	if (!pwrule.test(new_pw)) {
        $(".pwchk1").text("✘ 비밀번호는 영소문자와 숫자를 모두 포함하여 7~12자여야 합니다.");
        $(".pwchk1").css("color","red");
        $("#PwDoubleChk").val("false");
        return;
    }
	
	
	else{
		$(".pwchk1").text("✔ 사용가능한 비밀번호");
    	$(".pwchk1").css("color","green");
    	$("#PwDoubleChk").val("true");
    	$("#new_pw2").focus();
	}
    
});

    
  $("#new_pw2").on("keyup focusin",function(){
    var new_pw = $("#new_pw").val();
    var new_pw2 = $("#new_pw2").val();
    
    // 변경할 비밀번호가 공백 또는 널값이 아닐경우엔 비밀번호 재확인은 공백이 되어선 안된다.
    if(new_pw !== "" && new_pw !== null){
        if(new_pw2 === "" || new_pw2 === null){
            $(".pwchk2").text(" ✘ 재확인 비밀번호를 입력해주세요!");
            $(".pwchk2").css("color","red");
            $("#PwDoubleChk2").val("false");
            return; 
        }
    }
    
    // 변경할 비밀번호와 재확인 번호가 같아야한다.
    if (new_pw !== new_pw2 && new_pw2 !== "") {
    $(".pwchk2").text(" ✘ 변경할 비밀번호와 일치하지 않습니다!");
    $(".pwchk2").css("color","red");
    $("#PwDoubleChk2").val("false");
    return;
}
    
    else {
        $(".pwchk2").text("✔");
        $(".pwchk2").css("color","green");
        $("#PwDoubleChk2").val("true");
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
            
            return;
        } else {
            $(".phonechk").text("✔");
            $(".phonechk").css("color", "green");
            $("#PhoneDoubleChk").val("true");
        }
    });
    
    
    // 주소 유효성 검사
    $("#addr2").keyup(function() {
        var addr2 = $("#addr2").val();
       
        if (addr2 === "" || addr2 == null) {
            $(".addrchk").text("✘ 주소를 입력해주세요.");
            $(".addrchk").css("color", "red");
            $("#AddrDoubleChk").val("false");
            
            
        } else {
            $(".addrchk").text("✔");
            $(".addrchk").css("color", "green");
            $("#AddrDoubleChk").val("true");
            $('#nickname').focus();
        }
    });
    
	     // 닉네임 유효성 검사
	     
	$("#new_nick").keyup(function() {
    var nickname = $("#nickname").val();
    var newnick = $("#new_nick").val();
    console.log(newnick);
    // 새 닉네임과 동일한 경우
    if(nickname === newnick) {
       
        $("#NickDoubleChk").val("true");
        return; // 새 닉네임과 동일한 경우는 더 이상 검사하지 않음
    }
    
    // 닉네임 유효성 검사
    if (!/^[a-zA-Z0-9가-힣]{2,8}$/.test(newnick)) {
        $(".nickchk").text("✘ 영대소문자, 숫자, 한글로 2~8자 입력가능.");
        $(".nickchk").css("color", "red");
        $("#NickDoubleChk").val("false");
        return;
    } else {
        // 서버로 닉네임 중복 검사 요청
	       $.ajax({
	    url: 'checknick',
	    type: 'post',
	    cache: false,
	    data: {
	        "nick": newnick  // 변수명 수정
	    },
	    success: function(data) {
	        if (data == "ok") {
	            $(".nickchk").text("✔");
	            $(".nickchk").css("color", "green");
	            $("#NickDoubleChk").val("true");
	        } else {
	            $(".nickchk").text("✘ 사용중인 닉네임");
	            $(".nickchk").css("color", "red");
	            $("#NickDoubleChk").val("false");
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
    
    
    
     
	   // 수정 버튼 클릭 시
	$("#ModyBtn").click(function() {
	    var phoneCheck = $("#PhoneDoubleChk").val();
	    var addrCheck = $("#AddrDoubleChk").val();
	    var nickCheck = $("#NickDoubleChk").val();
	    var pwCheck = $("#PwChk").val();
	    var new_pw = $("#PwDoubleChk").val();
	    var new_pw2 = $("#PwDoubleChk2").val();
	
	    if (pwCheck !== "true") {
	        alert("현재 비밀번호를 확인해주세요.");
	        return;
	    }
	
	    if (new_pw == "false") {
	        alert("변경할 비밀번호를 확인해주세요.");
	        return;
	    }
	
	    if (new_pw2 == "false") {
	        alert("비밀번호 재확인을 확인해주세요!");
	        return;
	    }
	
	    if (phoneCheck == "false") {
	        alert("연락처를 확인해주세요.");
	        return;
	    }
	
	    if (addrCheck === "false") {
	        alert("주소를 확인해주세요.");
	        return;
	    }
	
	    if (nickCheck === "false") {
	        alert("닉네임을 확인해주세요.");
	        return;
	    }
	
	    $("#modyform").submit();
	    alert("회원님의 정보가 수정되었습니다!");
	});
    
});    
	    