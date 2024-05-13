	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css 적용 -->
<link href="${path}/resources/css/promypage.css" rel="stylesheet" /> 
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
    $('.gyBPuj').click(function(){
        // gyBPuj 클래스를 가진 요소의 형제 요소인 gaDwcW를 선택합니다.
        var gaDwcW = $(this).siblings('.gaDwcW');
        
        // 선택된 gaDwcW에 대해 필요한 작업을 수행합니다.
        // 예를 들어, 선택된 gaDwcW를 숨기거나 보이게 하려면 다음과 같이 작성합니다.
        gaDwcW.toggle();
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
$(document).ready(function(){
	$('.pagebtn').click(function(){
		const fowid = $(this).attr('id').substr(7);
		location.replace("mypage?find_id="+fowid);
	});
	$('.jjimbtn').click(function(){
		$('.jjimbtn').click(function(){
			const fowid = $(this).attr('id').substr(8); //팔로워 할 아이디
	    	console.log("followbox :"+fowid);
			$.ajax({
			    url: 'jjimcount_mypage', 
			    type: 'POST', 
			    data: {
			    	'fowid':fowid,
			    	},
			    dataType : 'text',
			    traditional: true,
			    success: function(data){
			    	console.log("성공");
			    	
			    },
			    error: function(error){ // 요청 실패 시 실행될 콜백 함수
			        console.error(error); // 에러 메시지를 콘솔에 출력
			        console.log('실패'); // 실패 메시지 출력
			        
			    }
			});
			
		});
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
							<c:choose>
							<c:when test="${userdata.id != member_id}">
							<div>
								<button class="jjimbtn hpOnCv" id="jjimbtn_${userdata.id}">
								찜하기
								</button>
							</div>
							</c:when>
							</c:choose>
							<div class="bhcrYn">본인인증</div>
						</div>
						<!-- 방문횟수 및 찜횟수 등등 -->
						<div class="ejNmIF">
							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/4b323fe1ef79c2b715fe.png"
									width="14" height="13"> 상점오픈일
								<div class="htiuQW">365 일 전</div>
							</div>

							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/e6792c64a6ba6f2b10a2.png"
									width="14" height="13"> 상점방문수
								<div class="htiuQW">235 명</div>
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
						<div class="bcsjLU" style="text-align: left;">안녕하세요
						반품/교환/환불정책
						교환불가 구매전 유의사항 잘보고사세요
						회원가입시 자기상점소개 추가 
						</div>
						<!-- 신고하기 부분 -->
						<div class="dXaXKb">
							<a class="jynacn">
								<img src="https://m.bunjang.co.kr/pc-static/resource/327172b424ab5e1910a4.png" width="14" height="14">
								신고하기
							</a>
						</div>
					</div>

				</div>
			</div>
			<!-- 메뉴 시작 -->
				<div>
					<div>
						<div class="dvLjiM">
							<a class="gmerZt test1" href="#">
								상품
								<span class="gyLEXJ">34</span>
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
                                     <span class="eNfnFh">15</span>
                                 </div>
                                 <div class="teyL">
                                
                                     <div class="cTDSdC">
                                         <div class="gyBPuj">
                                             전체
                                             <img  src="https://m.bunjang.co.kr/pc-static/resource/9b606ef2e7d57fafa657.png" width="10" height="6">
                                         </div>
                                         <div class="gaDwcW">
                                             <a class="bmufqR">전체</a>
                                             <a class="cmPcYP">판매중</a>
                                             <a class="cmPcYP">거래중</a>
                                         </div>
                                     </div>
                                 </div>
                            </div>
                            <!-- 상품리스트상단메뉴 시작 -->
                            <div class="fpFuIY">
                                <div class="bSiTj">
                                    <div class="kfUvd">
                                    
                                        <div class="cKbwnh">
                                            전체
                                            <div class="gOrNhR">
                                                15개
                                            </div>
                                        </div>
                                        <div class="gGCYmy">
                                            <a class="ffPLQP">최신순</a>
                                            <a class="dMXLDX">고가순</a>
                                            <a class="dMXLDX">저가순</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- 상품 리스트시작 -->
                                <div class="dhgZke">
                                
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
                                    
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
                                    
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
                                    <div class="bfphSx">
                                        <a class="isOWuA">
                                            <div class="bkngsY">
                                                <img  src="https://media.bunjang.co.kr/product/82374634_1_1663585674_w292.jpg"
                                                width="194" height="194">
                                            </div>
                                            <div class="bJpTlV">
                                                <div class="gstNkb">
                                                    얼반아웃피터스 정품 청자켓 s 아페쎄st
                                                </div>
                                                <!-- 가격 올린시간 div -->
                                                <div class="cxNmps">
                                                    <div class="heqdJ">
                                                        50000
                                                    </div>
                                                    <div class="elSbmF">
                                                        <span>22시간전</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 위치 div -->
                                            <div class="esiKrh">
                                                <img  src="https://m.bunjang.co.kr/pc-static/resource/5dcce33ad99f3020a4ab.png" width="15" height="17">
                                                전국
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 상품박스 끝 -->
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
								<c:forEach var="i" items="${jjimPoriduct}" >
									<div class="fFuMaZ" style="position: relative;" >
										<div class="gaevmH">
											<a class="dILrpO">
												<img  src="./image/${i.profileimage}" width="60" height="60">
											</a>
											<a  class="gWpzaU">
												${i.nickname}
											</a>
											<div class="bYJeVd">
												<a class="fLGMQx">
													상품
													<b>23</b>
												</a>
												<a class="bHuFGf">
													날찜한
													<b>11</b>
												</a>
											</div>
											
											<div>
												<button class="hpOnCv" type="button" >
												<img  src="https://m.bunjang.co.kr/pc-static/resource/226de467653c15366c94.png" width="20" height="14">
												찜하기</button>
											</div>
										</div>
										<!-- 찜한상품 목록 리스트 -->
										
										
											<div class="hXgWIg">
												<a class="hjAHtY" href="productout?product_no=${i.productno}" >
													<img src="./image/${i.pr_image}" width="190" height="190">
												</a>
												
												<a class="hjAHtY" href="productout?product_no=${i.productno}" >
													<img src="./image/${i.pr_image}" width="190" height="190">
												</a>
												
												<a class="hjAHtY" href="productout?product_no=${i.productno}" >
													<img src="./image/${i.pr_image}" width="190" height="190">
												</a>
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
									</div>
								</div> 
								<!-- 찜한사람 프로필 시작 -->
								<div>
									<div class="ejqxUK">
									<c:forEach var="i" items="${followProfile}">
										<div class="huYmor" id="followbox_${i.id}">
											<div class="gWQYTj">
												<a class="ihXWvD">
													<img src="./image/${i.image}" width="120" height="120">
												</a>
												<a class="jxwzvM">
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
												
												<div>
													<div class="hpOnCv">
														<button class="hpOnCv pagebtn" id="mypage_${i.id}">
															<img src="https://m.bunjang.co.kr/pc-static/resource/226de467653c15366c94.png" width="20" height="14">
															방문하기
														</button>
													</div>
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