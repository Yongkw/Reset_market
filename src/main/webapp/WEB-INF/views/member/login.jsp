<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<!-- Font Awesome CSS -->
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>

<head>
<style>
.container {
	padding: 2rem 0rem;
}

@media {
	.modal-content {
		width: 500px;
		height: 516.98px !important;
		padding: 16px;
		}
}

.modal-dialog {
	position: relative;
	display: flex;
	pointer-events: auto;
	outline: 0;
}

.modal-body {
	width: 466px;
	height: 426.98px !important;
	padding: 16px;
}

h4 {
	font-size: 24px;
	margin-bottom: .5rem;
	font-weight: 500;
	line-height: 1.2;
	width: 434px;
	height: 28.8px;
	margin: 0 0 8px;
}

.form-title.text-center {
	width: 434px;
	height: 148.8px;
	margin: -32px 0px 32px;
}

.text-center {
	text-align: center !important;
}

.sgform {
	width: 434x;
	height: 146px;
}

#login_id.form-control, #login_pw.form-control, .btn.btn-block2 {
	width: 434px;
	height: 38px;
	padding: 6px 12px;
}

.modal-header {
	width: 466px;
	height: 56px;
	padding: 16px;
	border-bottom: none !important;
}

.modal-header .close {
	margin-top: -1.5rem;
}

.form-title {
	margin: -2rem 0rem 2rem;
}

.signup-section {
	padding: 0.3rem 0rem;
}

.modal-backdrop {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1040;
	width: 100vw;
	height: 100vh;
	background-color: #000;
	max-width: 100%;
}

.signup-section {
	white-space: nowrap;
}

.modal-footer {
	width: 434px;
	height: 100.19px;
	padding: 16px;
	text-align: center;
	border-top: none;
}

.text-info {
	width: 154.63px;
	height: 21px;
}

#xspan {
	width: 16.97px;
	height: 32px;
	display: inline-block; /* 너비와 높이를 적용하기 위해 인라인 블록 요소로 설정 */
}

</style>

<!-- Popper JS -->
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<!-- Bootstrap JS -->
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span id="xspan" aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<img src="./image/log_s.png" width="149" height="120">
						<h4>Login</h4>
					</div>
					<div class="d-flex flex-column text-center">
						<form class="sgform" action="loginok" method="post">
							<div class="form-group">
								<input type="text" class="form-control" id="login_id"
									name="login_id" placeholder="아이디" required>
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="login_pw"
									name="login_pw" placeholder="비밀번호" required>
							</div>
							<button type="submit" class="btn btn-block2"
								style="background-color: #649a64; color: white;">로그인</button>
						</form>
					</div>
					<div
						class="modal-footer d-flex justify-content-center flex-column align-items-center">
						<div class="signup-section">
							<a href="myinfo_search" class="text-info">아이디/비밀번호 찾기</a>
						</div>
						<div class="signup-section">
							아직 회원이 아니신가요?<a href="signup" class="text-info">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>