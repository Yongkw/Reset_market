<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.0/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css">
  <script src="https://cdn.jsdelivr.net/npm/@fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
<style type="text/css">
.row1 {
	margin:0px auto;
   width: 1000px;
   height: 1500px;
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
        <button type="button" class="btn" onclick="location.href='swindle_main'">목록</button>
        <button type="button" class="btn" onclick="location.href='swindle_update?swindle_no=${aa.swindle_no}'">수정</button>  
        <button type="button" class="btn" onclick="location.href='swindle_del?swindle_no=${aa.swindle_no}&case_img=${aa.case_img}'">삭제</button>    
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
      </table>
 <!---------------------- 이전/다음글 ----------------------------------->   
      <ul class="near_list mt20">
	<!-- 
	1.글이 2개인 경우 -이전글 번호<현재글 번호인 경우 이전글
	2.글이 1개인 경우 -리스트 길이가 1이고, 글 번호<현재글 번호인 경우는 다음글이 없음
	--> 
	<c:forEach var="aa" items="${list}">
		<c:if test="${fn:length(list)==1 and aa.swindle_no<vo.tno }">
			<li><h4 class="prev">다음글</h4>마지막 글입니다.</li>
		</c:if>
		<c:if test="${aa.swindle_no<vo.tno }">
			<li><h4 class="next">이전글</h4><a href="notice_view?swindle_no=${aa.swindle_no}">${aa.swindle_title }</a></li>
		</c:if>
		<c:if test="${aa.swindle_no>vo.tno }">
			<li><h4 class="prev">다음글</h4><a href="notice_view?swindle_no=${aa.swindle_no}">${aa.swindle_title }</a></li>
		</c:if>
		<c:if test="${fn:length(list)==1 and aa.swindle_no>vo.tno }">
			<li><h4 class="next">이전글</h4>첫번째 글입니다.</li>
		</c:if>
	</c:forEach>
</ul>
    
     </div>
   </div>
</body>
</html>