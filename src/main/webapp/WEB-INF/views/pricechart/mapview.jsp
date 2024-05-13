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
a{color: black
}
a:hover{	
text-decoration:none;
}
#map_productlist{
overflow: auto;
width: 100%;
height: 100%;
position: relative;
display: flex;
flex-wrap: wrap;
}
.findprduct{
	width: 95%;
	height: 80px;
	margin: 5px auto;
}
.findprduct td:not(td[rowspan]){
padding-left: 5px;
}
.map_productlist::-webkit-scrollbar {
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

.map_container{
 width:30%;height:600px;
 display: flex;
 flex-direction: column;
 justify-content: center; 
 align-items:center;
 
 background-color: #dcdcdc;
 border-left: 1ex solid gray;
}
#listcount{
width:85%;
height:40px;
margin: 0 auto;
}
#listcount>span{
width:35%;
height:40px;
padding-right:50px;
padding-left:50px;
padding-top:15px;
float: left;
}
#listcount h3{
color: gray;
margin : 0ex;
float:left;
	
}
#listcount h3:last-child{
float:right;
}
.pr_list{
width: 196px;
margin-right: 11px;
margin-bottom: 11px; 
border: 1px solid rgb(238, 238, 238);
background: rgb(255, 255, 255);
}
.pr_list *{
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}
.pr_list>a>div:last-child{
padding:  8px;
white-space: nowrap;
overflow: hidden;
}
.pr_list>a>div>div:last-child{
padding-top: 20px;
display: flex;
justify-content: space-between;
width: 100%;
}
.pr_list>a>div>div>p{
	font-size: 16px;
	font-weight: 600;
	text-overflow: ellipsis;
	overflow: hidden;
	margin: 0;
}
.pr_list>a>div>div>p:after{
content: " 원";
}
.pr_list>a>div>div>span{
font-size: 12px;
color: rgb(136, 136, 136);
}

/*상세 클릭*/
#product_show{
width:98%; height:84%;
padding-top: 10px;
padding-left: 5px; 
overflow: visible;
border-radius:5px;
background-color: white;
}
#product_show>a>div:first-child{
width: 70%;
height: 50%;
margin:0 auto;
display:flex;
overflow: hidden;
}
#product_show>a>div:last-child{
width: 90%;
height: 50%;
margin:0 auto;
display:flex;
flex-direction: column; 
}
#product_show img{
align-self:center;
max-width:80%;
max-height:90%;
margin: 0 auto;
background-color: gray;
}
#product_show hr{
margin-top: 10px;
margin-bottom: 10px;
}
#product_show p{
	margin: 0 0 0 15px; 
}
#product_show p:hover{
	border: none; 
}
#product_show span {
	width:60%;
	display: flex;
	justify-content: space-between;
	white-space : nowrap;
	overflow: visible;
}

#product_show span p {
	color: gray;
}

#product_show span p:after {
	content:"|";
	color: #dcdcdc !important;
}
#product_show span ~ p{color: gray; margin-top: 5px;margin-left: 10px;}
#product_show span ~ p:before{content: "*";}

#product_show div>p:first-child{
	font-size: xx-large;
}
#product_show div>p:first-child+p{
font-size: x-large;
}

/* 검색창 */
#map-searchbar{
 width:70%;  
 height:5%; 
 overflow:visible ; 
 padding: 5 15 5 15px;
 position: absolute; 
 z-index: 97;
 display: flex;
 justify-content: flex-end;
}
#map-searchbar>div{
 background: white;
}

#map-searchbar input{
 height: 100%;
}
</style>
</head>
<body>
<div style="width:85%;margin: 0 auto;" ><h2>등록된 물품 거래지역 지도로 보기</h2></div>
<div style="width:85%;margin: 0 auto; border: solid gray 1ex; border-radius:5px; position: relative; display: flex; " >
<div id="map" style="width:70%;height:600px;position: relative; z-index: 95;"></div>

	<div id="map-searchbar">
	<div>
		<input type="number" min="1" max="14" value="7" id="maplevel" style="width: 45px;" >
		<input type="text" id="searchadd"   onkeypress="searchaddr(event)">
		<input type="button" value="검색" onclick="searchadd()" >
	</div> 
	</div>
<div class="map_container" >
	<div id="product_show">
		<div style="position: relative; left:50%;top:50%; transform: translate(-50%, -50%); width: 140px; height: 40px;"><h2 style="color: gray; margin: 0 auto;">상품 정보</h2></div>
	</div>
</div>
</div>
<div id="listcount"><span>
<h3 >검색상품 목록</h3><h3 id="prnomber"> 0개 </h3></span></div>
<hr style="width:85%;margin: 5px auto;">
<div id="map_productlist" style="width:70%;margin: 0 auto; padding-top: 30px;">
</div>
<script>
var markercodeset = [];
console.log(markercodeset);
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
	productsearch(mouseEvent.latLng);
	
});	

