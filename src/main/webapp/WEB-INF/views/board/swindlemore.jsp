<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
table {
  border-collapse: collapse;
  border-spacing: 0;
}
section.notice {
  padding: 80px 0;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 0px 0;
  background-color: white;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 1px;
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
  width: 1100px;
  margin: 0 auto;
  padding: 0
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>사기조회 게시판</h3>
            <img alt="" src="./image/swindleboard.png" width="1100px">
            <hr>
        </div>   
    </div>
 	   
    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="swindlesearch1" method="post">
                    <div class="search-wrap">
                        <label for="search" class="blind">사기 피해 검색여부</label>
                        <input id="search" type="search" name="swindle_search" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">조회</button>
                    </div>
                </form>
            </div>
        </div>
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
                
                
                <!--페이징처리 6단계  -->
			 <tr style="border-left: none;border-right: none;border-bottom: none">
			   <td colspan="65" style="text-align: center;">
			   
			   <c:if test="${paging.startPage != 1 }">
			      <a href="swindlemore?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}">◀</a>	      
			   </c:if>   
			   
			      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
			         <c:choose>
			            <c:when test="${p == paging.nowPage}">
			               <b><span style="color: red;">${p}</span></b>
			            </c:when>   
			            <c:when test="${p != paging.nowPage }">
			               <a href="swindlemore?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
			               
			            </c:when>   
			         </c:choose>
			      </c:forEach>
			     
			      <c:if test="${paging.endPage != paging.lastPage}">
			      <a href="swindlemore?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">▶</a>
			  	 </c:if>	
			   
			   </td>
			</tr>
            </table>
        </div>
    </div>
<div class="search-wrap" style="text-align: center; margin-top: 20px;">  
     <button type="submit" class="btn btn-dark" onclick="location.href='swindleform'">작성하기</button>
</div>

</section>

</body>
</html>