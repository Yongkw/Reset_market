<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2>공지사항 글쓰기</h2>
</div>
   <form action="noticesave" method="post" enctype="multipart/form-data">
  
    <div class="form-group">
      <label for="title" >제목</label>
<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
<!-- required 속성을 설정하면 필수입력 사항이된다. -->
<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
      <input type="text" class="form-control" id="notice_title"
       placeholder="제목 입력(4-100)" name="notice_title"
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
<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
   <textarea class="form-control" rows="5" id="notice_content"
    name="notice_content" placeholder="내용 작성"></textarea>
 </div>
 
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="notice_writer"
       placeholder="작성자(2자-10자)" name="notice_writer">
    </div>
    
    <button type="submit" class="btn btn-default" style="float: right;">등록</button>
    
  </form>
</div>  

</body>
</html>