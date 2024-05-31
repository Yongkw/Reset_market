	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<link href="${path}/resources/css/promypage.css" rel="stylesheet" /> 
<head>
<style type="text/css">
	.gxbdui { 									/* 프로필 사진 뒷배경..*/
	position: absolute;
	background-size: cover;
	background-repeat: no-repeat;
	z-index: 0;
	width: 106%;
	height: 106%;
	top: -3%;
	left: -3%;
	filter: brightness(0.5) blur(10px);
	background-image: url(./image/${member.profile_image});
}
</style>
<meta charset="UTF-8">
<!-- css 적용 -->
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
function handleClick(event) {
    var parentDiv = event.target.parentNode.parentNode;
    var children = parentDiv.children;

    for (var i = 0; i < children.length; i++) {
        children[i].classList.remove('kHfkPy');
        children[i].classList.add('gmerZt');
        children[i].classList.add('fAFdHw');
    }

    event.target.classList.remove('fAFdHw');
    event.target.classList.remove('gmerZt');
    event.target.classList.add('kHfkPy');
}

$(document).ready(function(){
    $('.gmerZt').click(function(){
        $('.gmerZt').removeClass('kHfkPy');
        $(this).addClass('kHfkPy');
        // 해당하는 내용을 나타내는 코드를 작성해야 합니다.
    });
});

$(document).ready(function(){
    $('.kHfkPy').first().css('border-left', '1px solid rgb(33, 33, 33)');
});


$(document).ready(function(){
    // gyBPuj 요소를 클릭했을 때 실행됩니다.
    $('.gyBPuj').click(function(){
        // gaDwcW 요소를 토글합니다.
        $(this).siblings('.gaDwcW').toggle();
    });

    // gaDwcW 내부의 a 요소를 클릭했을 때 실행됩니다.
    $('.gaDwcW a').click(function(){
        // 클릭한 요소의 텍스트를 가져옵니다.
        var selectedText = $(this).text();
        // 모든 gaDwcW a 요소의 색상을 초기화합니다.
        $('.gaDwcW a').css('color', '');
        // 클릭한 요소의 색상을 빨간색으로 설정합니다.
        $(this).css('color', 'red');
        // gyBPuj 요소의 텍스트를 설정하고 이미지를 유지합니다.
        $('.gyBPuj').html(selectedText + ' <img src="https://m.bunjang.co.kr/pc-static/resource/9b606ef2e7d57fafa657.png" width="10" height="6">');
        // gaDwcW 요소를 숨깁니다.
        $(this).closest('.gaDwcW').hide();
    });

    // 문서의 다른 곳을 클릭했을 때 실행됩니다.
    $(document).click(function(event){
        // 클릭한 요소가 gyBPuj 또는 gaDwcW의 자식 요소가 아닌 경우 gaDwcW를 숨깁니다.
        if (!$(event.target).closest('.gyBPuj').length && !$(event.target).closest('.gaDwcW').length) {
            $('.gaDwcW').hide();
        }
    }); 
});


