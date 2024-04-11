<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

.main {
  max-width: 1000px;
  margin: auto;
  position: relative; /* 상대적 위치 설정 */
}

.topnav {
  margin-left: 320px;
  margin-right: 390px;
  overflow: hidden;
  background-color: white;
  border-bottom: 1px solid #ccc;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-size: 17px;
  margin-top: 15px;
  border-bottom: 3px solid transparent;
}

.topnav a:hover {
  border-bottom: 3px solid green;
}

.topnav a.active {
  border-bottom: 3px solid green;
}

.accordion {
  background-color: white;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  border-bottom: 1px solid #ccc;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: #f4f4f4;
  overflow: hidden;
}

.faqtable_header {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	height: 40px;
	margin-top: 10px;
	border-top: 3px solid #000;
	border-bottom: 1px solid #000;
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
<title>Insert title here</title>
</head>
<body>      

<div class="main">

<div class="topnav">
  <a class="active" href="#notice_out">공지사항</a>
  <a href="#news">1:1문의</a>
  <a href="#contact">사기등록</a>
</div>


<h2>🔎 공지사항</h2>
 
<div class="faqtable_header"> 
		<p>
		<span style="float: left; margin-left: 40px; margin-top: 8px;">구분</span>
		<span style="float: left; margin-left: 70px; margin-top: 8px;">제목</span>
		<span style="float: left; margin-left: 750px; margin-top: 8px;">등록일</span>
		</p>
</div>


<c:forEach items="${list }" var="aa">

	<button class="accordion">
		<span style="float: left; margin-left: 5px;">${aa.notice_category }</span>
		<span style="margin-left: 55px;">${aa.notice_title } </span>
		<span style="float: right;">${aa.notice_time } </span>
	</button>

<div class="panel" style="display: none;"> 
  <p style="margin-top: 50px; margin-left:110px; white-space:pre;">${aa.notice_content }</p>
  <img alt="" src="./image/${aa.notice_img }" width="200px" height="200px" style="margin-top: 50px; margin-left:380px;"><br>
  
 	<input type="hidden" value="${list.get(0).notice_no }" name="notice_no" >
 	
   <div class="btn-container" style="float: left; margin-bottom: 15px;">
	    <button type="button" class="btn" onclick="location.href='noticeupdate?notice_no=${aa.notice_no }'">수정</button>  
	    <button type="button" class="btn" onclick="location.href='del?notice_no=${aa.notice_no }'">삭제</button>
   </div>
</div>

</c:forEach>
<div class="search-wrap">
     <button type="submit" class="btn btn-dark" onclick="location.href='noticeform'" style="float: left; margin-top: 10px;">작성하기</button>
     <a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none;"> TOP </a>
</div>

</div>


<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
</body>
</html>