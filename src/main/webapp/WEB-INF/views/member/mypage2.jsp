<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.cTGCMU {
	display: flex;
	-webkit-box-pack: center;
	justify-content: center;
	background: rgb(255, 255, 255);
}

.dcFcMp {
	width: 1024px;
	margin-top: 30px;
}

.ctrKPP {
	margin-bottom: 30px;
}

.eZIbTw {
	display: flex;
	width: 100%;
}

.CMDzs {
	flex-shrink: 0;
}

.jFAmMI {
	width: 310px;
	height: 310px;
	position: relative;
	color: rgb(255, 255, 255);
}

.kECXqh {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

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

.blcYdX {                                   /* 소개글 수정 버튼내 ..*/
    height: 20px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 0px 5px;
    color: rgb(136, 136, 136);
    border: 1px solid rgb(238, 238, 238);
    font-size: 11px;
    text-align: center;
}

button {                                    /* 버튼 백그라운드 색깔 및 포인터 옵션*/
	background-color: transparent;
	cursor: pointer;
	outline: none;
}

.klBxMk {									/* 상점 소개 수정 div..*/
    -webkit-box-flex: 1;
    flex-grow: 1;
    width: 100%;
    overflow-y: auto;
    line-height: 1.57;
    white-space: pre-wrap;
    letter-spacing: -0.5px;
}
.bmIoCE {
    display: flex;
    justify-content: space-between; /* 자식 요소 사이의 간격을 최대화하여 오른쪽에 버튼을 위치시킵니다. */
    
}

.bmIoCE > textarea {
    width: calc(100% - 100px); /* 버튼의 너비를 고려하여 textarea의 너비를 조정합니다. */
    height: 147px;
    -webkit-box-flex: 1;
    flex-grow: 1;
    resize: none;
    border: 1px solid rgb(238, 238, 238);
    outline: none;
    
}

.bmIoCE > button {
    width: 100px;
    height: 147px;
    border: 1px solid rgb(238, 238, 238);
    background: rgb(250, 250, 250);
    color: rgb(136, 136, 136);
}



.hQqotf { /* 소개수정버튼 간격 */
    height: 56px;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    flex-shrink: 0;
     
}


.fQjOoD {
	position: inherit;
	display: flex;
	width: 100%;
	height: 100%;
	-webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center;
	flex-direction: column;
	box-shadow: rgba(4, 0, 0, 0.03) 0px 5px 10px 0px;
}

.caoIJY {
	border-radius: 50%;
	margin-bottom: 15px;
}

.irlAx {
	font-size: 16px;
	margin-bottom: 10px;
}

.kSnfgg {
	display: flex;
}

.dctxBz {
	display: flex;
	margin-top: 20px;
	font-size: 12px;
	margin-left: 20px;
}

.hPnzDB {
	margin-right: 20px;
	position: relative;
	color: rgb(255, 255, 255);
}

.hPnzDB2 {
	margin-right: 20px;
	position: relative;
	color: rgb(255, 255, 255);
}

a {
	color: rgb(33, 33, 33);
	text-decoration: none;
	cursor: pointer;
	background-color: transparent;
}

a:hover {
	text-decoration: none; /* 링크에 있는 밑줄 제거 */
	color: rgb(33, 33, 33); /* 링크에 있는 색상 변경 */
}

.hPnzDB::after {
	content: "";
	width: 1px;
	height: 10px;
	border-right: 1px solid rgb(255, 255, 255);
	position: absolute;
	top: 1px;
	right: -11px;
}

.gJxoqg {
	flex: 1 0 0%;
	padding: 0px 30px;
	border-top: 1px solid rgb(238, 238, 238);
	border-right: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(238, 238, 238);
	display: flex;
	height: 310px;
	flex-direction: column;
}

.ehnbKT {
	font-size: 18px;
	height: 75px;
	font-weight: 600;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	flex-shrink: 0;
}

.qCGRm {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.bhcrYn {
	font-size: 11px;
	color: rgb(77, 77, 77);
	position: relative;
}

.bhcrYn::after {
	content: "OK";
	color: rgb(255, 255, 255);
	font-size: 9px;
	background: rgb(255, 195, 34);
	border-radius: 6px;
	position: absolute;
	padding: 2px 4px 1px;
	top: -1px;
	left: -25px;
}

.ejNmIF {
	height: 45px;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	border-top: 1px solid rgb(250, 250, 250);
	border-bottom: 1px solid rgb(250, 250, 250);
	margin-bottom: 20px;
	flex-shrink: 0;
}

.iMvNBf {
	margin-right: 30px;
	font-size: 13px;
	color: rgb(136, 136, 136);
	display: flex;
}

.htiuQW {
	margin-left: 5px;
	color: rgb(33, 33, 33);
}

.iMvNBf {
	margin-right: 30px;
	font-size: 13px;
	color: rgb(136, 136, 136);
	display: flex;
}

.bcsjLU {
	-webkit-box-flex: 1;
	flex-grow: 1;
	width: 100%;
	overflow-y: auto;
	line-height: 1.57;
	white-space: pre-wrap;
}


.jynacn {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	color: rgb(136, 136, 136);
	font-size: 13px;
}

.dvLjiM {
	display: flex;
	height: 50px;
}

.gmerZt:first-child {
	border-left: 1px solid rgb(238, 238, 238);
}

.gmerZt {
	flex: 1 1 0%;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	display: flex;
	border-top: 1px solid rgb(238, 238, 238);
	border-right: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(33, 33, 33);
	background: rgb(250, 250, 250);
	color: rgb(136, 136, 136);
}

.gyLEXJ {
	margin-left: 10px;
}

.fAFdHw {
	flex: 1 1 0%;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	display: flex;
	border-top: 1px solid rgb(238, 238, 238);
	border-bottom: 1px solid rgb(33, 33, 33);
	background: rgb(250, 250, 250);
	color: rgb(136, 136, 136);
	border-right: 1px solid rgb(33, 33, 33);
}

.dvLjiM .kHfkPy {
	border-left: 1px solid rgb(33, 33, 33);
}

.kHfkPy {
	flex: 1 1 0%;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	display: flex;
	border-top: 1px solid rgb(33, 33, 33);
	border-right: 1px solid rgb(33, 33, 33);
	border-bottom: 1px solid rgb(255, 255, 255);
	background: rgb(255, 255, 255);
	color: rgb(33, 33, 33);
	font-weight: 600;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

		$(document).ready(function() {
			$('.gmerZt').click(function() {
				$('.gmerZt').removeClass('kHfkPy');
				$(this).addClass('kHfkPy');
				// 해당하는 내용을 나타내는 코드를 작성해야 합니다.
			});
		});

		$(document).ready(
				function() {
					$('.kHfkPy').first().css('border-left',
							'1px solid rgb(33, 33, 33)');
				});
		
		function itropen(){ //수정버튼 클릭시 수정버튼 none
			
		        document.getElementById('itrmodi').style.display = "none";
		        document.getElementById('txtop').style.display = "";
		    
		}
		$(document).ready(function(){
			$('#itrsub').click(function(){
				
				var intro = $('#intro').val();
				
				$.ajax({
					url: 'introsave',
					type: 'post',
					data: {intro:intro},
					success: function(data) {
						window.location.href="mypage2";
						console.log('OK',data)
					},
					error: function(data) {
						alert("상점소개 입력   초과");
						
					}
					
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
									<img class="caoIJY" src="./image/${member.profile_image}"
										width="100" height="100">
									<div class="irlAx">${member.nickname}</div>
									<div class="kSnfgg">평점 : 8.9</div>
									<div class="dctxBz">
										<a class="hPnzDB"> 상품 <b>9</b>
										</a> <a class="hPnzDB2"> 찜 <b>2</b>
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
							<div class="qCGRm">${member.nickname}</div>
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
								<div class="htiuQW">23 회</div>
							</div>

							<div class="iMvNBf">
								<img
									src="https://m.bunjang.co.kr/pc-static/resource/b6ca1c340805703d7c62.png"
									width="14" height="13"> 찜 횟수
								<div class="htiuQW">10 회</div>
							</div>
						</div>
						<div class="sc-jtRlXQ bmIoCE"  style="display: none;" id="txtop"><textarea id="intro" name="intro" >${member.intro}</textarea><button type="button" id="itrsub">확인</button></div>
						<div class="sc-jeCdPy klBxMk">${member.intro}</div>
						<!-- 상점 자기소개..  -->
						
						<!-- 소개글 수정버튼 -->
						<div class="sc-bGbJRg hQqotf"><button class="sc-kasBVs blcYdX" id="itrmodi" onclick="itropen()">소개글 수정</button></div>
					</div>

				</div>
			</div>
			<!-- 메뉴 시작 -->
			<div>
				<div>
					<div class="dvLjiM">
						<a class="gmerZt"> 상품 <span class="gyLEXJ">34</span>
						</a> <a class="gmerZt" href="#"> 상점후기 <span class="gyLEXJ">21</span>
						</a> <a class="gmerZt"> 찜한상품 <span class="gyLEXJ">11</span>
						</a> <a class="gmerZt"> 날찜한사람 <span class="gyLEXJ">4</span>
						</a>
					</div>
				</div>
				<!-- 각메뉴를 눌렀을때 나와야하는 페이지 -->
				<div></div>
			</div>
			<!-- 마이페이지+밑내용 박스 끝 -->
		</div>
		<!-- 마이페이지 큰박스 끝 -->
	</div>
</body>
</html>