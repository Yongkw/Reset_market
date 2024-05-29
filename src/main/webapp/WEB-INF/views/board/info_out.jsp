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
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1024px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}
.bJyhFc {
    display: inline-flex;
    overflow: hidden;
    position: relative;
    width: 100%;
    box-sizing: border-box;
}
.bJyhFc li.on {
    background-color: rgb(31, 31, 31);
    border: 1px solid rgb(31, 31, 31);
}

.bJyhFc li.on > a {
    color: rgb(255, 255, 255);
}


.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
}


.bJyhFc li {
    flex: 1 1 0%;
    float: left;
    border-top: 1px solid rgb(222, 222, 222);
    border-right: 1px solid rgb(222, 222, 222);
    border-left: 1px solid rgb(222, 222, 222);
    border-bottom: 1px solid rgb(222, 222, 222);
    box-sizing: border-box;
    text-align: center;
}

.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
    color: rgb(170, 170, 170);
}

a {
    text-decoration: none;
    color: rgb(102, 102, 102);
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	
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
														
								</div>
							</div>
						</div>
					</div>
					<!-- 방문자 및 조회 추가 -->
					<div class="gJxoqg">
						<!-- 닉네임 -->
						<div class="ehnbKT">
							<div class="qCGRm">${member.nickname}님! 안녕하세요 :)</div>
							<div class="bhcrYn">본인인증</div>
						</div>
						
						
						<!-- 공지 이미지 -->
						<img src="./image/personalboard.png"
						width="650" height="160">
					</div>

				</div>
			</div>
			
			<!-- 메뉴 시작 -->
			<ul class="sc-4icuvf-0 bJyhFc">
			<li class="on">
			<a href="info_out">1:1문의내역</a>
			</li>
			<li class="">
			<a href="info_swindle">사기신고내역</a>
			</li>
			</ul>
			
			<!-- 마이페이지+밑내용 박스 끝 -->
		</div>
		<!-- 마이페이지 큰박스 끝 -->
	</div>
	
	 <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                	<th scope="col" class="th-num">번호</th>	
                	<th scope="col" class="th-num">질문유형</th>                 
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-num">답변상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="aa">
                <tr>
                	<td>${aa.personal_no }</td>
                	<td>${aa.personal_category }</td>                                            
					<td><a href="personaldetail?personal_no=${aa.personal_no }">${aa.personal_title }</a></td>                     
                    <td>${aa.create_at }</td>
                    <td>${aa.answer_state }</td>
                </tr>
            	 </c:forEach>
                </tbody>
            </table>
             <button type="submit" class="btn btn-dark" onclick="location.href='personal_form'" style="margin-top: 10px;">문의하기</button>
        </div>
        
    </div>
</body>
</html>