<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>


<style type="text/css">

#chart-search{
width: 90%;
margin:0 auto;
}
#chart-search>form{
width: 100%;
margin: 0 auto;
display: flex;
justify-content: center;
align-items: center;
}
form>input[type="text"] {
	width: 350px;
	height: 50px;
	border-color: green;
	border-radius: 10px 0 0 10px;
	text-align: center;
}
form>input[type="submit"] {
	background-color:white;
	border-color: green;
	border-left:none;
	height: 50px;
	width:40px;
	border-radius: 0 10px 10px 0;
	
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
  width: 100%;
  height: 100%; 
  overflow: hidden;

}
.pr-search-list-div table{
  margin-left: 15px;
  margin-right: 15px;
}

.pr-search-top{
 
}
.pr-search-top>a{
 margin: auto;
}
  .pr-search-list-div>span{
    width:216px;
    height:216px;
    
  }
.pr-search-list-div>span>img{
  	border-top-left-radius : 5%;
  	border-top-right-radius : 5%;
  	border: none;
}
#pr_list{
margin: 25px ;
padding: 25px 15px 15px 15px;
background-color: white;
height: 350px;
overflow-y:auto;
 
}
#pr_list::-webkit-scrollbar {
  display: none;
}
#pr_list>li{
margin-top: 15px;
font-size: x-large;
color: gray;
}
#pr_list li::before {
	content: '● ';
	color: gray;
	margin-right: 5px;
}
#pr_list li::after {
    content: "";
    display: block;
    height: 1px;
    border-bottom: 3px dotted #DCDCDC;
    margin: 0 auto;
}

</style>

</head>
<body>
<div style="margin: 0 auto; width: 80%; position: relative; top: 50px;" class="back" >

<div><!-- 검색 --><!-- 검색은 카테고리,제품명 기준으로-->
<div id="chart-search" >
<form action="searchresult" method="post" >
<input type="text" name="chartsearch" id="chart-search-input" placeholder="어떤 제품의 시세가 궁금 하신가요?"><input type="submit" value="검색">
</form>
</div>
</div>

<h1>${findname} 검색 결과</h1>
<input type="hidden" id="find" value="${findname}" >
<hr>
<div style="display: flex; flex-wrap: wrap; padding: 20px; " >
<canvas id="myChart" width="900" height="400"></canvas>
<div style=" margin-left:20px; width:450px; height:400px; background-color: green ;" >
<ul id="pr_list" >
	

</ul>
</div>
</div>

<div><!-- 최근 등록된 상품 -->
<h2>많이 본 상품</h2>
<div class="pr-main-div">
<c:forEach var="i" items="${count_list}" begin="0" end="11" step="1" >
<div class="pr-search-list"  >
	<div class="pr-search-list-div" >
	<span><img alt="상품 이미지" src="./image/${fn:substring(i.product_image,0,fn:indexOf(i.product_image,','))}" width="100%" height="200px" onerror="this.onerror=null; this.src='./image/1_1.png';" ></span>
	<table width="216px" height="70px" style="margin-top:10px;" >
	<tr> <td colspan="2" ><a style="font-weight:bolder;" >${i.title}</a></td></tr>
	<tr> <td colspan="2"><a>${i.location}</a></td></tr>
	<tr> <td><a>${i.price}</a></td>  <td style="width: 30%;" ><a>조회수 ${i.view_cnt}</a></td></tr>
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
	<span><img alt="상품 이미지" src="./image/${fn:substring(i.product_image,0,fn:indexOf(i.product_image,','))}" width="100%" height="200px" onerror="this.onerror=null; this.src='./image/1_1.png';" ></span>
	
	<table width="216px" height="70px" style="margin-top:10px;" >
	<tr> <td colspan="2" ><a style="font-weight:bolder;" >${i.title}</a></td></tr>
	<tr> <td colspan="2"><a>${i.location}</a></td></tr>
	<tr> <td><a>${i.price}</a></td>  <td style="width: 30%;" ><a>조회수 ${i.view_cnt}</a></td></tr>
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
	var listsave = document.getElementById('pr_list');
	console.log(findname);
        $.ajax({
            url: 'chartDataSet', // 서버의 엔드포인트 URL
            type: 'POST', // HTTP 메소드
            data: { 'findname': findname }, // 보낼 데이터
            success: function(tt){ // 요청 성공 시 실행될 콜백 함수
                console.log('차트 : 데이터 불러오기 성공'); 
            	console.log(tt);
                var ttt = JSON.parse(tt);
                for(var i in ttt){ 
                	var a =Object.keys(ttt[i])[0]; 
                	var value = ttt[i][a];
                	dateSet.push(a);
                	priceSet.push(value); 
                	listsave.insertAdjacentHTML('afterbegin','<li>'+a+' 평균 거래가'+value+'원</li>');
                }
            	console.log(priceSet);
            	console.log(dateSet);	
            	
                var chartArea = document.getElementById('myChart').getContext('2d');
            	var myChart = new Chart(chartArea, {
            	    type: 'bar',
            	    data: {
            	        labels: dateSet ,
            	        datasets: [{
            	        	lable:'test1',
            	        	type:'line',
            	        	data: priceSet,
            	            backgroundColor: '#003399',
            	            borderColor: '#990000',
            	        },{
            	        	lable:'test2',
            	        	data: priceSet,
            	            backgroundColor: '#003399',
            	            borderColor: 'rgba(153, 0, 0, 1)',
            	            borderWidth: 1
            	        }
            	        ]
            	    },
            	    options: {
            	    	responsive:false,//크기 지정
            	    	title:{
            	    		display:true,
            	    		text: 'Mixed Chart Types' 
            	    	},
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