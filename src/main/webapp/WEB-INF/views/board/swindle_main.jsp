<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
  padding-bottom: 80px;
  position: relative; /* 상대적 위치 설정 */
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 0px 0;
}
.page-title {
  margin-bottom: 20px;
}

h4 {
    font-size: 24px;
    margin-bottom: .5rem;
    font-weight: 500;
    line-height: 1.2;
    width: 1000px;
    height: 28.8px;
    margin: 0 0 8px;
}
.page-title h4 {
  color: #353535;
  max-width:1000px;
  padding-bottom: 60px;
  border-bottom: 1px solid black;
}

.page-title h3 {
  color: #353535;
  padding-top:5px;
  font-size: 15px;
  font-weight: normal;
}

.page-title h5  {
  color: #aaaaaa;
  font-size: 12px;
  font-weight: normal;
}

#board-search .search-window {
  padding: 10px 0;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 100%;
  max-width: 1100px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}
.board-table a:hover {
  text-decoration: underline;
}
.board-table th {
  text-align: center;
}

.board-table .th-num {
  width: 100px;
  text-align: center;
}

.board-table .th-date {
  width: 200px;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p{
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

ul {
    display: block;
    margin-bottom: 10px;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    unicode-bidi: isolate;
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

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 1000px;
  margin: 0 auto;
  padding: 0rem 0rem;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
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

   <ul class="sc-4icuvf-0 bJyhFc" style="margin-top: 30px;">
   <li class=""><a href="notice_out">FAQ</a></li>
   <li class=""><a href="personal_form">1:1문의</a></li>
   <li class="on"><a href="swindle_main">사기등록</a></li>
   </ul>


<section class="notice">
  <div class="page-title">
        <div class="container">
           <h1><strong>안전하고 편리한 중고거래 서비스</strong></h1>
           <h4> 거래 전 사기 이력 조회부터 피해 시 피해 보상제까지</h4>
        </div>     
    </div> 
  <div class="page-title">
      <div class="container">
    <div style="display: inline-block;">
        <h2><strong>Reset Market 사기조회</strong></h2>
        <h3>중고거래 플랫폼, 커뮤니티 어디에서 거래하든 사기 피해사례를 조회할 수 있어요.</h3>
    </div>
    <div style="display: inline-block; cursor: pointer; margin-left: 20px; float: right;">
        <img src="./image/graphicon.png" onclick="location.href='python1'" width="70px" height="70px" style="margin-left: 30px;" >
        <h5>※연도별 그래프 보러가기</h5>
    </div>
</div>

  
 </div> 
    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="swindlesearch" method="post">
                    <div class="search-wrap">
                        <label for="search" class="blind">사기 피해 검색여부</label>
                        <input id="search" type="search" name="swindle_search" placeholder="검색하고자 하는 내용을 입력하세요." value="">
                        <button type="submit" class="btn btn-dark">조회</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   <div class="page-title"  style="text-align: center;">
        <div class="container"  style="text-align: left;">
           <h5>리셋마켓 데이터베이스에 누적 등록된 사기 피해사례를 토대로 조회합니다.(사이버범죄 신고시스템 추가 예정)</h5>
        </div>
        <img alt="" src="./image/swindle_mainimg.png" width="1000px">      
 </div> 
  

  
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="aa">
                <tr>
                    <td>${aa.swindle_no }</td>
               <td><a href="swindledetail?swindle_no=${aa.swindle_no }">${aa.swindle_title }</a></td>
                    <td>${aa.create_at }</td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
             <button type="submit" class="btn btn-dark" onclick="location.href='swindlemore'" style="float: right; margin-top: 10px;">더보기</button>
        </div>
        
    </div>

</section>
<div class="search-wrap" style="text-align: center;">
     <button type="submit" class="btn btn-dark" onclick="location.href='swindleform'">작성하기</button>
     <a href="javascript:void(0);" id="scroll" title="Scroll to Top" style="display: none; margin-left: 1200px;"> TOP </a>
</div>
</div>

</body>
</html>