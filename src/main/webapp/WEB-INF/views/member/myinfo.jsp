<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[readonly] {
	cursor: default;
	background-color: lightgray;
}

.hidden-cursor {
	cursor: default;
	pointer-events: none;
}

.input-form {
	max-width: 700px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

.center {
	margin: 0 auto;
	text-align: center;
}

#req {
	color: red;
}

#hp {
	margin-top: 1%;
}

.rowdiv {
	width: 100% !important;
	left: 50%;
	transform: translate(-50%, 0%);
}

.signupform {
	display: flex;
	flex-wrap: wrap;
}

#ModyBtn {
	width: 180px;
	text-align: center;
	margin-right: 50px; /* 가입 완료 버튼의 오른쪽 마진 */
}

#cancelBtn {
	width: 180px;
	text-align: center;
	margin-left: 20px; /* 가입 취소 버튼의 왼쪽 마진 */
}

#addrcheck {
	width: 109px; /* 너비 조절 */
	height: 37px; /* 높이 조절 */
	text-align: center;
	font-size: 18px;
	line-height: 37px; /* 버튼 높이와 같게 설정 */
	padding: 0; /* 내부 여백 제거 */
}
</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #649a64;">
	<div class="container" style="max-width: 800px;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto"
				style="display: flex; justify-items: center; align-items: center; flex-direction: column;">



				<form class="modyform" action="membermodify" method="post"
					enctype="multipart/form-data"
					style="display: flex; flex-direction: column;">
					<h4 class="mb-4"
						style="width: 100%; position: relative; left: 13%;">회원 정보 수정</h4>
					<br> <br>
					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="id">아이디<span id="req">*</span></label> <input
								type="text" class="form-control" id="id" name="id"
								value="${member_id}" class="hidden-cursor" readonly>
						</div>
					</div>

					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="name">이름<span id="req">*</span></label> <input
								type="text" class="form-control" name="name" id="name"
								value="${member_name}" class="hidden-cursor" readonly>
						</div>

					</div>

					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="pw">현재 비밀번호<span id="req">*</span></label> <input
								class="form-control" type="password" name="nowpw" id="nowpw"
								maxlength="12" placeholder="영소문자,숫자 7~12자" required /> <input
								type="hidden" value="${member_pw}" id="member_pw"
								name="member_pw"><span class="nowpw"
								style="position: absolute;"> </span> <input type="hidden"
								id="PwChk" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="pw">변경할 비밀번호<span id="req">*</span></label> <input
								class="form-control" type="password" name="new_pw" id="new_pw"
								maxlength="12" placeholder="영소문자,숫자 7~12자"/> <span
								class="pwchk1" style="position: absolute;"> </span> <input
								type="hidden" id="PwDoubleChk" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="pwch">비밀번호 재입력<span id="req">*</span></label> <input
								type="password" class="form-control" name="new_pw2" id="new_pw2"
								maxlength="12" placeholder="비밀번호를 재입력해주세요!"/> <span
								class="pwchk2" style="position: absolute;"></span> <input
								type="hidden" id="PwDoubleChk2" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-9 mb-5 rowdiv" id="phoneup">
							<label for="phone">연락처<span id="req">*</span></label>
							<div class="input-group">
								<input class="form-control" name="phone1" id="phone1"
									maxlength="3" placeholder="ex)010" value="${phone1}" required /><span
									id="hp"> - </span><input class="form-control" name="phone2"
									id="phone2" maxlength="4" placeholder="0000" value="${phone2}"
									required /><span id="hp"> - </span><input class="form-control"
									name="phone3" id="phone3" maxlength="4" placeholder="0000"
									value="${phone3}" required />
							</div>
							<span class="phonechk" style="position: absolute;"></span> <input
								type="hidden" id="PhoneDoubleChk" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="row"
								style="width: 100%; position: relative; left: 13%;">
								<div class="col-md-3 mb-2">
									<label for="address">주소<span id="req">*</span></label>
									<button type="button" class="btn btn-primary btn-lg btn-block"
										id="addrcheck" onclick="execPostCode();">주소검색</button>
								</div>
							</div>
							<div class="row"
								style="width: 100%; position: relative; left: 13%;">
								<div class="col-md-9 mb-5">
									<input type="text" class="form-control" name="addr2" id="addr2"
										value="${address}" readonly> <span class="addrchk"
										style="position: absolute;"></span> <input type="hidden"
										id="AddrDoubleChk">
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="nickname">닉네임<span id="req">*</span></label> <input
								type="text" class="form-control" name="new_nick" id="new_nick"
								maxlength="8" placeholder="한영대소문자,숫자 2~8자리" value="${nickname}" required /> <input
								type="hidden" id="nickname" name="nickname" value="${nickname}">
							<span class="nickchk" style="position: absolute;"> </span> <input
								type="hidden" id="NickDoubleChk" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-5"
							style="width: 100%; position: relative; left: 13%;">
							<label for="profile_image">프로필사진(선택)</label>
							<c:choose>
								<c:when test="${empty profile_image}">
									<!-- 대체 이미지를 표시하는 부분 -->
									<img src="./image/default_image.jpg" weight="50px"
										height="80px">
								</c:when>
								<c:otherwise>
									<!-- 프로필 이미지를 표시하는 부분 -->
									<img src="./image/${profile_image}" weight="50px" height="80px">
								</c:otherwise>
							</c:choose>
							<input type="file" class="form-control" id="profile_image"
								name="profile_image" />
						</div>
					</div>



					<div class="row">
						<div class="col-md-6"
							style="width: 100%; position: relative; left: 20%;">
							<button class="btn btn-success btn-lg btn-block" id="ModyBtn">수정
								완료</button>
						</div>
						<div class="col-md-6">
							<button class="btn btn-warning btn-lg btn-block text-white"
								id="cancelBtn">메인으로</button>
						</div>
					
					<div class="row" style="position: relative; left: 95%;">
						<a href="" id="memberdel" style="color: red;" data-toggle="modal" data-target="#resignModal">회원탈퇴</a>
					</div>	
						
					</div>
				</form>
				<%@ include file="/WEB-INF/views/member/resign.jsp" %>
			</div>
		</div>
	</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- 주소 api -->
<script type="text/javascript" src="./resources/js/address.js"></script>
<!-- 수정체크  -->
<script type="text/javascript" src="./resources/js/modify_Chk.js"></script>
<script type="text/javascript" src="./resources/js/resign.js"></script>
</body>
</html>