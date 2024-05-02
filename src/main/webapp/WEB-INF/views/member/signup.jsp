<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
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

#signupBtn {
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
	<div class="container" style="max-width: 700px;">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto"
				style="display: flex; justify-items: center; align-items: center; flex-direction: column;">



				<form class="signupform" action="membersave" method="post"
					enctype="multipart/form-data"
					style="display: flex; flex-direction: column;">
					<h4 class="mb-4"
						style="width: 100%; position: relative; left: 13%;">회원가입</h4>
					<br> <br>
					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="sign_id">아이디<span id="req">*</span></label> <input
								type="text" class="form-control" id="sign_id" name="sign_id"
								placeholder="※영소문자,숫자로만 4~12자 가능" required /> <span
								class="idchk" style="position: absolute;"></span><input
								type="hidden" id="IdDoubleChk" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="pw">비밀번호<span id="req">*</span></label> <input
								class="form-control" type="password" name="pw1" id="pw1"
								maxlength="12" placeholder="영소문자,숫자 7~12자" required /> <span
								class="pwchk1" style="position: absolute;"> </span> <input
								type="hidden" id="PwDoubleChk" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="pwch">비밀번호 확인<span id="req">*</span></label> <input
								type="password" class="form-control" id="pw2" maxlength="12"
								placeholder="패스워드를 재입력해주세요!" required /> <span class="pwchk2"
								style="position: absolute;"></span> <input type="hidden"
								id="PwDoubleChk2" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="name">이름<span id="req">*</span></label> <input
								type="text" class="form-control" name="name" id="name"
								maxlength="5" placeholder="한글로만 (2~5자)" required /> <span
								class="namechk" style="position: absolute;"></span> <input
								type="hidden" id="NameDoubleChk" />
						</div>

					</div>

					<div class="row">
						<div class="col-md-9 mb-5 rowdiv" id="phoneup">
							<label for="phone">연락처<span id="req">*</span></label>
							<div class="input-group">
								<input class="form-control" name="phone1" id="phone1"
									maxlength="3" placeholder="ex)010" required /><span id="hp">
									- </span><input class="form-control" name="phone2" id="phone2"
									maxlength="4" placeholder="0000" required /><span id="hp">
									- </span><input class="form-control" name="phone3" id="phone3"
									maxlength="4" placeholder="0000" required />
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
								<div class="col-md-9 mb-2">
									<input type="text" class="form-control" name="addr2" id="addr2"
										readonly> <span class="addrchk"
										style="position: absolute;"></span> <input type="hidden"
										id="AddrDoubleChk">
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-9 mb-5 rowdiv">
							<label for="nickname">닉네임<span id="req">*</span></label> <input
								type="text" class="form-control" name="nickname" id="nickname"
								maxlength="8" placeholder="한영대소문자,숫자 2~8자리" required /> <span
								class="nickchk" style="position: absolute;">※한,영대소문자,숫자로만
								2자 이상 8자 이하</span> <input type="hidden" id="NickDoubleChk" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-6 mb-5"
							style="width: 100%; position: relative; left: 13%;">
							<label for="profile_image">프로필사진(선택)</label> <input type="file"
								class="form-control" id="profile_image" name="profile_image" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 mb-5"
							style="width: 100%; position: relative; left: 13%;">
							<label for="category">관심상품(선택)</label> <select
								onchange="categoryChange(this)" name="cate1"
								class="form-control">
								<option>선호하는 상품</option>
								<option value="의류,잡화">의류,잡화</option>
								<option value="가전">가전</option>
								<option value="홈인테리어">홈인테리어</option>
								<option value="뷰티">뷰티</option>
								<option value="운동용품">운동용품</option>
							</select> <select id="good" name="cate2" class="form-control">
								<option>분류</option>
							</select>

						</div>
					</div>


					<div class="row">
						<div class="col-md-6"
							style="width: 100%; position: relative; left: 20%;">
							<button class="btn btn-success btn-lg btn-block1" id="signupBtn">가입
								완료</button>
						</div>
						<div class="col-md-6">
							<button class="btn btn-warning btn-lg btn-block1 text-white"
								id="cancelBtn">가입 취소</button>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<!--아이디중복체크-->
	<script type="text/javascript" src="./resources/js/memberchk.js"></script>
	<!--마우스눈-->
	<script type="text/javascript" src="./resources/js/mouse.js"></script>
	<!--선호상품-->
	<script type="text/javascript" src="./resources/js/category.js"></script>
	<!-- 주소 api -->
	<script type="text/javascript" src="./resources/js/address.js"></script>


</body>
</html>