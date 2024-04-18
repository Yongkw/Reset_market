<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Stylish&display=swap"
	rel="stylesheet">
<link href="${path}/resources/css/prosale2.css" rel="stylesheet" />
</head>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 카카오 api 맵키 변경 -->
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3adf18570dd37356fee7459e8eef8c6&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    
    
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
    	       imageView = function imageView(att_zone, btn){

    	       var attZone = document.getElementById(att_zone);
    	       var btnAtt = document.getElementById(btn)
    	       var sel_files = [];
    	       
    	       // 이미지와 체크 박스를 감싸고 있는 div 속성
    	       var div_style = 'display:inline-block;position:relative;'
    	                     + 'width:150px;height:140px;margin:5px;border:1px solid #000;';
    	       // 미리보기 이미지 속성
    	       var img_style = 'width:100%;height:100%;';
    	       // 이미지안에 표시되는 체크박스의 속성
    	       var chk_style = 'width:24px;height:30px;position:absolute;font-size:23px;'
    	                     + 'right:0px;top:0px;z-index:999;border:none;color:#000;cursor:pointer;opacity:0.8;line-height:1;';
    	     
    	       btnAtt.onchange = function(e){
    	          var files = e.target.files;
    	           var allFiles = new DataTransfer();

    	           // 기존에 선택된 파일들을 추가
    	           for (var i = 0; i < sel_files.length; i++) {
    	               allFiles.items.add(sel_files[i]);
    	           }

    	           // 새로 선택된 파일들을 추가
    	           for (var i = 0; i < files.length; i++) {
    	               allFiles.items.add(files[i]);
    	           }

    	           // 새로운 FileList를 파일 선택 요소에 설정
    	           btnAtt.files = allFiles.files;

    	           // 선택된 모든 파일들에 대해 미리보기 생성
    	           for(f of files){
    	               imageLoader(f);
    	           }
    	       };

    	       // 탐색기에서 드래그앤 드롭 사용
    	       attZone.addEventListener('dragenter', function(e){
    	         e.preventDefault();
    	         e.stopPropagation();
    	       }, false)
    	       
    	       attZone.addEventListener('dragover', function(e){
    	         e.preventDefault();
    	         e.stopPropagation();
    	         
    	       }, false)
    	     
    	   attZone.addEventListener('drop', function(e){
    	       e.preventDefault();
    	       e.stopPropagation();
    	       var dt = e.dataTransfer;
    	       var files = dt.files;
    	       
    	       var allFiles = new DataTransfer();
    	       for (var i = 0; i < btnAtt.files.length; i++) {
    	           allFiles.items.add(btnAtt.files[i]);
    	       }
    	       for (var i = 0; i < files.length; i++) {
    	           allFiles.items.add(files[i]);
    	       }
    	       
    	       // 새로운 FileList를 파일 선택 요소에 설정
    	       btnAtt.files = allFiles.files;
    	       
    	       
    	       for(f of files){
    	           imageLoader(f);
    	       }
    	   }, false);
    	       

    	       
    	       /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    	       imageLoader = function(file){
    	         sel_files.push(file);
    	         var reader = new FileReader();
    	         reader.onload = function(ee){
    	           let img = document.createElement('img')
    	           img.setAttribute('style', img_style)
    	           img.src = ee.target.result;
    	           attZone.appendChild(makeDiv(img, file));
    	         }
    	         
    	         reader.readAsDataURL(file);
    	       }
    	       
    	       /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    	       makeDiv = function(img, file){
    	         var div = document.createElement('div')
    	         div.setAttribute('style', div_style)
    	         
    	         var btn = document.createElement('input')
    	         btn.setAttribute('type', 'button')
    	         btn.setAttribute('value', 'x')
    	         btn.setAttribute('delFile', file.name);
    	         btn.setAttribute('style', chk_style);
    	         btn.onclick = function(ev){
    	           var ele = ev.srcElement;
    	           var delFile = ele.getAttribute('delFile');
    	           for(var i=0 ;i<sel_files.length; i++){
    	             if(delFile== sel_files[i].name){
    	               sel_files.splice(i, 1);      
    	             }
    	           }
    	           
    	           dt = new DataTransfer();
    	           for(f in sel_files) {
    	             var file = sel_files[f];
    	             dt.items.add(file);
    	           }
    	           btnAtt.files = dt.files;
    	           var p = ele.parentNode;
    	           attZone.removeChild(p)
    	         }
    	         div.appendChild(img)
    	         div.appendChild(btn)
    	         return div
    	       }
    	     }
    	   )('att_zone', 'btnAtt')

    
