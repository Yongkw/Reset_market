<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="now" value="${System.currentTimeMillis()}" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="${path}/resources/css/prodetail.css?v=${now}" rel="stylesheet" />
<!-- slick 라이브러리 설치 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- slick 라이브러리 설치종료 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<!-- 버튼 효과 -->
</head>
<body>

<script type="text/javascript">
$(document).ready(function () {
    $(".slide_div").slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 5000,
        infinite: true, // 무한 슬라이딩
        slidesToShow: 1, // 보여질 슬라이드 개수
        slidesToScroll: 1 // 넘어갈 슬라이드 개수
    });
});
</script>
	<div>
		<div class="WbLlq">
			<div class="kZaUxq">
				<div class="OFZaq">
					<!-- 카테고리 메뉴.. 시작 -->

				</div>

				<div>
					<!--  상품이미지 가격 제목 구매 박스 -->
					<div class="fRoYhx">
						<div class="cXRuyi">
							<!-- 이미지 시작박스 -->
							
							<div class="foTdEN slide_div_wrap">
							
								<div class="frjjY slide_div">
									<c:forEach var="cc" begin="0" end="${img.size()-1}" step="1">
									<!-- 이미지 넣기 -->
									
									<div>
									<img src="./image/${img.get(cc)}" class="ibxSYy">
									</div>
									</c:forEach>
								</div>

							</div>
							
						</div>
						<!-- 제목이랑 가격 구매하기 등록박스 -->
						<div class="iDkwQU">
							<div class="ghsxNc">
								<div>
									<div class="dIAZYi">
									<c:forEach items="${list}" var="aa">
										<div class="gYcooF">${aa.title}</div>
										<div class="jFrdEF">
											<div class="dJuwUw">
												${aa.price}<span>원</span>
											</div>
										</div>
										</c:forEach>
									</div>
									
									
									<c:forEach items="${list}" var="aa">
									<div>
										<div class="kZpimA">
											<div class="fyiblQ">
												<!--  조회수 넣기 -->
												<div class="jHkOld">
													<div>조회수${aa.view_cnt}</div>
												</div>
												<!-- 올린날짜 넣기 -->
												<div class="jHkOld">
													<div>${aa.update_at.substring(0, 10)}</div>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
									<c:forEach items="${list}" var="aa">
									<div class="iIjQjz">
										<div class="jdEBqX">* 상품상태</div>
										<div class="gXkArV">${aa.product_state}</div>
									</div>
									<div class="iIjQjz">
										<div class="jdEBqX">* 거래지역</div>
										<div class="kPNfKn">${aa.location}</div>
									</div>
									<div class="iIjQjz">
										<div class="jdEBqX">* 카테고리</div>
										<div class="gXkArV">${aa.category_name}</div>
									</div>
									</c:forEach>
								</div>


								<div class="jEiYxO">
									<div class="bqFmTC">
										<button class="loFlqz" onclick="jjimclick()">
											<span>♥찜</span> <span id="jjimCount" >${jjim}</span>
										</button>

										<button class="cxTeZB"
											style="widows: 176.645px; height: 56px;" onclick="location.href='resetchat2?pno=${list.get(0).product_no}'">
											<span>바로구매</span>
										</button>

										<button class="fqUDQ">
											<span>신고하기</span>
										</button>
									</div>
								</div>

							</div>
							<!-- 뭘넣어야하나 빈공간생김 -->

						</div>



					</div>
				</div>
				<!--  여기까지 사진 구매하기 종료  -->
				<div class="WSosK">
					<button type="button" class="lhitYR">
						<img
							src="https://m.bunjang.co.kr/pc-static/resource/0f33d009cbabfae76998.png"
							width="22" height="18">
					</button>
					<button type="button" class="gcQzFq">
						<img
							src="https://m.bunjang.co.kr/pc-static/resource/8d642b72e35a65d899c9.png"
							width="8" height="15">
					</button>
					<button class="cKLjFU">
						<img
							src="https://m.bunjang.co.kr/pc-static/resource/a11dc5d553fe7349b443.png"
							width="16" height="13">
					</button>
					<button class="gsTPKV">
						<img
							src="https://m.bunjang.co.kr/pc-static/resource/3dda776c665740a47597.png"
							width="25" height="25">
					</button>
				</div>
				<!-- 링크 버튼 종료 -->
				<div class="fxuPQD">
					<div class="jzEavb">
						<div class="jvpXNS">
							<div>
							<c:forEach items="${list}" var="aa">
								<div class="fscFAw">상품정보</div>
								<div>
									<div class="eJCiaL">
										<p style="width: 663px; height: 425px;  text-align:center;">${aa.detail}</p>
									</div>

									<div class="sBGtP">
										<div class="errcAj">
											<div class="jnXffx">거래지역</div>
											<div class="bwNieb">
												<span>${aa.location}</span>
											</div>
										</div>

										<div class="errcAj">
											<div class="jnXffx">카테고리</div>
											<div class="bwNieb">
												<span>${aa.category_name}</span>
											</div>
										</div>

										<div class="errcAj2">
											<div class="jnXffx">평점</div>
											<div class="bwNieb">
												<span>(manner)</span>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- 상점정보 -->
					<div class="iyVVQL">
						<div class="ffVYgj">
							<div>
								<div class="gABHXf">상점정보</div>

								<div class="hMRjOs">
									<div class="iKoLJU">
										<!-- 클릭하면 내상점(마이페이지)가게 만들기 -->
										<c:forEach items="${promember}" var="qq">
                                        <a class="cfPBhM" href="mypagesangjum?member_id=${qq.member_id}"> 
                                        <img src="./image/${qq.profile_image}" width="48" height="48">
										</a>
										</c:forEach>
										<div>
											<!-- 클릭하면 내상점(마이페이지)가게 만들기 -->
											<c:forEach items="${promember}" var="qq">
                                            <a class="bPWHcM" href="#"> ${qq.nickname}</a>
                                            </c:forEach>
											<div class="gNTMUU">
												<!-- 상품올린 count 줘서 가져와야함 -->
												<a class="kKVBjY" href="#"> 상품246 </a>
												<!-- 찜이랑 다르게 즐겨찾기를 만들까요.? -->
												<a class="kKVBjY" href="#"> 즐겨찾기37 </a>
											</div>
										</div>
									</div>

									<div class="qlCpb">
										<!-- 해당상점 상품나열 -->
										<!-- 해당이미지 6개까지만 출력가능하게.. -->
							  <c:forEach items="${sangjum}" var="mm" varStatus="loop">
                              <c:if test="${loop.index < 6}">
                              
                                    <div class="qlCpb">
                                        <!-- 해당상점 상품나열 -->
                                        <!-- 해당이미지 6개까지만 출력가능하게.. -->
                                        <a class="ibkRtu" href="productout?product_no=${mm.product_no}"> 
                                        <img alt="" src="./image/${mm.main_image}"    width="120" height="96" class="img-small">
											<div class="kjwDIB">
												<span>${mm.price}</span>
											</div>
									</a> 
                                    </div>
                                    </c:if>
                                     </c:forEach>
									</div>
									<!-- 상점더보기 내상점(마이페이지)로이동 -->
									<div class="cagBoV">
										<a class="cvXaIH"> <span class="dNCdnS">상품(cunt)개 </span>
											상점더보기>
										</a>
									</div>

									<div>
										<!-- 상점후기 갯수 coutn -->
										<div class="kBpaMW">
											상점후기 <span class="dNCdnS"">60</span>
										</div>
										<div class="cHgefI">
											<div class="hhpoLv">
												<a class="dwZVAp" href="#"> <img alt=""
													src="https://media.bunjang.co.kr/images/crop/667780742_w200.jpg"
													width="32" height="32">
												</a>

												<div class="hbwjis">
													<div class="dlGoQj">
														<a class="gPTxCw"> 후기올린닉네임 </a>
														<div class="hJGVWO">글올린날짜</div>
													</div>

													<div class="htSRzF">
														<div class="kSnfgg">그사람이 준 평점</div>
													</div>

													<div class="koQnlP">상점후기내용 들어가기</div>
												</div>
											</div>
											<div class="hhpoLv">
												<a class="dwZVAp" href="#"> <img alt=""
													src="https://media.bunjang.co.kr/images/crop/667780742_w200.jpg"
													width="32" height="32">
												</a>
												<div class="hbwjis">
													<div class="dlGoQj">
														<a class="gPTxCw"> 후기올린닉네임 </a>
														<div class="hJGVWO">글올린날짜</div>
													</div>
													<div class="htSRzF">
														<div class="kSnfgg">그사람이 준 평점</div>
													</div>
													<div class="koQnlP">상점후기내용 들어가기</div>
												</div>
											</div>

											<div class="dGZltQ">
												<a class="cvXaIH"> 상점후기 더보기 </a>

											</div>

										</div>

									</div>
								</div>
							</div>

						</div>
					</div>
				</div>



			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	function jjimclick() {
		const thisid = "<%=(String)session.getAttribute("member_id")%>"
			
		const pr_no = ${list.get(0).product_no};
		const seller_id = "${list.get(0).seller_id}";
		var jcount = document.getElementById('jjimCount');
		var jcount2 =$('#jjimCount');
		$.ajax({
		    url: 'jjimcount', 
		    type: 'POST', 
		    data: {
		    	'pr_no':pr_no,
		    	'thisid':thisid,
		    	'seller_id':seller_id
		    	},
		    dataType : 'text',
		    traditional: true,
		    success: function(data){
		    	jcount2.empty();
		    	jcount.insertAdjacentHTML('afterbegin',''+data+'');
		    	//category_name  location  price img1 product_no  title  view_cnt 
		    	console.log(data);
		    	
		    },
		    error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
		        console.error(error); // 에러 메시지를 콘솔에 출력
		        console.log('실패'); // 실패 메시지 출력
		        
		    }
		});
		
	}
	function jjimcolor(data){
		
	}
	
	</script>
</body>
</html>