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
  margin-bottom: 60px;
}

.topnav {
  margin-left: 320px;
  margin-right: 422px;
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
	border-top: 2px solid #000;
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

/*  버튼 스타일 */
.btn-container {
  display: flex;
  justify-content: center;
}

.btn { 
  margin-top: 10px;
  margin-right: 10px;
  margin-bottom: 10px;
  outline: none;
  border: 0.0625rem solid #999;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}

.button {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 5px 5px;
  cursor: pointer;
  border-radius: 16px;
}

.button:hover {
  background-color: #f1f1f1;
}
.bJyhFc {
    display: inline-flex;
    overflow: hidden;
    position: relative;
    width: 100%;
    box-sizing: border-box;
}
.bJyhFc li.on {
    background-color: rgb(31, 31, 31);
    border: 1px solid rgb(31, 31, 31);
}

.bJyhFc li.on > a {
    color: rgb(255, 255, 255);
}


.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
}


.bJyhFc li {
    flex: 1 1 0%;
    float: left;
    border-top: 1px solid rgb(222, 222, 222);
    border-right: 1px solid rgb(222, 222, 222);
    border-left: 1px solid rgb(222, 222, 222);
    border-bottom: 1px solid rgb(222, 222, 222);
    box-sizing: border-box;
    text-align: center;
}

.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
    color: rgb(170, 170, 170);
}

a {
    text-decoration: none;
    color: rgb(102, 102, 102);
    cursor: pointer;
}
</style>
<title>Insert title here</title>
</head>
<body>      

<div class="main">

	<ul class="sc-4icuvf-0 bJyhFc" style="margin-top: 30px;">
	<li class="on"><a href="notice_out">FAQ</a></li>
	<li class=""><a href="personal_form">1:1문의</a></li>
	<li class=""><a href="swindle_main">사기등록</a></li>
	</ul>

<h2>FAQ</h2>
 
<div class="faqtable_header"> 
		<p>
		<span style="float: left; margin-left: 40px; margin-top: -8px;">구분</span>
		<span style="float: left; margin-left: 70px; margin-top: -8px;">제목</span>
		<span style="float: left; margin-left: 750px; margin-top: -8px;">등록일</span>
		</p>
</div>

<c:forEach items="${list }" var="aa">
	<button class="accordion">
		<span style="float: left; margin-left: 5px;">${aa.notice_category }</span>
		<span style="margin-left: 55px;">${aa.notice_title } </span>
		<span style="float: right;">${aa.notice_time } </span>
	</button>
<div class="panel" style="display: none; "> 
  <p style="margin-top: 50px; margin-left:110px; white-space:pre;">${aa.notice_content }</p>
  <img alt="" src="./image/${aa.notice_img }" width="200px" height="200px" style="margin-top: 50px; margin-left:380px;"><br>
  
 	<input type="hidden" value="${list.get(0).notice_no }" name="notice_no" >
 	
   <div class="btn-container" style="float: left; margin-bottom: 15px;">
   <c:if test="${sessionScope.member_id eq 'admin'}">
	    <button type="button" class="btn" onclick="location.href='noticeupdate?notice_no=${aa.notice_no }'">수정</button>  
	    <button type="button" class="btn" onclick="location.href='del?notice_no=${aa.notice_no }'">삭제</button>
	     </c:if>
   </div>
</div>

</c:forEach>
<div class="btn-container">
	 <c:if test="${sessionScope.member_id eq 'admin'}">
     <button type="submit" class="btn btn-dark" onclick="location.href='noticeform'" style="float: left; margin-top: 10px;">작성하기</button>
     </c:if>
     <a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none; float: right;"> TOP </a>
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