<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#req {
	color: red;
}

.addrchk {
	position: relative;
	right: -100px; /* 필요에 따라 조절하세요. */
	bottom: 50px; /* 필요에 따라 조절하세요. */
	width: 150px;
}

input:focus {
	outline: 2px solid #c8f438
}
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!--아이디중복체크-->
<script type="text/javascript" src="./resources/js/memberchk.js"></script>
<!--마우스눈-->
<script type="text/javascript" src="./resources/js/mouse.js"></script>
<!--선호상품-->
<script type="text/javascript" src="./resources/js/category.js"></script>
<!-- 주소 api -->
<script type="text/javascript" src="./resources/js/address.js"></script>
<!-- 기본이미지 -->
<script type="text/javascript" src="./resources/js/image.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="signupform" action="membersave" method="post"
		enctype="multipart/form-data">
		<table border="1" width="900px" align="center">
			<caption>회원가입</caption>
			<tr>
				<th>아이디<span id="req">*</span></th>
				<td><input type="text" name="id" id="id" maxlength="12"
					placeholder="아이디를 입력해주세요!" required> <span class="idchk">※영소문자,숫자로만
						4~12자 가능</span> <input type="hidden" id="IdDoubleChk" /></td>
			</tr>
			<tr>
				<th>비밀번호<span id="req">*</span></th>
				<td><input type="password" name="pw1" id="pw1" maxlength="12"
					placeholder="영소문자,숫자 7~12자" required> <span class="pwchk1">※
						영소문자 7~12자 가능!</span> <input type="hidden" id="PwDoubleChk" /></td>
			</tr>
			<tr>
				<th>비밀번호 재입력<span id="req">*</span></th>
				<td><input type="password" name="pw2" id="pw2" maxlength="12"
					placeholder="패스워드를 재입력해주세요!" required> <span class="pwchk2"></span>
					<input type="hidden" id="PwDoubleChk" /></td>

			</tr>
			<tr>
				<th>이름<span id="req">*</span></th>
				<td><input type="text" name="name" id="name" maxlength="5"
					placeholder="한글로만 (2~5자)" required> <span class="namechk"></span>
					<input type="hidden" id="NameDoubleChk" /></td>
			</tr>
			<tr>
				<th>연락처<span id="req">*</span></th>
				<td><input type="text" name="phone1" id="phone1" maxlength="3"
					size="4px" placeholder="ex)010" required> - <input
					type="text" name="phone2" id="phone2" maxlength="4" size="4px"
					placeholder="0000" required> - <input type="text"
					name="phone3" id="phone3" maxlength="4" size="4px"
					placeholder="0000" required><span class="phonechk"></span><input
					type="hidden" id="PhoneDoubleChk" /></td>
			</tr>
			<tr>
				<th>주소<span id="req">*</span></th>
				<td><input type="text" name="addr2" id="addr2"><br>
					<button type="button" onclick="execPostCode();">주소검색</button> <br>
					<span class="addrchk"></span><input type="hidden"
					id="AddrDoubleChk" /></td>
			</tr>

			<tr>
				<th>닉네임<span id="req">*</span></th>
				<td><input type="text" name="nickname" id="nickname"
					maxlength="8" placeholder="한영대소문자,숫자 2~8자리" required> <span
					class="nickchk">※한,영대소문자,숫자로만 2자 이상 8자 이하</span> <input
					type="hidden" id="NickDoubleChk" /></td>
			</tr>

			<tr>
				<th>프로필사진(선택)</th>
				<td><input type="file" id="profileImage" name="profile_image">
			</tr>

			<tr>
				<th>관심상품(선택)</th>
				<td><select onchange="categoryChange(this)" name="cate1">
						<option>선호하는 상품</option>
						<option value="a">의류/잡화</option>
						<option value="b">가전</option>
						<option value="c">홈인테리어</option>
						<option value="d">뷰티</option>
						<option value="e">운동용품</option>
				</select> <select id="good" name="cate2">
						<option>분류</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="button" id="signupBtn">가입하기</button>
					<button type="button" onclick="location.href='main'">돌아가기</button>
			</tr>



		</table>
	</form>
</body>
</html>