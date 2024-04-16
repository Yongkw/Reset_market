<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $('#scroll').fadeIn();
        } else {
            $('#scroll').fadeOut();
        }
    });
    $('#scroll').click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, 600);
        return false;
    });
});
</script>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
  position: relative; /* 상대적 위치 설정 */
}

.main.name {
  height: 40px;
  border-bottom: 2px solid #241d1e;
}

/* 버튼 스타일 */

.btn-container {
  display: flex;
  justify-content: center;
}

.btn {
  margin-top: 10px;
  margin-right: 10px;
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: #f6fcf4;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}
.event-container {
  text-align: center; /* 가운데 정렬 */
}

#scroll {
  position: absolute; /* 절대 위치 설정 */
  right: 10px;
  bottom: 10px;
  cursor: pointer;
  width: 50px;
  height: 50px;
  background-color: white;
  text-indent: 0; /* 텍스트 숨기는 스타일 제거 */
  display: none;
  border: 2px solid #000;
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  text-align: center; /* 텍스트 가운데 정렬 */
  line-height: 50px; /* 이미지의 크기에 맞게 조절하세요 */
  color: black; /* 텍스트 색상 설정 */
  font-weight: bold; /* 텍스트 굵기 설정 */
  text-decoration: none; /* 링크 텍스트의 밑줄 제거 */
  
}

#scroll span {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -8px;
  margin-top: -12px;
  height: 0;
  width: 0;
  border: 8px solid transparent;
  border-bottom-color: #ffffff
}

#scroll:hover {
  background-color: #f4f4f4;
  opacity: 1;
  filter: "alpha(opacity=100)";
  -ms-filter: "alpha(opacity=100)";
}
</style>
</head>
<body>

<!-- MAIN (Center website) -->
<div class="main">
<div class="main name">
<h2> 🍀 Event</h2>
</div>
 <c:forEach items="${list }" var="aa">
<div class="event-container">
<h3>${aa.event_title }</h3> 
<h5 align="right"><img src="./image/eye_cnt.png" width="30px" height="30px"> ${aa.event_cnt }</h5>
  <img alt="" src="./image/${aa.event_img }" width="700px" height="1500px"><br>			
   <h4 style="margin-top: 50px; white-space:pre;">${aa.event_content}</h4><br>      
 </div>
 

    <div class="btn-container">
    <button type="button" class="btn" onclick="location.href='event_update?event_no=${aa.event_no }'">수정</button>  
    <button type="button" class="btn" onclick="location.href='event_del?event_no=${aa.event_no}&event_img=${aa.event_img}'">삭제</button>
    <button type="button" class="btn" onclick="location.href='event_out'">목록</button>
    </div>
    </c:forEach>
<!-- END MAIN -->

<a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;"> TOP </a>
</div>
</body>

</html>
