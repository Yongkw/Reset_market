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
	    width:50%;
	    height:100%;
	    margin: 0;
  		padding-top: 190px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
  		background:linear-gradient(to bottom right, #0098FF, #6BA8D1);
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
</style>
<meta charset="UTF-8">
<title>찾은 정보</title>
</head>
<body>
<!-- 모달 요소 -->
<div id="background_modal" class="background_modal" style="display: none;">
    <div class="card" style="border-radius: 20px; border: 1px solid #ccc;">
        <div class="card-body">
            <h4 class="card-title">
                <b id="name_value" style="color: #113366;"></b>
                <span class="close" style="float: right; cursor: pointer;">&times;</span>
            </h4>
            <br>
            <h2 id="id_value" style="color: black;"></h2>
            <br>
            <button type="button" id="finish" class="btn peach-gradient btn-rounded waves-effect" onclick="location.href='/market/login'">
                <i class="fa fa-envelope"></i>확인
            </button>
        </div>
    </div>
</div>
</body>
</html>