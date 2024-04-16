<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container {
  max-width: 900px;
  margin: auto;
}
.container.name {
  height: 60px;
  border-bottom: 2px solid #241d1e;
}

.formmain {
	margin-top: 10px;
}
</style>
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<div class="container name">
<h2>공지사항 수정하기</h2>
</div>
   <form action="notice_upsave" method="post" enctype="multipart/form-data">
  	 <c:forEach items="${list }" var="aa">
    <div class="form-group">
      <label for="title" >제목</label>
      <input type="text" class="form-control" id="notice_title"
       placeholder="${aa.notice_title }" name="notice_title"
       maxlength="100" required="required"
       pattern=".{4,100}">
    </div>
    
    
     <div class="form-group">
      <label for="notice_category" >구분</label>
      <select name="notice_category" class="form-control" id="notice_category">	
		<option value="회원문의">회원문의</option>
		<option value="고객센터">고객센터</option>
		<option value="사기문의">사기문의</option>
		<option value="아나바다">아나바다</option>
		<option value="오류문의">오류문의</option>
		<option value="프로모션">프로모션</option>
		<option value="기타문의">기타문의</option>	
	</select>
    </div>
    
     <div class="form-group">
      <label for="title" >사진</label>
      <input type="file" class="form-control" id="notice_img"
       placeholder="사진을 선택하세요." name="notice_img">
    </div>
    
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="notice_content"
    name="notice_content" placeholder="${aa.notice_content }"></textarea>
 </div>
 
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="notice_writer"
       placeholder="${aa.notice_writer }" name="notice_writer">
    </div>
    </c:forEach>
    <input type="hidden" value="${list.get(0).notice_no }" name="notice_no" >
    
    <button type="submit" class="btn btn-default" style="float: right;">수정</button>
 
  </form>
</div>  

</body>
</html>