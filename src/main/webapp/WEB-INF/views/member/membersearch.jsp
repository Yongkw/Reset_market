<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
 .align-middle {
        margin: auto;
    }

#background_modal {
    display: none;
    /* 모달 숨김 상태로 초기화 */
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
<body >
<div style="display: flex; flex-direction: column; justify-content: center; width: 100%; background-color: none;" >
<script src="./resources/js/info_search.js"></script>
<%@include file="/WEB-INF/views/member/modal_id.jsp" %>
<div class="card align-middle" style="width: 20rem; border-radius: 20px; text-align: center; ">
    <div class="card-title" style="margin-top: 30px;">
        <h2 class="card-title text-center" style="color: #113366;">회원찾기</h2>
        <div style="margin-bottom: 15px;" class="custom-control custom-radio custom-control-inline"> 
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
        <input type="text" id="name_1" name="name_1" class="form-control" placeholder="이름" required autofocus><br>
        <label for="phone" class="sr-only">전화번호</label>
        <input type="text" id="phone" name="phone" class="form-control" placeholder="전화번호 ex)010-1234-5678" required><br>
        <div class="form-group">
            <button id="IdBtn" class="btn btn-lg btn-warning btn-block" onclick="idSch_click()">확인</button>
        </div>
    </div>
     <div class="card-body" id="search_P" style="display: none;">
        <h5 class="form-signin-heading">회원 정보를 입력하세요</h5>
        <label for="sch_id" class="sr-only">아이디</label>
        <input type="text" id="sch_id" name="sch_id" class="form-control" placeholder="아이디" required autofocus><br>
        <label for="name_2" class="sr-only">이름</label>
        <input type="text" id="name_2" name="name_2" class="form-control" placeholder="이름" required autofocus><br>
        <label for="phone_2" class="sr-only">전화번호</label>
        <input type="text" id="phone_2" name="phone_2" class="form-control" placeholder="전화번호 ex)010-1234-5678" required><br>
        <div class="form-group">
            <button id="PwBtn" class="btn btn-lg btn-warning btn-block" onclick="pwSch_click()">확인</button>
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
	
</div>
</body>
</html>