<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ebca630ea5429ce5a774b8cb02ca2d&libraries=services,clusterer"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
#map_prodectlist{
overflow: auto;
width: 100%;
height: 100%;
}
.findprduct{
margin-top:5px;
	width: 100%;
	height: 80px;
	border: 1px solid black;
}
.findprduct td:not(td[rowspan]){
padding-left: 5px;
}
.map_prodectlist::-webkit-scrollbar {
    display: none; 
}
.findprduct img{
	width: 100%;
	height: 100%;
}
td[rowspan]{
width: 20%;
height: 80px;
}

.findprduct
</style>
</head>
<body>
<div style="width:85%;margin: 0 auto;" ><h2>등록된 물품 거래지역 지도로 보기</h2></div>
<div style="width:85%; border: solid gray 1ex; margin: 0 auto;position: relative; display: flex; " >
<div id="map" style="width:70%;height:400px;"></div>
<div style="width:30%;height:400px; display: flex;flex-direction: column; border-left: 1ex solid gray; align-content: space-around;">
	<div style=" width:100%;  height:15%; overflow:auto ; margin-top: 15px; margin-left: 5px; ">
		<input type="number" min="1" max="14" value="7" id="maplevel" style="width: 45px;" >
		<input type="text" id="searchadd"   onkeypress="searchaddr(event)">
		<input type="button" value="검색" onclick="searchadd()" > 
	</div>
	<div style="display: flex; flex-direction:column; width:100%;  height: 10%; margin-left: 5px;" >
		<!--  추가 클릭시 될 내용 -->
		<h3 style="font: bold; color: gray; margin : 0ex;" >상품 목록</h3>
		<hr style=" margin: 5px; "  >
	</div>
		<div id="map_prodectlist">
		
		</div>
</div>
</div>
<script>

var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(37.2635846787744, 127.028715898311), // 지도의 중심좌표 
    level : $('#maplevel').val() // 지도의 확대 레벨 
});
var geocoder = new kakao.maps.services.Geocoder();
//주소-좌표 변환 객체를 생성합니다

$(document).ready(function() {

// 지도 생성
var i =$("#maplevel");
$("#map").bind('wheel', function(event){
	i.val(map.getLevel());
});

i.change(function(){
	var a =$(this).val();
	map.setLevel(a);
	console.log(a);
});

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 5, // 클러스터 할 최소 지도 레벨 
    calculator: [5, 21, 41], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다
    texts: getTexts, // 표시 숫자당 할 것 
    styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
            width : '30px', height : '30px',
            background: '#87CEFA',
            borderRadius: '15px',  //원 둥굴기 
            color: '#000',  //폰트 컬러
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '31px'
        },
        {
            width : '40px', height : '40px',
            background: '#00FA9A',
            borderRadius: '20px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '41px'
        },
        {
            width : '50px', height : '50px',
            background: 'rgba(255, 51, 204, .8)',
            borderRadius: '25px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '51px'
        },
        {
            width : '60px', height : '60px',
            background: 'rgba(255, 80, 80, .8)',
            borderRadius: '30px',
            color: '#000',
            textAlign: 'center',
            fontWeight: 'bold',
            lineHeight: '61px'
        }
    ]
});
function getTexts( count ) {

  return count;
}

// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
	console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
});	
$.get("./resources/mapaddress.json", function(data) {
   
    var markers = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
        	position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });
    clusterer.addMarkers(markers);
});

});


$(document).on('keypress', '#searchadd',function () {//input text 앤터 처리
	if (event.keyCode === 13) { 
        searchadd();
    }
});

function searchadd(){
var searchaddress = $('#searchadd').val();
console.log(searchaddress+"검색 ");
// 주소로 좌표를 검색합니다
geocoder.addressSearch(searchaddress, function(result, status) { 
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        map.setCenter(coords);
        productsearch(coords);
    } 
});
}

function productsearch(coords){
	var callback2 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        productlist(result[0].code);
	    }
	};
	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback2);
}



function productlist(find_code) {
	//목표 : 지역 코드로 검색상품을 구분하고 상품넘버를 컨트롤로 보낸후 리스트 목록 값을 받은후 추가 시킨다.
	var productdiv = $('#map_prodectlist');
    const d1 = document.getElementById('map_prodectlist');
	var prnolist =[];
	
	$.get("./resources/mapaddress.json", function(data) {
		console.log(find_code);
	      $.each(data.positions, function(i, jdata) {
	    	  if(find_code.substr(0,2)==jdata.code.substr(0,2))
	    		  
	    	  prnolist.push(jdata.pr_no);
	      });
	      console.log(prnolist);
	      $.ajax({
	    	    url: 'map_productlist', // 서버의 엔드포인트 URL
	    	    type: 'POST', // HTTP 메소드
	    	    data: {'prnolist':prnolist},
	    	    dataType : 'json',
	    	    traditional: true,
	    	    success: function(data){ // 요청 성공 시 실행될 콜백 함수
	    	        console.log(data); // 성공 메시지 출력
	    	        productdiv.empty();
	    	        for(var i in data){
	    	        	d1.insertAdjacentHTML('afterbegin','<table class="findprduct" border="1" >'
	    	        			+'<tr><td rowspan="3" ><img src="./image/'+data[i].img1+'"></td><td colspan="2">'+data[i].title+'</td></tr>'
	    	        			+'<tr><td colspan="1"style="width: 80%;" >'+data[i].category_name+'</td><td>가격 : '+data[i].price+'원</td></tr>'
	    	        			+'<tr><td colspan="1" style="overflow: hidden;"  >'+data[i].location+'</td><td>'+data[i].view_cnt+'</td></tr>'
	    	        			+'</table>');
	    	        	//category_name  location  price img1 product_no  title  view_cnt 
	    	        	console.log(data[i].title+" : "+data[i].img1)
	    	        		};
	    	    },
	    	    error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
	    	        console.error(error); // 에러 메시지를 콘솔에 출력
	    	        console.log('실패'); // 실패 메시지 출력
	    	        
	    	    }
	    	});

	  });
	 }


// 추가 해야 할것 마커 클릭이벤트 - 주소 혹은 클릭시 그지역 거래품 리스트로 나오기
</script>
</body>
</html>