<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*슬라이드 베너*/
.benner-div>* {
	margin: 0;
	padding: 0;
}

.benner-div {
	background: gray;
	width: 70%;
	margin: 0 auto;
	position: relative;
}

.section input[id*="slide"] {
	display: none;
}

.section .slide-wrap {
	max-width: 1800px;
	margin: 0 auto;
}

.section .slidelist {
	white-space: nowrap;
	font-size: 0;
	overflow: hidden;
}

.section .slidelist>li {
	display: inline-block;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.section .slidelist>li>a {
	display: block;
	position: relative;
}

.section .slidelist>li>a img {
	width: 100%;
}

.section .slidelist label {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%);
	padding: 50px;
	cursor: pointer;
}

.section .slidelist .left {
	left: 30px;
	background: url('./image/left.png') center center/100% no-repeat;
} /*슬라이드 좌우 버튼*/
.section .slidelist .right {
	right: 30px;
	background: url('./image/right.png') center center/100% no-repeat;
} /*슬라이드 좌우 버튼*/
.section .slidelist .textbox {
	position: absolute;
	z-index: 1;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	line-height: 1.6;
	text-align: center;
}

#slide01:checked ~ .slide-wrap .slidelist>li {
	transform: translateX(0%);
}

#slide02:checked ~ .slide-wrap .slidelist>li {
	transform: translateX(-100%);
}

#slide03:checked ~ .slide-wrap .slidelist>li {
	transform: translateX(-200%);
}

.benner-img {
	width: 100%;
	height: 200px;
	border: 1px solid blue;
}

/*슬라이드 베너 끝*/
</style>
</head>

<body>
	<!-- 슬라이드 베너 -->
	<div class="benner-div">
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked> 
			<input type="radio" name="slide" id="slide02"> 
			<input type="radio"	name="slide" id="slide03">
			<div class="slide-wrap">
				<ul class="slidelist">
					<li>
						<div class="slide-div">
							<a> <label for="slide03" class="left"></label> <img
								src="./image/1_1.png" class="benner-img"> <label
								for="slide02" class="right"></label>
							</a>
						</div>
					</li>
					<li>
						<div class="slide-div">
							<a> <label for="slide01" class="left"></label> <img
								src="./image/1_2.png" class="benner-img"> <label
								for="slide03" class="right"></label>
							</a>
						</div>
					</li>
					<li>
						<div class="slide-div">
							<a> <label for="slide02" class="left"></label> <img
								src="./image/1_3.png" class="benner-img"> <label
								for="slide01" class="right"></label>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 슬라이드 베너 끝 -->




</body>
</html>