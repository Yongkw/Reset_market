<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>

<head>
<style>
 .resign_modal {
    position: fixed; /* 고정 위치 */
    left: 37.5%;
    top: 10%;
    width: 500px;
    height: 500px;    
    z-index: 1042;
    
  }
  
  .resign_modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    
  }
  .close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }
  .close:hover,
  .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
  }

</style>
<!-- jQuery -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- Popper JS -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<!-- Bootstrap JS -->
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="resignModal" class="resign_modal" style="display: none;">
  <div class="resign_modal-content">
    <h5 class="modal-title">회원 탈퇴</h5>
    <p class="modal-text">탈퇴를 위한 비밀번호를 입력해주세요.</p>
    <form action="resignok" class="rsform" method="post">
      <div class="form-group">
        <label for="rs_id">아이디</label>
        <input type="text" class="form-control" id="rs_id" name="rs_id" value="${member_id}" readonly>
      </div> 
      <div class="form-group">
        <label for="rs_pw">비밀번호</label>
        <input type="password" class="form-control" id="rs_pw" name="rs_pw">
        <input type="hidden" name="ch_pw" id="ch_pw" value="${member_pw}">
        <input type="hidden" id="pwst" name="pwst">
        <span class="pwchk" style="position: absolute;"></span>
      </div>
      <br>
      <button type="button" class="btn btn-primary rsBtn">확인</button>
      <button type="button" class="btn btn-secondary modalcancelBtn" data-dismiss="modal">취소</button>
    </form>
  </div>
</div>


</body>
</html>