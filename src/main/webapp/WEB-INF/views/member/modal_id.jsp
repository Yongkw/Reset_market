<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
}

.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>
<meta charset="UTF-8">
<title>찾은 정보</title>
</head>
<body>
	<!-- 모달 요소 -->
<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%; background-color: none;"> 
    <div id="background_modal" class="background_modal" style="display: none; width: 20rem;">
        <div class="card" style="width: 20rem; border-radius: 20px; border: 1px solid #ccc;">
            <div class="card-body">
                <h5 class="card-title">
                    <b id="search_value" style="color: #113366;"></b>
                    <span class="close" style="float: right; cursor: pointer;">&times;</span>
                </h5>
                <br>
                <h2 id="value" style="color: black;"></h2>
                <br>
                <button type="button" id="finish" class="btn peach-gradient btn-rounded waves-effect" onclick="location.href='/market/login'">
                    <i class="fa fa-envelope"></i>확인
                </button>
            </div>
        </div>
    </div>
</div>

	
</body>
</html>