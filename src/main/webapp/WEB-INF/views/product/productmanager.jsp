<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<c:set var="now" value="${System.currentTimeMillis()}" />
<link href="${path}/resources/css/promanager.css?v=${now}" rel="stylesheet" />

</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
    $(".cfkuaA").click(function(){
        $(this).siblings(".efSUdZ").toggle(); // 형제 요소인 .efSUdZ를 toggle
    });
    $(".gQomUt").mouseenter(function(){
        $(this).addClass("kMEBRe").removeClass("gQomUt"); // 해당 클래스를 변경
    }).mouseleave(function(){
        $(this).addClass("gQomUt").removeClass("kMEBRe"); // 해당 클래스를 변경
    });
    $(".gQomUt").click(function(){
        var value = $(this).text(); // 선택한 요소의 텍스트 가져오기
        $(this).closest(".efSUdZ").siblings(".cfkuaA").find(".css-1uccc91-singleValue").text(value); // 현재 요소의 부모 요소인 .cfkuaA를 찾고 그 안에 있는 .css-1uccc91-singleValue에 텍스트 설정
        $(".efSUdZ").removeAttr("style");
    });
 
 	$(".statesave").click(function(){
	   	var str1= $(this).attr("id").substr(10);
	   	var str2 = $(this).val()
	   	var str3 = stateEncod(str2);
	   	console.log(str1,str2,str3)
	  	var item = $(".listset[data-prductno='"+str1+"']"); 
	    // AJAX 요청을 보냅니다.
    
	    $.ajax({
	        type: "POST", // 또는 GET
	        url: "pro_state", // 요청을 처리할 컨트롤러 URL
	        data: {"state": str2,"state2" : str1}, // 보낼 데이터 (예: 상태값)
	        success: function() {
	        	item.removeClass("sale").removeClass("trading").removeClass("saleEnd").addClass(str3)
				
	        },
	        error: function(xhr, status, error) {
	            // 요청이 실패하면 이 함수가 호출됩니다.
	            console.error(error);
	            // 에러 처리
	        }
	    });
	});
    $(".prodelect").click(function(){ 
        var productNo = $(this).attr("id").replace("pro_delect3", ""); // 클릭된 버튼의 ID에서 상품 번호 추출
        var data = {"productNo": productNo}; // 삭제할 상품의 번호를 데이터로 설정
	  	var item = $(".listset[data-prductno='"+productNo+"']"); 
        $.ajax({
            type: "POST",
            url: "pro_delect", // 삭제를 처리할 URL
            data: data,
            success: function() {
                // 성공 시 실행할 코드
                console.log('delete') 
                item.remove();
            },
            error: function(xhr, status, error) {
                // 오류 처리
            }
        });
    });
    
 	$('.sangselect').on("click",function(){
	 	var findestate = $(this).data("text");
	 	var showstate;
	 	$('.listset').css("display","none");
	 	
	 	if(findestate=='판매중')showstate='sale';
	 	else if(findestate=='거래중')showstate='trading';
	 	else if(findestate=='판매완료')showstate='saleEnd';
	 	else $('.listset').removeAttr("style"); 
	 	
	 	$('.listset.'+showstate).removeAttr("style");
 	});
 	
 	function stateEncod(state){
 		var restate;
	 	if(state=='판매중')restate='sale';
	 	else if(state=='거래중')restate='trading';
	 	else restate='saleEnd';
 		return restate;
 	} 
});

// JavaScript를 사용하여 클래스 변경
document.addEventListener('DOMContentLoaded', function() {
    // 모든 .sangselect 요소에 대해 이벤트 리스너 추가
    document.querySelectorAll('.sangselect').forEach(item => {
        item.addEventListener('click', event => {
            // 모든 sangselect 클래스에서 sangselect_red 클래스를 제거
            document.querySelectorAll('.sangselect').forEach(el => el.classList.remove('sangselect_red'));
            // 클릭된 div에 sangselect_red 클래스 추가
            event.target.classList.add('sangselect_red');
            
        });
    });
});
 


//판매중일떄..

