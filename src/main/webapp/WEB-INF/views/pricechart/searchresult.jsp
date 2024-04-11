<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>


<style type="text/css">
.back>div{

}
#chart-search{
width: 90%;
margin-left:0 auto;
}
#chart-search-input{
width: 90%;

}

/* 상품 리스트 */

.pr-main-div{
width:100%;
display: flex;
flex-wrap: wrap;
}

.pr-search-list{
width: 250px;
height:300px;
margin: 10px 10px 10px 30px;

border: 3px solid gray ;
border-radius: 15px;

}



.pr-search-list-div {
  width: 235px;
  height: 280px;
  margin-top: 5px;
  margin-left: 5px;

}
.pr-search-top{
 
}
.pr-search-top>a{
 margin: auto;
}
  .pr-search-list-div > span{
    width:216px;
    height:216px;
    
  }
.pr-search-list-div>span>img{
  	border-radius: 10%;
  	border: none;
}


</style>

</head>
<body>
<div style="margin: 0 auto; width: 80%;" class="back" >

<div><!-- 검색 --><!-- 검색은 카테고리,제품명 기준으로-->
<div id="chart-search" >
<form action="searchresult" method="post" >
<input type="text" name="chartsearch" id="chart-search-input" placeholder="어떤 제품의 시세가 궁금 하신가요?"><input type="submit" value="검색">
</form>
</div>
</div>

<div><!-- 차트 -->
<h1>${findname} 검색 결과</h1>
<input type="hidden" id="find" value="${findname}" >
<hr>

<canvas id="myChart" width="500" height="200"></canvas>

</div>

<div><!-- 최근 등록된 상품 -->
<h2>많이 본 상품</h2>
<div class="pr-main-div">
<c:forEach var="i" items="${count_list}" begin="0" end="11" step="1" >
<div class="pr-search-list"  >
	<div class="pr-search-list-div" >
	<span><img alt="상품 이미지" src="./image/${i.product_image}" width="200px" height="200px" ></span>
	
	<table width="216px" height="70px" style="margin-top:10px;" >
	<tr> <td colspan="2" ><a style="font-weight:bolder;" >${i.title}</a></td></tr>
	<tr> <td colspan="2"><a>${i.location}</a></td></tr>
	<tr> <td><a>${i.price}</a></td>  <td style="width: 14%;" ><a>${i.view_cnt}</a></td></tr>
	</table>	
	</div>
</div>
</c:forEach>
</div>


</div>

<div><!-- 새상품 -->

<hr>
<br>
<h2>최근 등록된 상품</h2>
<div class="pr-main-div">
<c:forEach var="i" items="${date_list}" begin="0" end="11" step="1" >

<div class="pr-search-list" >
	<div class="pr-search-list-div" >
	<span><img alt="상품 이미지" src="./image/${i.product_image}" width="200px" height="200px" ></span>
	
	<table width="216px" height="70px" style="margin-top:10px;" >
	<tr> <td colspan="2" ><a style="font-weight:bolder;" >${i.title}</a></td></tr>
	<tr> <td colspan="2"><a>${i.location}</a></td></tr>
	<tr> <td><a>${i.price}</a></td>  <td style="width: 14%;" ><a>${i.view_cnt}</a></td></tr>
	</table>	
	

	</div>
</div>
</c:forEach>
</div>


</div>

</div>
<script type="text/javascript" >	

$(function () {
	var priceSet=[]; //차트 데이터
	var dateSet=[];
	var findname = $('#find').val();
	console.log(findname);
        $.ajax({
            url: 'ajaxtest', // 서버의 엔드포인트 URL
            type: 'POST', // HTTP 메소드
            data: { 'findname': findname }, // 보낼 데이터, 여기서는 예시로 'iddd'라는 키에 데이터를 넣습니다.	
            success: function(tt){ // 요청 성공 시 실행될 콜백 함수
                console.log('차트 : 데이터 불러오기 성공'); // 성공 메시지 출력
                
                var ttt = JSON.parse(tt);
                for(var i in ttt){
                	console.log(ttt);
                	dateSet.push(i+'월');
                	priceSet.push(ttt[i]);
                }
            	console.log(priceSet);
            	console.log(dateSet);	
            	
                var chartArea = document.getElementById('myChart').getContext('2d');
            	var myChart = new Chart(chartArea, {
            	    type: 'line',
            	    data: {
            	        labels: dateSet ,
            	        datasets: [{
            	            data: priceSet,
            	            // dataset의 배경색(rgba값을 String으로 표현)
            	            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            	            // dataset의 선 색(rgba값을 String으로 표현)
            	            borderColor: 'rgba(255, 99, 132, 1)',
            	            // dataset의 선 두께(Number)
            	            borderWidth: 1
            	        }]
            	    },
            	    options: {
            	    	responsive:false,//크기 지정
            	        scales: {
            	            y: {
            	                beginAtZero: false,
            	            }
            	        }
            	    }
            	});
            	
            	
                
            },
            error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
                console.error(error); // 에러 메시지를 콘솔에 출력
                console.log('실패'); // 실패 메시지 출력
            }
        });
    
	
	

	
	
});

</script>
</body>
</html>