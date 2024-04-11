<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모달 테스트</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 추가로 필요한 CSS나 JavaScript 파일을 여기에 추가할 수 있습니다 -->
<style>

html {
		height: 100%;
	}
	
	body {
	    width:100%;
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
#background_modal {
    display: none;
    /* 모달 숨김 상태로 초기화 */
}
</style>
</head>
<body>
<script src="./resources/js/info_search.js"></script>
<%@include file="/WEB-INF/views/member/modal_id.jsp" %>
<!-- 기타 내용 -->
<div class="card align-middle" style="width: 20rem; border-radius: 20px;">
    <div class="card-title" style="margin-top: 30px;">
        <h2 class="card-title text-center" style="color: #113366;">회원찾기</h2>
        <div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
            <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked>
            <label class="custom-control-label font-weight-bold text-black" for="search_1">아이디 찾기</label>
        </div>
        <div class="custom-control custom-radio custom-control-inline">
            <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)">
            <label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
        </div>
    </div>
    <div class="card-body" id="search_I">
        <h5 class="form-signin-heading">회원 정보를 입력하세요</h5>
        <label for="name_1" class="sr-only">이름</label>
        <input type="text" id="name_1" name="name_1" class="form-control" placeholder="ex)한석봉" required autofocus><br>
        <label for="phone" class="sr-only">전화번호</label>
        <input type="text" id="phone" name="phone" class="form-control" placeholder="ex)010-1234-5678" required><br>
        <div class="form-group">
            <button id="IdBtn" class="btn btn-lg btn-primary btn-block" onclick="idSch_click()">확인</button>
        </div>
    </div>
    <div class="card-body" id="search_P" style="display: none;">
        <h5 class="form-signin-heading">회원 정보를 입력하세요</h5>
        <label for="id" class="sr-only">아이디</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="아이디를 입력" required autofocus><br>
        <label for="name_2" class="sr-only">이름</label>
        <input type="text" id="name_2" name="name_2" class="form-control" placeholder="ex)한석봉" required autofocus><br>
        <label for="jumin" class="sr-only">주민번호</label>
        <input type="text" id="jumin" name="jumin" class="form-control" placeholder="ex)001025-0123456" required><br>
        <div class="form-group">
            <button id="PwBtn" class="btn btn-lg btn-primary btn-block" onclick="pwSch_click()">확인</button>
        </div>
    </div>
</div>


</body>
</html>
