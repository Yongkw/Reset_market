<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loding---</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ebca630ea5429ce5a774b8cb02ca2d&libraries=services,clusterer"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div>
<h1 id="ti"></h1>
<br>

<br>
</div>
<script type="text/javascript">
$(document).ready(function() {
	var retu=${returnno};
	
	if(retu==1){
		add();
	}else if(retu==2) {
		dele();
	}else {
		reset();
	}
	
})


function add() {
	console.log('add');
	
}
function dele() {
	console.log('dele');
	
}

function reset(){
    var address =[];
	console.log('reset');
	$.ajax({
        url: 'map_resetjson', // 서버의 엔드포인트 URL
        type: 'POST', // HTTP 메소드
        async	: false,
        success: function(tt){ // 요청 성공 시 실행될 콜백 함수
            console.log(tt); 
            console.log('성공'); // 성공 메시지 출력
            
            var ttt = JSON.parse(tt);
            for(var i in ttt){
            	search(i,ttt[i], function(result) {
            	    address.push({"pr_no":result[0],"lat":result[2],"lng":result[1]});
            	});
            }
            
            
            
            setTimeout(function() {
                resetsend(address,function(){});
        	    console.log(address);
            }, 3000);
            
        },
        error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
            console.error(error); // 에러 메시지를 콘솔에 출력
            console.log('실패'); // 실패 메시지 출력
        }
    });

}
function search(no,addr, callback) {
	
const geocoder = new kakao.maps.services.Geocoder()

geocoder.addressSearch(addr, function(res, stat) {//res에 x값 y값이 들어 있으면 stat은 addr값이 올바른지 확인 ,addr은 주소명
   if (stat === kakao.maps.services.Status.OK) {
          var address = res[0].road_address || res[0].address;
		var result = [no,res[0].x, res[0].y];
		callback(result);
		
   }
   else {
	   callback( [no,"주소찾기실패", "주소찾기실패"]);
	}
});
}


function resetsend(address, callback) {
    $.ajax({
        url: 'map_resetjson2', // 서버의 엔드포인트 URL
        type: 'POST', // HTTP 메소드
        data: JSON.stringify(address), // 배열을 JSON 문자열로 변환하여 전송
        contentType: "application/json",
        success: function() { // 요청 성공 시 실행될 콜백 함수
        	location.replace('main');
        },
        error: function(xhr, status, error) { // 요청 실패 시 실행될 콜백 함수
            console.error('Error:', error); // 에러 메시지 출력
        }
    });
}

</script>
</body>
</html>