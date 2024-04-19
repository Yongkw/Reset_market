$(document).ready(function(){
	
	 // 모달 열릴 때 이벤트
    $('#resignModal').on('show.bs.modal', function () {
        // 마이페이지 수정 폼의 이벤트 핸들러 비활성화
        $(".modyform").off("submit");
        // 현재 비밀번호 입력 필드의 require 속성 제거
        $("#nowpw").prop("required", false);
    });
    
    // 회원탈퇴 버튼 클릭 시 이벤트
    $("#memberdel").click(function(){
        // 현재 비밀번호 입력 필드의 require 속성 제거 
         
        $("#nowpw").prop("required", false);
    });

    // 회원탈퇴 모달 숨김 시 이벤트
    $('#resignModal').on('hide.bs.modal', function () {
        // 현재 비밀번호 입력 필드의 require 속성 다시 적용
        $("#nowpw").prop("required", true);
    });


	$("#rs_pw").keyup(function(){
		var pw= $("#rs_pw").val();
		var member_pw = $("#ch_pw").val();
		console.log(member_pw);
		// 회원탈퇴 비밀번호 확인이 공백이거나 비어있는 상황!
		if(pw === "" || pw == null){
			$(".pwchk").text("비밀번호를 입력해주세요!");
			$(".pwchk").css("color","red");
			$("#pwst").val("false");
			return;
		}
		
		else if(pw !== member_pw)
		{
			$(".pwchk").text("비밀번호가 일치 하지 않습니다!");
			$(".pwchk").css("color","red");
			$("#pwst").val("false");
			return;
		
		}
		
		else
		{
			$(".pwchk").text("비밀번호가 일치합니다");
			$(".pwchk").css("color","green");
			$("#pwst").val("true");
			return;	
		}
		
	});
	
	
	//확인 버튼 클릭 시 

	$(".rsBtn").click(function(){
		
		var pw = $("#pwst").val();	
		
		if (pw !== "true"){
			alert("비밀번호를 확인해주세요!");
			return false;
		}
		
		var resignok = confirm("정말로 탈퇴 하시겠습니까?");
		if(resignok)
		{
			
			alert("탈퇴 완료! 이용해주셔서 감사합니다!");
			$(".rsform").submit();
			console.log(1);
			//window.location.href="/market/main_view";
						
		}
		else
		{
			alert("탈퇴가 취소 되었습니다");
			window.location.href="/market/myinfo";
			return false;
		}
			
		
	});
	
	

});