$(document).ready(function() {	
    // test1 클래스를 가진 요소에 대해 클릭 이벤트를 추가합니다.
    $('.test1').click(function(event) {
        // test1_1 요소에 gbNMxu 클래스를 추가합니다.
        $('.test1_1').addClass('gbNMxu');

        // test1 이외의 클래스에서 gbNMxu 클래스를 제거합니다.
        $('.test2_1, .test3_1, .test4_1').removeClass('gbNMxu');

        // 클릭된 요소의 href 속성이 '#'이 아니면 기본 동작을 막습니다.
        if ($(this).attr('href') !== '#') {
            event.preventDefault();
        }
    });

    // test2 클래스를 가진 요소에 대해 클릭 이벤트를 추가합니다.
    $('.test2').click(function(event) {
        // test2_1 요소에 gbNMxu 클래스를 추가합니다.
        $('.test2_1').addClass('gbNMxu');

        // test2 이외의 클래스에서 gbNMxu 클래스를 제거합니다.
        $('.test1_1, .test3_1, .test4_1').removeClass('gbNMxu');

        if ($(this).attr('href') !== '#') {
            event.preventDefault();
        }
    });

    // test3 클래스를 가진 요소에 대해 클릭 이벤트를 추가합니다.
    $('.test3').click(function(event) {
        // test3_1 요소에 gbNMxu 클래스를 추가합니다.
        $('.test3_1').addClass('gbNMxu');

        // test3 이외의 클래스에서 gbNMxu 클래스를 제거합니다.
        $('.test1_1, .test2_1, .test4_1').removeClass('gbNMxu');

        if ($(this).attr('href') !== '#') {
            event.preventDefault();
        }
    });

    // test4 클래스를 가진 요소에 대해 클릭 이벤트를 추가합니다.
    $('.test4').click(function(event) {
        // test4_1 요소에 gbNMxu 클래스를 추가합니다.
        $('.test4_1').addClass('gbNMxu');

        // test4 이외의 클래스에서 gbNMxu 클래스를 제거합니다.
        $('.test1_1, .test2_1, .test3_1').removeClass('gbNMxu');

        if ($(this).attr('href') !== '#') {
            event.preventDefault();
        }
    });
});

function itropen(){ //수정버튼 클릭시 수정버튼 none
	
    document.getElementById('itrmodi').style.display = "none";
    document.getElementById('txtop').style.display = "";

}

$(document).ready(function(){
var seller_id = $("#seller_id").val(); 




// 거래항목별 클릭 기능... 전체 상품, 거래중인 상품, 판매중인 상품, 판매완료한 상품..
   $(".cmPcYP").click(function() {
   	var state = $(this).text();    
   	console.log("받아온 값"+state);
   	$('#allc').text(state);
       $.ajax({
           url: "sort",
           type: "post",
           data: {"seller_id": seller_id, "state": state},
           dataType: "json",
           success: function(data) {
               console.log("거래중 값 데이터: ", data);
               updateProductList(data);
               
               $('#ct').text(data.length+' 개');
               
           },
           error: function(xhr, status, error) {
               console.error("에러 발생: ", status, error);
               $('.gOrNhR').text('0 개'); // 에러 발생 시 0개로 설정
           }
       });
       
   });


  

	
   function updateProductList(data) {
       var productList = $("#product-list");
       productList.empty(); // 기존 리스트를 비움
       $("#new").click(function() {
           // 데이터를 최신 순으로 정렬
           data.sort(function(a, b) {
               return new Date(b.update_at) - new Date(a.update_at);
               
           });

           // 최신순으로 정렬된 데이터를 화면에 표시
           updateProductList(data);
       });
       //고가순
       $("#prdesc").click(function() {
           // 데이터를 최신 순으로 정렬
           data.sort(function(a, b) {
           	return b.price - a.price;
           	 
           });

           // 고가순으로 정렬된 데이터를 화면에 표시
           updateProductList(data);
       });
       
       //저가순
       $("#prasc").click(function() {
           // 데이터를 최신 순으로 정렬
           data.sort(function(a, b) {
           	return a.price - b.price;
           	
           });

           // 저가순으로 정렬된 데이터를 화면에 표시
           updateProductList(data);
       });
       
       data.forEach(function(item) {
       	console.log(item.price);
       	console.log(item.product_image);
           var productHtml = ""+
           '<div class="dhgZke" id="product-list">'+
           '<div class="bfphSx">' +
           '<a class="isOWuA" href="productout?product_no=' + item.product_no + '&title=' + item.title + '">' +
               '<input type="hidden" value="' + item.seller_id + '" name="' + item.seller_id + '" id="' + item.seller_id + '">' +
               '<div class="bkngsY">' +
                   '<img src="./image/'+ item.product_image +'" width="194" height="194">' +
               '</div>' +
               '<div class="bJpTlV">' +
                   '<div class="gstNkb">'+item.title+'</div>' +
                   '<div class="cxNmps">' +
                       '<div class="heqdJ">'+ item.price +'</div>' +
                       '<div class="elSbmF"><span> '+item.period +'</span></div>' +
                   '</div>' +
               '</div>' +
               '<div class="esiKrh">' +
                   '<img src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">&nbsp'+item.location+'</div>' +
           '</a>' +
       '</div>'+'</div>';
       
       
       
       

           productList.append(productHtml);
       });
   }
    
   $(".ffPLQP, .dMXLDX").click(function() {
       // 모든 링크의 색상을 검은색으로 변경
       $(".ffPLQP, .dMXLDX").css("color", "black");
       
       // 클릭한 링크의 색상을 빨간색으로 변경
       $(this).css("color", "red");
   });
});
    

