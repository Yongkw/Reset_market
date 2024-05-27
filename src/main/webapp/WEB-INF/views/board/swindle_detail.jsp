<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.0/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css">
  <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<style type="text/css">
.row1 {
	margin:0px auto;
   width: 1000px;
}
h1 {
   text-align: center
}
/* 버튼 스타일 */

.btn-container {
  display: flex;
  justify-content: center;
}

.btn {
  margin-top: 10px;
  margin-right: 5px;
  margin-bottom: 10px;
  border: none;
  outline: none;
  padding: 1px 5px;
  background-color: #ddd;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}
 #nextBoard{
    	border-top: 1px solid #dbdbdb;
    	border-bottom: 1px solid #dbdbdb;
    	width: 1180px;
    	margin-left: 20%;	
    }
    
    #nextBoard tr{
    	height: 60px;
    }
    
    #nextBoard td:nth-child(1){
    	width: 120px;
    	font-size: 14px;
    	line-height: 1.07;
    	text-align: center;
    	color: #767676;
    }
    
     #nextBoard td:nth-child(2){
    	width: 880px;
    	font-size: 16px;
    	padding: 17px 98px 17px 32px;
    }
.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
 
</style>

</head>
<body>

   <div class="container">
     <h1>사기조회 상세보기</h1>
     
     <div class="row row1"> 
      <table class="table">
      <c:forEach items="${list }" var="aa">
        <tr>
         <th width=20% class="text-center warning">작성자</th>
         <td width=30% class="text-center">${aa.victim_id }</td>
         <th width=20% class="text-center warning">작성일</th>
         <td width=30% class="text-center">${aa.create_at }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning">사기범ID</th>
         <td width=30% class="text-center">${aa.suspect_id }</td>
         <th width=20% class="text-center warning">조회수</th>
         <td width=30% class="text-center">${aa.swindle_cnt }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning">제목</th>
         <td colspan="3" style="text-align: center;">${aa.swindle_title }</td>
        </tr>
        
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
       <div class="btn-container" style="float: right;">
       <c:if test="${sessionScope.member_id == aa.victim_id}">
        <button type="button" class="btn" onclick="location.href='swindle_update?swindle_no=${aa.swindle_no}'">수정</button>  
        <button type="button" class="btn" onclick="location.href='swindle_del?swindle_no=${aa.swindle_no}&case_img=${aa.case_img}'">삭제</button>    
   	 	</c:if>
   	 </div><br>
           <pre style="white-space: pre-wrap;border:none;background-color: white; text-align: center; margin-top: 20px;">${aa.case_content }</pre>
          </td>
        </tr>           
       </c:forEach>
       
       
       <tr>
       	  <th width=20% class="text-center warning" valign="middle" style="padding-top: 100px;">피해사진</th>
       	 
          <td colspan="4" class="text-center" valign="top" height="220">
           <c:forEach var="cc" begin="0" end="${img.size()-1}" step="1">
           <img src="./image/${img.get(cc)}" width="200px" height="200px">
             </c:forEach>          
          </td>
		
        </tr>
        <tr></tr>   
        
      </table>
      
 	<div class="my-10 p-10 bg-white rounded shadow-sm" style="border-collapse: collapse;">
	<c:choose >
	<c:when test="${move.next != 9999}">
	
	<button type="button" class="btn btn-outline-secondary mr-10 mb-10" onclick="location.href='swindledetail?swindle_no=${move.next}'">다음글 <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></button>
		<a href="swindledetail?swindle_no=${move.next}" style="color: black; border-collapse: collapse; "> ${move.nexttitle} </a>
	</c:when>
	
	<c:when test="${move.next == 9999}">
	<button type="button" class="btn btn-outline-secondary mr-3 mb-3" disabled> 다음글 <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span> </button>
	다음글이 없습니다
	</c:when>
	</c:choose>
	<br/>
	<c:choose>
	<c:when test="${move.last != 9999}">
	<button type="button" class="btn btn-outline-secondary mr-3 " onclick="location.href='swindledetail?swindle_no=${move.last}'"> 이전글<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> </button>
	<a href="swindledetail?swindle_no=${move.last}" style="color: black"> ${move.lasttitle} </a>
	</c:when>
	
	<c:when test="${move.last == 9999}">
	<button type="button" class="btn btn-outline-secondary mr-3" disabled> 이전글<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> </button>
	이전글이 없습니다
	</c:when>
	</c:choose>
	</div>
	<div class="btn-container" style="text-align: center;">
        <button type="button" class="btn btn-dark btn-lg" onclick="location.href='swindlemore'">목록</button>        
   	 </div><br>
     </div>
     
   </div>
</body>
</html>