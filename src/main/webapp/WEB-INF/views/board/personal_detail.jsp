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
     <h1>1:1문의 상세보기</h1>
     
     <div class="row row1"> 
      <table class="table">
      <c:forEach items="${list }" var="aa">
        <tr>
         <th width=20% class="text-center warning">작성자</th>
         <td width=30% class="text-center">${aa.personal_id }</td>
         <th width=20% class="text-center warning">작성일</th>
         <td width=30% class="text-center">${aa.create_at }</td>
        </tr>
        <tr>
         <th width=20% class="text-center warning">제목</th>
         <td width=30% class="text-center">${aa.personal_title }</td>
         <th width=20% class="text-center warning">답변여부</th>
         <td width=30% class="text-center">${aa.answer_state }</td>
        </tr>
             
        <tr>
          <td colspan="4" class="text-left" valign="top" height="200">
       <div class="btn-container" style="float: right;">   
        <c:if test="${sessionScope.member_id eq 'admin'}">
        <button type="button" class="btn" onclick="location.href='personal_update?personal_no=${aa.personal_no}'">답변하기</button>     
   	   </c:if>
   	   </div><br>
           <pre style="white-space: pre-wrap;border:none;background-color: white; text-align: center; margin-top: 20px;">${aa.personal_content }</pre>
          </td>
        </tr>           
       </c:forEach>
       
       
       <tr>
       	  <th width=20% class="text-center warning" valign="middle" style="padding-top: 100px;">문의사진</th>
       	 
          <td colspan="4" class="text-center" valign="top" height="220">
           <c:forEach var="cc" begin="0" end="${img.size()-1}" step="1">
           <img src="./image/${img.get(cc)}" width="200px" height="200px">
             </c:forEach>          
          </td>
		
        </tr>
        <tr>
       	  <th width=20% class="text-center warning" valign="middle" style="padding-top: 100px;">답변내용</th>
       	 
          <td colspan="4" class="text-center" valign="top" height="220" style="white-space:pre;">
           <c:forEach items="${list }" var="aa">
           ${aa.answer_content }
           </c:forEach>          
          </td>
		
        </tr>

        
        
      </table>
      
	<div class="btn-container" style="text-align: center;">
        <button type="button" class="btn btn-dark btn-lg" onclick="location.href='info_out'">목록</button>        
   	 </div><br>
     </div>
     
   </div>
</body>
</html>