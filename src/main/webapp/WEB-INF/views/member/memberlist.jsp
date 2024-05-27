<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
<div class="container">
  <h2>회원 정보</h2><br><br>
  
	 <div class="form-group" style="position: relative;" >
	    <label for="s_id">찾는 회원명</label>
	    <form action="search_member" method="post">
	    <div style="display: inline-flex;">
	        <select id="c_id">
	            <option id="member_id">아이디</option>
	            <option id="member_name">이름</option>
	            <option id="member_phone">전화번호</option>
	        </select>
	        <input type="text" class="form-control" id="s_id" name="s_id">
	        <button type="button" id="btn_search" class="btn btn-success">검색</button>
	        <button type="reset" id="btn_reset" class="btn btn-warning" onclick="location.href='memberlist'">초기화</button> 
	    </div>
	    </form>
	</div>


  <table class="table table-condensed" id="member_list">
    <thead>
    <tr>
        <th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주소</th>
		<th>닉네임</th>
		<th>선호상품</th>
		<th>프로필이미지</th>
		<th>삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="dd">
			<tr>
				<td>${dd.member_id}</td>
				<td>${dd.member_pw}</td>
				<td>${dd.member_name}</td>
				<td>${dd.phone}</td>
				<td>${dd.address}</td>
				<td>${dd.nickname}</td>
				<td>${dd.category_check1}</td>
				<td><img src="./image/${dd.profile_image}" width="50px" height="40px"></td>
				<td><a href="#" onclick="admdel('${dd.member_id}','${dd.profile_image}')">삭제</a></td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
</div>	
	
	
</body>
 <script type="text/javascript">
 $(document).ready(function() {
	 $(document).ready(function() {
	       // 엔터 키 막기
  $('#s_id').on('keydown', function(e) {
      if (e.key === 'Enter' || e.keyCode === 13) {
          e.preventDefault();
          $('#btn_search').click(); // 엔터 키로 검색 버튼 클릭
      }
  });
	 
	    $('#btn_search').click(function() {
	        var option = $('#c_id').val();
	        var value = $('#s_id').val();

	        $.ajax({
	            url: 'search_member',
	            type: 'POST',
	            data: { option: option, value: value },
	            dataType: 'json',
	            success: function(response) {
	                var tbody = $('#member_list tbody');
	                tbody.empty(); // 기존 내용 비우기
	                console.log("넘어온 데이터 값:" + response);

	                if (response && response.length > 0) {
	                    
	                    response.forEach(function(dd) {
	                        var row = '<tr>' +
	                            '<td>' + dd.member_id + '</td>' +
	                            '<td>' + dd.member_pw + '</td>' +
	                            '<td>' + dd.member_name + '</td>' +
	                            '<td>' + dd.phone + '</td>' +
	                            '<td>' + dd.address + '</td>' +
	                            '<td>' + dd.nickname + '</td>' +
	                            '<td>' + dd.category_check1 + '</td>' +
	                            '<td><img src="./image/' + dd.profile_image + '" width="50px" height="40px"></td>' +
	                            '<td><a href="#" onclick="admdel(\'' + dd.member_id + '\', \'' + dd.profile_image + '\')">삭제</a></td>' +
	                            '</tr>';
	                        tbody.append(row);
	                    });
	                } else {
	                    var nodata = '<tr><td colspan="9">일치하는 회원이 없습니다.</td></tr>';
	                    tbody.append(nodata);
	                }
	            },
	            error: function(xhr, status, error) {
	                alert("에러");
	                console.error('Error:', error);
	            }
	        });
	    });
	});
 
		 function admdel(member_id,profile_image) {
		     var delok = confirm(member_id + "님을 삭제하시겠습니까?");
		     console.log(member_id);
		     if (delok) {
		    	 $.ajax({
		             url: 'delmem', 
		             type: 'POST',
		             data: { member_id: member_id, profile_image: profile_image },
		             success: function(response) {
		                 if (response == "success") {
		                     alert(member_id + "님이 삭제되었습니다!");
		                     window.location.reload();
		                 } else {
		                     alert("관리자는 삭제 불가능! ");
		                     // 실패한 경우 에러 메시지 표시 등의 추가 작업 수행
		                 }
		             },
		             error: function(xhr, status, error) {
		                 alert("삭제 요청 중 오류가 발생하였습니다: " + error);
		                 // AJAX 요청 중 오류가 발생한 경우 처리
		             }
		         });
		     }
		     else{
		         alert("삭제가 취소되었습니다!");
		     }
		 }
 

</script>
</html>