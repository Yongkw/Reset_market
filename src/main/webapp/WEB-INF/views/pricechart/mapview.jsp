<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72ebca630ea5429ce5a774b8cb02ca2d&libraries=services,clusterer"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<div style="width:70%; border: solid gray 1ex; margin: 0 auto;position: relative; display: flex; flex-direction: column; align-items : center;" >

<div id="map" style="width:500px;height:400px;"></div>


<input type="text" id="searchadd" value="수원역"  ><input type="button" value="검색" onclick="searchadd()">
</div>
<script>

function searchadd(){
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var searchaddress = $('#searchadd').val();
console.log(searchaddress);
// 주소로 좌표를 검색합니다
geocoder.addressSearch(searchaddress, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"> 위치 값 </div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
}

var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
    level : 14 // 지도의 확대 레벨 
});

// 마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 10, // 클러스터 할 최소 지도 레벨 
    calculator: [5, 30, 50], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다
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

$.get("./resources/mapaddress.json", function(data) {
	
   
    var markers = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
        	position : new kakao.maps.LatLng(position.lat, position.lng)
        });
    });
    clusterer.addMarkers(markers);
});

</script>
</body>
</html>