</script>
<div class="kXbHsX">
   <main class="gWXLML">
      <header class="cYodSH">
                     <form action="prosearch" class="cPIzmp" style="margin-left: 1rem" method="get">
                <input type="text" placeholder="상품을 입력해주세요" name="search">
            <button type="submit" class="eEJEPk">
            </button>
         </form>
         <div class="fHXDuD">
            <div class="css-2b097c-container">
               
               <div class="cfkuaA">
                  <div class="css-1hwfws3">
                     <div class="css-1uccc91-singleValue">5개씩</div>
                  </div>
                  <div class="hoYcgM"></div>
               </div>
               <div class="efSUdZ">
                  <div class="kJZJBa">
                  <!-- 
                  <div id="test_1" tabindex="-1" class="kMEBRe">10개씩</div> -->
                     <div class="gQomUt">5개씩</div>
                     <div class="gQomUt">10개씩</div>
                     <div class="gQomUt">15개씩</div>
                  
                  </div>
               </div>
            </div>
         </div>
         <div style="display: flex; align-items: center; margin-left: auto;">
            <div>
               <div style="display:flex; column-gap: 24px;">
                  <div class="sangselect" data-text="전체">전체</div>
                  <div class="sangselect" data-text="판매중">판매중</div>
                  <div class="sangselect" data-text="거래중">거래중</div>
                  <div class="sangselect" data-text="판매완료">판매완료</div>
               </div>
            </div>
         </div>
      </header>
      
      <table>
         <thead>
            <tr>
               <th>사진</th>
               <th>판매상태</th>
               <th>상품명</th>
               <th>가격</th>
               <th>찜</th>
               <th>최근수정일</th>
               <th>조회수</th>
               <th>기능</th>
            </tr>
         </thead>
         <tbody>
         <c:forEach items="${list}" var="aa">
         <c:choose>
         	<c:when test="${aa.product_state eq '판매중'}"><c:set var="state" value="sale" /></c:when>
         	<c:when test="${aa.product_state eq '거래중'}"><c:set var="state"  value="trading" /></c:when>
         	<c:otherwise><c:set var="state" value="saleEnd" /></c:otherwise>
         </c:choose>
         <tr class="listset ${state}"  data-prductno="${aa.product_no}" >
            <td>
               <a href="#">
               <img src="./image/${aa.main_image}" width="152" height="152">
               </a>
            </td>
            <!--판매 상태 -->
            <td class="padiv1">
               <div class="css-2b097c-container"> 
                  <div class="cfkuaA">
                     <div class="css-1hwfws3">
                        <div class=" css-1uccc91-singleValue" style="text-align: center;">${aa.product_state}</div>
                     </div>
                     <div class="hoYcgM"></div>
                  </div>
                  <div class="efSUdZ">
                  <div class="kJZJBa">
                     
                     <div class="gQomUt"><button CLASS="statesave" type="button" id="pro_state1${aa.product_no }" value="판매중">판매중</button></div>
                     <div class="gQomUt"><button CLASS="statesave" type="button" id="pro_state2${aa.product_no }" value="거래중" >거래중</button></div>
                     <div class="gQomUt"><button CLASS="prodelect" type="button" id="pro_delect3${aa.product_no }" value="삭제">삭제</button></div>
                     <div class="gQomUt"><button CLASS="statesave" type="button" id="pro_state4${aa.product_no }" value="판매완료">판매완료</button></div>
                      
                      <!-- 
                      <div class="gQomUt"><input type="button" class="test1" id="test1_${aa.product_no}" value="판매중"> </div>
                     <div class="gQomUt"><button CLASS="test1" type="button" v>거래중</button></div>
                     <div class="gQomUt"><button CLASS="test1" type="button" >삭제</button></div>
                     <div class="gQomUt"><button CLASS="test1" type="button" >판매완료</button></div>
                      -->
                  </div>
               </div>
               </div>
            </td>
            <!-- 상품명 -->
            <td>
                                   <a href="productout?product_no=${aa.product_no}">${aa.title}</a>
            </td>
            <!-- 가격 -->
            <td>
            ${aa.price}
            </td>
            <!-- 찜 -->
            <td>
            0
            </td>
            <!-- 최근 수정일 -->
            <td>
            ${aa.update_at}
            </td>
            <!-- 조회수 -->
            <td>
            ${aa.view_cnt}
            </td>
            <!-- 기능 -->
            <td>
            <button class="eNwDap" >
                                   <a href="pro_update?product_no=${aa.product_no}" >수정</a>
            </button>
            </td>
         </tr>
         </c:forEach>
         
      </tbody>
      </table>
      
   </main>
</div>

</body>
</html>