</script>
	<!-- 마이페이지 큰박스 시작 -->
	<div class="cTGCMU">
		<!-- 마이페이지+밑내용 박스 시작 -->
		<div class="dcFcMp">
			<!-- 밑 메뉴량 분리박스 -->
			<div class="ctrKPP">
				<!-- 프로필사진 및 닉네임 상점개설일 및 본인인증확인 값 박스 -->
				<div class="eZIbTw">
					<!-- 이미지박스 시작 -->
					<div class="CMDzs">
						<div>
							<div class="jFAmMI">
								<div class="kECXqh">
									<div class="gxbdui"></div>
								</div>
								<!-- 백그라운드 배경 끝 -->
								<!-- 사진 시작 -->
								<div class="fQjOoD">
									<img class="caoIJY"
										src="./image/${userdata.profile_image}"
										width="100" height="100">
									<div class="irlAx">${userdata.nickname}</div>
									<div class="kSnfgg">평점 : ${userdata.manner}</div>
									<div class="dctxBz">
										<a class="hPnzDB"> 상품 <b>${userdata.prductsu}</b>
										</a> <a class="hPnzDB2"> 찜 <b>${userdata.jjimget}</b>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 방문자 및 조회 추가 -->
					<div class="gJxoqg">
						<!-- 닉네임 -->
						<div class="ehnbKT">
							<div class="qCGRm">${userdata.nickname}</div>
							<div class="bhcrYn">본인인증</div>
						</div>
						<!-- 방문횟수 및 찜횟수 등등 -->
						<div class="ejNmIF">
							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/4b323fe1ef79c2b715fe.png"
									width="14" height="13"> 상점오픈일
								<div class="htiuQW">${member.gaip} 일 전</div>
							</div>

							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/e6792c64a6ba6f2b10a2.png"
									width="14" height="13"> 상점방문수
								<div class="htiuQW">${member.readcnt} 명</div>
							</div>

							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/ef9d606d24890f02bde0.png"
									width="14" height="13"> 상품판매
								<div class="htiuQW">${userdata.prductsu} 회</div>
							</div>

							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/b6ca1c340805703d7c62.png"
									width="14" height="13"> 찜 횟수
								<div class="htiuQW">${userdata.jjimget} 회</div>
							</div>
						</div>
						<!-- 상점 자기소개..  -->
						<div class="sc-jtRlXQ bmIoCE"  style="display: none;" id="txtop"><textarea id="intro" name="intro" >${member.intro}</textarea><button type="button" id="itrsub">확인</button></div>
						<div class="sc-jeCdPy klBxMk">${member.intro}</div>
						<!-- 상점 자기소개..  -->
						
									
						<!-- 소개글 신고버튼 -->
						<div class="sc-bGbJRg hQqotf"><a class="jynacn" onclick="location.href='swindleform'">
								<img src="https://m.bunjang.co.kr/pc-static/resource/327172b424ab5e1910a4.png" width="14" height="14">
								신고하기
							</a></div>
					</div>

				</div>
			</div>
			<!-- 메뉴 시작 -->
				<div>
					<div>
						<div class="dvLjiM">
							<a class="gmerZt test1" href="#">
								상품
								<span class="gyLEXJ">${userdata.prductsu}</span>
							</a>
							<a class="gmerZt test2" href="#">
								상점후기
								<span class="gyLEXJ">21</span>
							</a>
							<a class="gmerZt test3" href="#">
								찜한상품
								<span class="gyLEXJ">${jjimPoriduct.size()}</span>
							</a>
							<a class="gmerZt test4" href="#">
								날찜한사람
								<span class="gyLEXJ">${followProfile.size()}</span>
							</a>
						</div>
					</div>

                            
					
					<!-- 각메뉴를 눌렀을때 나와야하는 페이지 -->
					<div class="fUqZYe">
					<!-- 상품  시작 -->
					
					     <div class="cFVlDW test1_1" id="gmerZt1">
                            <div class="gvsXqb">
                                 <div>
                                     상품
                                     <span class="eNfnFh">${userdata.prductsu}</span>
                                 </div>
                                 <div class="teyL">
                                
                                     <div class="cTDSdC">
                                         <div class="gyBPuj">
                                             전체
                                             <img  src="https://m.bunjang.co.kr/pc-static/resource/9b606ef2e7d57fafa657.png" width="10" height="6">
                                         </div>
                                         <div class="gaDwcW">
                                             <a class="cmPcYP">전체</a>
                                             <a class="cmPcYP">판매중</a>
                                             <a class="cmPcYP">거래중</a>
                                             <a class="cmPcYP">판매완료</a>
                                         </div>
                                     </div>
                                 </div>
                            </div>
                            <!-- 상품리스트상단메뉴 시작 -->
                            <div class="fpFuIY">
                                <div class="bSiTj">
                                    <div class="kfUvd">
                                    
                                        <div class="cKbwnh">
                                            <div id="allc">전체</div>
                                            <div class="gOrNhR" id="ct">
                                                ${userdata.prductsu} 개
                                            </div>
                                        </div>
                                        <div class="gGCYmy">
                                            <a class="dMXLDX" id="new">최신순</a>
                                            <a class="dMXLDX" id="prdesc">고가순</a>
                                            <a class="dMXLDX" id="prasc">저가순</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- 상품 리스트시작 -->
                                <div class="dhgZke" id="product-list">
                                
                                    <c:forEach var="i" items="${list}">
                                    <div class="bfphSx">
                                        <a class="isOWuA" href="productout?prodcut_no=${i.product_no}&title=${i.title}">
                                        	<input type="hidden" value="${i.seller_id}" name="seller_id" id="seller_id">
                                            <div class="bkngsY">
                                                <img  src="./image/${i.product_image}"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    ${i.title} 
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        ${i.price}
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>${i.period}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                ${i.location}
                                            </div>
                                        </a>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    <!-- 상품 리스트 박스끝 -->
                        
					<!-- 상점후기 시작 -->
					<!-- <div class="gbNMxu"> -->
                         <div class="cFVlDW test2_1" id="gmerZt2">
                            	<div class="gvsXqb">
                            		<div class="crEEyG">
                            			<div>
                            				상점후기
                            				<span class="bNdKvM" >3</span>
                            			</div>
                            			<div class="iNEuHV">
                            				<!-- 평점 박스 시작 -->
                            				<div class="jSjZNs">
                            					<div class="fWtYmf">
                            						<div class="fGpXKG">7.8</div>
                            						<div class="eyeUYg">평점</div>
                            					</div>
                            					<div class="qEvCW"></div>
                            				<div class="hlvDzf">
                            					<div class="hSIAij">91%</div>
                            					<div class="eyeUYg">만족후기</div>
                            				</div>
                            					
                            				</div>
                            				<!-- 평점박스 끝 -->
                            				<!-- 후기 초이스 박스 -->
                            				<div class="hoyCQB">
                            					<div class="fwSCvu">
                            						<div class="jIvCjd">
                            							<img class="cASjol" src="https://static.bunjang.co.kr/review/review-keyword-img/review_keyword_icon_1_v2.png" width="14"height="14">
                            							상품 설명과 실제 상품이 동일해요. 
                            						</div>
                            						<div class="bJWsOy">
                            							1
                            						</div>
                            					</div>
                            					
                            					<div class="fwSCvu">
                            						<div class="jIvCjd">
                            							<img class="cASjol" src="https://static.bunjang.co.kr/review/review-keyword-img/review_keyword_icon_5_v2.png" width="14"height="14">
                            							톡 답변이 빨라요.
                            						</div>
                            						<div class="bJWsOy">
                            							1
                            						</div>
                            					</div>
                            					
                            					<div class="fwSCvu">
                            						<div class="jIvCjd">
                            							<img class="cASjol" src="https://static.bunjang.co.kr/review/review-keyword-img/review_keyword_icon_6_v2.png" width="14"height="14">
                            							친절하고 배려가 넘쳐요.
                            						</div>
                            						<div class="bJWsOy">
                            							1
                            						</div>
                            					</div>
                            					
                            					<div class="fwSCvu">
                            						<div class="jIvCjd">
                            							<img class="cASjol" src="https://static.bunjang.co.kr/review/review-keyword-img/review_keyword_icon_7_v2.png" width="14"height="14">
                            							포장이 깔끔해요. 
                            						</div>
                            						<div class="bJWsOy">
                            							1
                            						</div>
                            					</div>
                            					
                            				</div>
                            					
                            			</div>
                            			
                            		</div>
                            	</div>
                            	<!-- 상점후기 초이스 박스 끝 -->
						<!-- 상점후기 글 시작 -->
						<div>
							<div class="ncuqL">
								<a class="kQxTuR">
									<img src="https://media.bunjang.co.kr/images/crop/530629795_w120.jpg" width="60" height="60">
								</a>
								<div class="ltgOw">
									<div class="kiUeQm">
										<div class="hukTeN">
											<a class="grmcoQ">후기남긴사람닉</a>
											<div class="cpXGdD">
												2년전
											</div>
										</div>
										<div class="dQLwrX">평점 : 9.7</div>
										</div>
										
										<a class="gIFaPc">
											<button class="xPStH">
												HOPE 홉스샵 야상스커트
												<img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"width="6"height="10">
											</button>
										</a>
										<div class="inDnwi">친절해요 ㅎㅎ 감사해요 물건싸게 잘 구입했습니다.!!</div>
										<div class="glxCHJ"></div>
										<div class="dskFXS"></div>
								</div>
							</div>
						</div>
                            	<!-- 후기글 끝 -->
                            	
                            	<div>
							<div class="ncuqL">
								<a class="kQxTuR">
									<img src="https://media.bunjang.co.kr/images/crop/530629795_w120.jpg" width="60" height="60">
								</a>
								<div class="ltgOw">
									<div class="kiUeQm">
										<div class="hukTeN">
											<a class="grmcoQ">후기남긴사람닉</a>
											<div class="cpXGdD">
												2년전
											</div>
										</div>
										<div class="dQLwrX">평점 : 9.7</div>
										</div>
										
										<a class="gIFaPc">
											<button class="xPStH">
												HOPE 홉스샵 야상스커트
												<img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"width="6"height="10">
											</button>
										</a>
										<div class="inDnwi">친절해요 ㅎㅎ 감사해요 물건싸게 잘 구입했습니다.!!</div>
										<div class="glxCHJ"></div>
										<div class="dskFXS"></div>
								</div>
							</div>
						</div>
						
						<div>
							<div class="ncuqL">
								<a class="kQxTuR">
									<img src="https://media.bunjang.co.kr/images/crop/530629795_w120.jpg" width="60" height="60">
								</a>
								<div class="ltgOw">
									<div class="kiUeQm">
										<div class="hukTeN">
											<a class="grmcoQ">후기남긴사람닉</a>
											<div class="cpXGdD">
												2년전
											</div>
										</div>
										<div class="dQLwrX">평점 : 9.7</div>
										</div>
										
										<a class="gIFaPc">
											<button class="xPStH">
												HOPE 홉스샵 야상스커트
												<img src="https://m.bunjang.co.kr/pc-static/resource/c5ce9d5a172b0744e630.png"width="6"height="10">
											</button>
										</a>
										<div class="inDnwi">친절해요 ㅎㅎ 감사해요 물건싸게 잘 구입했습니다.!!</div>
										<div class="glxCHJ"></div>
										<div class="dskFXS"></div>
								</div>
							</div>
						</div>
						
						<div class="drhmhk">
							<button class="EDFVi">
								<div class="jBHGaB">
									상점후기 더 보기
								</div>
							</button>
						</div>
						
                            </div>
					<!-- 상점후기 박스끝 -->
					
					<!-- 찜한상품 리스트 박스 시작 -->
						<div class="cFVlDW test3_1" id="gmerZt3">
							<div class="kEbOts">
								<div class="gvsXqb">
									<div>
									찜한 상품
									<span class="cRYyVr">${jjimPoriduct.size()}</span>
									</div>
								</div>
								<!-- 찜한상품리스트 -->
								<!-- 찜 컨텐츠 04-26 작업 -->
								<c:forEach var="i" items="${jjimPoriduct}">
									<div class="fFuMaZ" style="position: relative;" >
										<div class="gaevmH">
											<a class="dILrpO" href="sdpage?member_id=${i.id}">
												<img  src="./image/${i.profileimage}" width="60" height="60" >
											</a>
											<a  class="gWpzaU" href="sdpage?member_id=${i.id}">
												${i.nickname}
											</a>
											<div class="bYJeVd">
												<a class="fLGMQx">
													상품
													<b>${productcount}</b>
												</a>
												<a class="bHuFGf">
													날찜한
													<b>11</b>
												</a>
											</div>
											
											<div>
												<button class="hpOnCv" type="button" onclick="location.href='jjimcancle?pr_no=${i.productno}'">
												<img  src="https://m.bunjang.co.kr/pc-static/resource/226de467653c15366c94.png" width="20" height="14">
												찜취소 하기</button>
											</div>
										</div>
										<!-- 찜한상품 목록 리스트 -->
										
										
											<div class="hXgWIg">
											<c:forTokens items="${i.pr_image}" delims = "," var="imagelen">
												<a class="hjAHtY" href="productout?product_no=${i.productno}" >
													<img src="./image/${imagelen}" width="190" height="190">
												</a>
											</c:forTokens>
											</div>
									</div>
									</c:forEach>
								<!-- 찜한상품리스트 끝 -->
								
							</div>
						</div>
						<!-- 찜한상품 박스 끝 -->	
					<!--날 찜한사람  -->
						<div class="cFVlDW test4_1" id="gmerZt4">
							<div class="kEbOts">
								<div class="gvsXqb">
									<div>
										찜한사람
										<span class="cRYyVr">${followProfile.size()}</span>
										<input type="hidden" value="${member.member_id}">
									</div>
								</div> 
								<!-- 찜한사람 프로필 시작 -->
								<div>
									<div class="ejqxUK">
									<c:forEach var="i" items="${followProfile}" >
										<div class="huYmor">
											<div class="gWQYTj">
												<a class="ihXWvD" href="sdpage?member_id=${i.id}">
													<img src="./image/${i.image}" width="120" height="120" >
												</a>
												<a class="jxwzvM" href="sdpage?member_id=${i.id}">
													${i.nickname}
												</a>
												<a class="kIShQU">
													<div class="dQLwrX">
														평점 : ${i.manner}
													</div>
												</a>
												
												<div class="bbHFKb">
													<a class="jipGBV">
														상품
														<b>${i.productcount}</b>
													</a>
													<a class="dKLOxd">
														찜
														<b>${i.jjimcountget}</b>
													</a>
												</div>
												
												
											</div>
									</div>
									</c:forEach>
									</div>
									</div>
									<!-- 찜 컨텐츠 04-26 작업 end -->
									</div>
									</div>
									</div>
								
										
				</div>
			<!-- 마이페이지+밑내용 박스 끝 -->
		</div>
		<!-- 마이페이지 큰박스 끝 -->
	</div>
</body>
</html>