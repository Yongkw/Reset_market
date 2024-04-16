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
<div style="display: flex; align-items: center; justify-content: center;" >
<h1 id="ti">
<div id="resetmap" style=" display: none; width: 0px; height: 0px; " ></div>
</h1>
<br>
<h2> 상품목록 지도 리셋중 3초만 기다려 주세요</h2>
<br>
</div>
<script type="text/javascript">

var map = new kakao.maps.Map(document.getElementById('resetmap'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.2635846787744, 127.028715898311), // 지도의 중심좌표 
    level : 1 // 지도의 확대 레벨 
});
var geocoder = new kakao.maps.services.Geocoder();
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
            		productsearch(result,function(retu){
            			console.log(retu);
            	    	address.push({"pr_no":retu[0],"lat":retu[2],"lng":retu[1],"code":retu[3]});
            		});
            	});
            }
            
            setTimeout(function() {
                resetsend(address,function(){});
            }, 3000);
            
        },
        error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
            console.error(error); // 에러 메시지를 콘솔에 출력
            console.log('실패'); // 실패 메시지 출력
        }
    });

}

function productsearch(result2,callback){
	var callback2 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var retu = [result2[0],result2[1],result2[2],result[0].code];
	        callback(retu);
	    }
	};
	geocoder.coord2RegionCode(result2[1], result2[2], callback2);
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