$.ajax({
    url: 'getdata', // 서버의 엔드포인트 URL
    type: 'POST', // HTTP 메소드
    dataType : 'json',
    traditional: true,
    success: function(jdata){

		for(var i in jdata){
		addresschange(jdata[i].pr_no,jdata[i].location, function(result) {
			codetoaddress(result,function(retu){
				var	setter = new Object();
				setter.pr_no=retu[0];
				setter.code=retu[3];
				markercodeset.push(setter);
    			var lat = retu[2];//좌표2	
    			var lng = retu[1];//좌표1
    			var marker = new kakao.maps.Marker({
    	        	position : new kakao.maps.LatLng(lat, lng),
    	        	clickable:true
    	        });
    	        kakao.maps.event.addListener(marker, 'click', eventadd(retu[0]));
    	        
    	        clusterer.addMarker(marker);
    		});
    	});
	}
	},
    error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
        console.error(error); // 에러 메시지를 콘솔에 출력
        console.log('실패'); // 실패 메시지 출력
    }
});

function eventadd(pr_no) {
	return function() {
		showpr(pr_no);
		console.log(pr_no);
    };
}

});

$(document).on('keypress', '#searchadd',function () {//input text 앤터 처리
	if (event.keyCode === 13) { 
        searchadd();
    }
});

function searchadd(){
var searchaddress = $('#searchadd').val();
console.log(searchaddress+"검색");
// 주소로 좌표를 검색합니다
geocoder.addressSearch(searchaddress, function(result, status) { 
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        map.setCenter(coords);//지도 좌표 중앙으로 이동
        productsearch(coords);
    } 
});
}

function productsearch(coords){//좌표를 지역코드 혹은 도로명 으로 변환
	var callback2 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        productlist(result[0].code);
	        $('#searchadd').val((result[0].address_name).substr(0,(result[0].address_name).indexOf(' ')))
	    }
	};
	geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback2);
}



function productlist(find_code) {
	//목표 : 지역 코드로 검색상품을 구분하고 상품넘버를 컨트롤로 보낸후 리스트 목록 값을 받은후 추가 시킨다.
	var productdiv = $('#map_productlist');
    const d1 = document.getElementById('map_productlist');
	var prnolist =[];
	//$.get("./resources/mapaddress.json", function(data) {
	      $.each(markercodeset, function(i, jdata) {//반복문
	    	  if(find_code.substr(0,2)==jdata.code.substr(0,2)){
		    	  prnolist.push(jdata.pr_no);
	    	  }
	    		  
	      });
	      $.ajax({
	    	    url: 'map_productlist', // 서버의 엔드포인트 URL
	    	    type: 'POST', // HTTP 메소드
	    	    data: {'prnolist':prnolist},
	    	    dataType : 'json',
	    	    traditional: true,
	    	    success: function(data){ // 요청 성공 시 실행될 콜백 함수
	    	        productdiv.empty();
	    	       $('#prnomber').text(data.length+"개");
	    	        for(var i in data){
						d1.insertAdjacentHTML('afterbegin','<div class="pr_list">'
														+'<a href="productout?product_no='+data[i].product_no+'" >'
														+'<div class="pr_img">'
														+'<img alt="" src="./image/'+data[i].img1+'" width="194" height="194">'
														+'</div>'
														+'<div>'
														+'<div>'+data[i].title+'</div>'
														+'<div><p>'+data[i].price+'</p><span>3일전</span></div>'
														+'</div></a></div>'
														);
							    	        		};
								    	        	//category_name  location  price img1 product_no  title  view_cnt 
	    	    },
	    	    error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
	    	        console.error(error); // 에러 메시지를 콘솔에 출력
	    	        console.log('실패'); // 실패 메시지 출력
	    	        productdiv.empty();
		    	       $('#prnomber').text("0개");
	    	        
	    	    }
	    	});

	 }
function showpr(pr_no) {
	var productdiv2 = $('#product_show');
    const d2 = document.getElementById('product_show');
	var prnolist =[];
	$.ajax({
	    url: 'findproduct_prno', // 서버의 엔드포인트 URL
	    type: 'POST', // HTTP 메소드
	    data: {'pr_no':pr_no},
	    dataType : 'json',
	    traditional: true,
	    success: function(data){
	    	productdiv2.empty();
	    	d2.insertAdjacentHTML('afterbegin','<a href="productout?product_no='+data[0].product_no+'" >'
	    	+'<div><img alt="" src="./image/'+data[0].img1+'"> </div>'
	    	+'<div>'
	    	+'<p>'+data[0].title+'</p>'
	    	+'<p>'+data[0].price+' 원</p>'
	    	+'<hr>'
	    	+'<span><p>조회수'+data[0].view_cnt+'</p><p>등록 날자</p></span>'
	    	+'<p>상품 상태 </p>'
	    	+'<p>거래 지역 '+data[0].location+'</p>'
	    	+'<p>카테 고리 '+data[0].category_name+'</p>'
	    	+'</div>'
	    	+'</a>'
	    	
	    	);
	    	//category_name  location  price img1 product_no  title  view_cnt 
	    },
	    error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
	        console.error(error); // 에러 메시지를 콘솔에 출력
	        console.log('실패'); // 실패 메시지 출력
	        
	    }
	});
	
}

function codetoaddress(result2,callback){// 좌표 -> 지역코드
	var callback2 = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var retu = [result2[0],result2[1],result2[2],result[0].code];
	        callback(retu);
	    }
	};
	geocoder.coord2RegionCode(result2[1], result2[2], callback2);
}

function addresschange(no,addr, callback) { // 주소 -> 좌표
	
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


// 추가 해야 할것 마커 클릭이벤트 - 주소 혹은 클릭시 그지역 거래품 리스트로 나오기
</script>
</body>
</html>