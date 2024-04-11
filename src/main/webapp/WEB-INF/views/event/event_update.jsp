<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<div class="container name">
<h2>이벤트 수정하기</h2>
</div>
  <form action="event_upsave" method="post" enctype="multipart/form-data" class="formmain"> 
  <c:forEach items="${list }" var="aa">
    <div class="form-group">
      <label for="title" >제목</label>
      <input type="text" class="form-control" id="title"
       placeholder="${aa.event_title }" name="event_title"
       maxlength="100" required="required"
       pattern=".{4,100}">
    </div>
    
     <div class="form-group">
      <label for="title" >사진</label>
      <input type="file" class="form-control" id="img"
       placeholder="사진을 선택하세요." name="event_img">
    </div>
    
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="content"
    name="event_content" placeholder="${aa.event_content }"></textarea>
 	</div>
 	
 	  <div class="form-group">
      <label for="day" >이벤트 기간</label>
     (<fmt:parseDate value="${aa.event_sday}" var="startDate" pattern="yyyy-MM-dd HH:mm:ss" />
    <fmt:formatDate value="${startDate}" pattern="yyyy/MM/dd" />
    ~ 
    <fmt:parseDate value="${aa.event_fday}" var="endDate" pattern="yyyy-MM-dd HH:mm:ss" />
    <fmt:formatDate value="${endDate}" pattern="yyyy/MM/dd" />)<br>
      <input type="date" class="form-control" id="day" name="event_sday"> ~ <input type="date" class="form-control" id="day" name="event_fday">
    </div>
    
       <div class="form-group">
	   <label for="title" >이벤트 진행상황</label><br>
	   <input type="radio" name="event_state" value="ing_event" checked="checked">진행중
       <input type="radio" name="event_state" value="finish_event">종료<br>
       
        <input type="hidden" value="${list.get(0).event_no }" name="event_no" >
    </div>
    <button type="submit" class="btn btn-default" style="float: right;">등록</button>
    </c:forEach>
  </form>
</div>
</body>
</html>