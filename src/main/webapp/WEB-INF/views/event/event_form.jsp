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
<h2>이벤트 공지 작성</h2>
</div>
  <form action="eventsave" method="post" enctype="multipart/form-data" class="formmain">
  
    <div class="form-group">
      <label for="title" >제목</label>
      <input type="text" class="form-control" id="title"
       placeholder="제목 입력(4-100)" name="event_title"
       maxlength="100" required="required"
       pattern=".{4,100}" >
    </div>
    
     <div class="form-group">
      <label for="title" >사진</label>
      <input type="file" class="form-control" id="img"
       placeholder="사진을 선택하세요." name="event_img">
    </div>
    
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="content"
    name="event_content" placeholder="내용 작성"></textarea>
 	</div>
 	
 	  <div class="form-group">
    <label for="day">이벤트 기간</label><br>
    <input type="date" class="form-control" id="day" name="event_sday"> ~ 
    <input type="date" class="form-control" id="day" name="event_fday">
	</div>

    
    <div class="form-group">
	   <label for="title" >이벤트 진행상황</label><br>
	   <input type="radio" name="event_state" value="ing_event" checked="checked">진행중
       <input type="radio" name="event_state" value="finish_event">종료<br>	
    </div>
    
    <button type="submit" class="btn btn-default" style="float: right;">등록</button>
  </form>
</div>  

</body>
</html>