</script>

<body>
	
		<div class="hmUNzn">
		<form action="productsave" method="post" enctype="multipart/form-data">
			<main class="flimjd">
				<h2 class="fGSdXi">
					기본정보 <span>*필수항목</span>
				</h2>

				<ul class="hcyuoc">
					<li class="iZffvT">
						<div class="dXoRFE">
							상품이미지 <small>(3/12)</small>
						</div>
						<div class="nqDMw">
							<ul class="czzFIC">
								<li class="oHGzg">이미지등록 
								<input type="file"
									accept="image/jpg, image/jpeg, image/png" id="btnAtt"
									multiple='multiple' name="product_image">
								</li>
								<li draggable="false" class="iUgrwC">
									<div id='att_zone' class='att_zone'></div>
								</li>
							</ul>
							<div class="doQsrA">상품 이미지는 PC에서는 1:1 비율로 보여줘요</div>
						</div>
					<li class="iZffvT">
						<div class="fw22">
							상품명
						</div>
						<div class="nqDMw">
							<div class="iIJDsQ">
								<input type="text" placeholder="상품명을 입력해 주세요."
									class="lhjRrq" name ="title" >
							</div>
						</div>
					</li>
					<li class="iZffvT">
						<div class="fw22">
							카테고리 
						</div>
						<div class="nqDMw">
							<div class="bDakqE">
							<div class="kPDVsx">
								<ul class="fAfkpF">
									<li class="btyiVm">
										<button type="button" class="cVEXWs">의류/잡화</button>
									</li>
									<li class="btyiVm">
										<button type="button" class="cVEXWs">가전</button>
									</li>
									<li class="btyiVm">
										<button type="button" class="cVEXWs">홈인테리어</button>
									</li>
									<li class="btyiVm">
										<button type="button" class="cVEXWs">뷰티</button>
									</li>
									<li class="btyiVm">
										<button type="button" class="cVEXWs">등산/캠핑</button>
									</li>
								</ul>
							</div>
								<div class="kPDVsx">
								
									<ul class="fAfkpF" id="test">
									</ul>
								<input id="max_text" type="hidden" value="아무" name="ca_name1">
								<input id="max_text2" type="hidden" value="아무" name="ca_name2">
								</div>
							</div>
							<div  style="ddisplay:flex; align-items: center; justify-content: space-between; margin: 1.5rem;" >
								<h3 class="gMPvsn">선택한 카테고리 : <b></b> </h3>
							</div> 
							<!-- 
     <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 1.5rem;">
        <h3 class="gMPvsn">
           선택한 카테고리 : 
        </h3>
     </div> -->
						</div>
					</li>
					<li class="iZffvT">
						<div class="fw22">
							거래지역
						</div>
						<div class="nqDMw">
							<div>
								<button type="button" class="gWFJMk">내위치</button>
								<button type="button" class="gWFJMk">최근지역</button>
								<input class="gWFJMk" type="button"
									onclick="sample5_execDaumPostcode()" value="주소검색">
							</div>

							<input type="text" id="sample5_address" placeholder="주소"
								class="kFOKFl" name = "location">
							<div id="map"
								style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
						</div>
					</li>
					<li class="iZffvT">
						<div class="fw22">
							가격 
						</div>
						<div class="nqDMw">
							<div class="cYrISD">
								<input name="price" type="text" placeholder="가격을 입력해 주세요" class="gZdwcQ"
									value> <span>원</span>
							</div>
						</div>
					</li>

					<li class="iZffvT">
						<div class="fw22">
							설명
						</div>
						<div class="nqDMw">
							<textarea rows="6" class="gQnFKF" oninput="hideDivContent(this)" name="detail"></textarea>
							<div class="fmzTHs" style="pointer-events : none;">
								구매시기, 브랜드/모델명, 제품의 상태 (사용감, 하자 유무) 등을 입력해주세여 <br> 서로가 믿고
								거래할 수 있도록, 자세한 정보와 다양한 각도의 상품 사진을 올려주세요<br> <span>*안전하고
									건전한 거래 환경을 위해 과학기술정보통신부, 한국인터넷진흥원과 리셋마켓와 함께합니다.</span>
							</div>
						</div>
					</li>
				</ul>
			</main>

		
				<div class="hDtjVn">
					<input type="submit" value="등록하기" class="fbBXvz"> 
					<input type="reset" value="취소하기" class="eQoStg">

				</div>

			</form>
		</div>
	
	<script type="text/javascript">
 //텍스트에 값넣을때 div값 사라지게하는 기능
 function hideDivContent(textarea) {
     var divContent = textarea.nextElementSibling; // textarea 다음에 있는 div 요소를 가져옴
     divContent.style.display = textarea.value.trim() ? 'none' : 'block'; // textarea에 값이 있으면 div를 숨기고, 없으면 보이게 함
 }
 
 //이미지 관련 스크립트
 var sel_files = []; // 이미지 파일을 담을 배열을 정의하고 초기화합니다.

 // 이미지를 미리보기할 위치를 정의한 함수
 function makeDiv(img, file) {
     var div = document.createElement('div');
     div.setAttribute('style', 'width: 202px; height: 202px; margin-right: 1rem; border: 1px solid rgb(178, 178, 178); display: inline-block; position: relative;');

     var btn = document.createElement('input');
     btn.setAttribute('type', 'button');
     btn.setAttribute('value', 'x');
     btn.setAttribute('delFile', file.name);
     btn.setAttribute('style', 'width: 24px; height: 30px; position: absolute; font-size: 23px; right: 0px; top: 0px; z-index: 999; border: none; color: #000; cursor: pointer; opacity: 0.8; line-height: 1;');
     btn.onclick = function(ev){
         var ele = ev.target;
         var delFile = ele.getAttribute('delFile');

         // sel_files 배열에서 삭제할 파일을 찾아 제거합니다.
         for(var i=0 ;i<sel_files.length; i++){
             if(delFile == sel_files[i].name){
                 sel_files.splice(i, 1);
                 break; // 해당 파일을 찾으면 더 이상 반복하지 않도록 중단합니다.
             }
         }

         var dt = new DataTransfer();
         for(var f in sel_files) {
             var file = sel_files[f];
             dt.items.add(file);
         }
         btnAtt.files = dt.files;
         var p = ele.parentNode;
         p.parentNode.removeChild(p);
     };
     div.appendChild(img);
     div.appendChild(btn);
     return div;
 }

 // 이미지 미리보기 함수
 var imageView = function(att_zone, btn) {
     var attZone = document.getElementById(att_zone);
     var btnAtt = document.getElementById(btn);

     btnAtt.onchange = function(e) {
         var files = e.target.files;

         for (var f of files) {
             imageLoader(f);
         }
     };

     attZone.addEventListener('drop', function(e) {
         e.preventDefault();
         e.stopPropagation();
         var dt = e.dataTransfer;
         var files = dt.files;

         for (var f of files) {
             imageLoader(f);
         }
     }, false);

     var imageLoader = function(file) {
         var reader = new FileReader();
         reader.onload = function(ee) {
             var img = document.createElement('img');
             img.setAttribute('style', 'width: 100%; height: 100%;');
             img.src = ee.target.result;

             // 이미지를 attZone 요소에 추가
             attZone.appendChild(makeDiv(img, file));
             sel_files.push(file); // 이미지 파일을 배열에 추가합니다.
         };

         reader.readAsDataURL(file);
     };
 };

 imageView('att_zone', 'btnAtt');
 
 //카테고리 스크립트부분..
 
 $(document).ready(function(){
    var id_check;
    var class_check;
    var val_check ;
    
    $(document).on("click", ".cVEXWs", function(){
        val_check = $(this).text(); //값
        var kateb_list = [];
        kateb_list = addlist(val_check); // val값, 저장값 참조 하여 리스트를 가져옴
        kate_list_add(kateb_list);//리스트 매개변수
       	$("#max_text").val(val_check);
        
    });
    
    function addlist(val_check) {
        var kateb_list = [];
        if(val_check=="의류/잡화"){
            kateb_list.push('여성의류');
            kateb_list.push('남성의류');
            kateb_list.push('패션잡화');
            kateb_list.push('명품/브랜드');
            kateb_list.push('기타의류/잡화');
        }
        else if(val_check=="가전"){
            kateb_list.push('스마트폰/태블릿');
            kateb_list.push('노트북/PC');
            kateb_list.push('주방가구/기기');
            kateb_list.push('티비/영상가전');
            kateb_list.push('냉장고/세탁기/건조기');
        }
        else if(val_check=="홈인테리어"){
            kateb_list.push('가구');
            kateb_list.push('홈데코');
            kateb_list.push('수납/정리');
            kateb_list.push('침구');
            kateb_list.push('커튼/블라인드');
        }
        else if(val_check=="뷰티"){
            kateb_list.push('스킨케어');
            kateb_list.push('클렌징/필링');
            kateb_list.push('메이크업');
            kateb_list.push('향수');
            kateb_list.push('남성화장품');
        }
        else{
            kateb_list.push('등산/캠핑');
            kateb_list.push('낚시/낚시용품');
            kateb_list.push('자전거/킥보드');
            kateb_list.push('기타 스포츠/레저용품');
        }
        return kateb_list;
     }
       
    function kate_list_add(kateb_list){
        var kate_list = $("#test");
        kate_list.empty(); // 기존에 남아있는 리스트를 삭제
        $("#max_text2").val("");
        for(var i in kateb_list){
            kate_list.append("<li class='btyiVm'><button type='button' class='cVEXWs2' value='" + kateb_list[i] + "'>" + kateb_list[i] + "</button></li>");//리스트추가
        }
    }
    
    
}); 
 
$(document).on("click",".cVEXWs2",function(){

		var text_ca = $(this).val();
		$("#max_text2").val(text_ca);
		var max_text = $("#max_text").val();
		
	});

$(document).on("click", ".cVEXWs", function(){
    var selectedCategory = $(this).text(); // 선택한 카테고리 텍스트 가져오기
    $("#max_text").val(selectedCategory); // hidden input에 선택한 카테고리 저장
    
    // 선택한 카테고리 표시하기
    $(".gMPvsn b").text(selectedCategory);
});

$(document).on("click", ".cVEXWs2", function(){
    var selectedSubCategory = $(this).text(); // 선택한 서브 카테고리 텍스트 가져오기
    var selectedCategory = $("#max_text").val(); // 선택한 메인 카테고리 텍스트 가져오기
    var fullCategory = selectedCategory + " > " + selectedSubCategory; // 전체 카테고리 텍스트 생성
    
    $("#max_text2").val(selectedSubCategory); // hidden input에 선택한 서브 카테고리 저장
    
    // 선택한 카테고리 표시하기
    $(".gMPvsn b").text(fullCategory);
});
  
   
   
 
 
	</script>

</body>
</html>