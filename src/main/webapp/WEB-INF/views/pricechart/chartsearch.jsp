<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.chart-container{
	width:800px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items:center;
	margin: 0 auto;
}
.maplink{
width: 300px;
height: 300px;
background-color: gray;
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;
}

.maplink{
font-size: xx-large;
color: white;
margin: 15px ;
}
.click-container{
	display: flex;
	flex-wrap: wrap;
	align-items:center;
	justify-content: center;
	
}

form>input[type="text"] {
	width: 350px;
	height: 50px;
	border-color: green;
	border-radius: 10px 0 0 10px;

}

form>input[type="submit"] {
	background-color:white;
	border-color: green;
	border-left:none;
	height: 50px;
	width:40px;
	border-radius: 0 10px 10px 0;
	
}
</style>
</head>
<body>
<div class="chart-container" >
<h2>시세 검색 키워드</h2>
<form action="searchresult" method="post" >
<input type="text" name="chartsearch" id="chart-search-input" placeholder="  어떤 제품의 시세가 궁금 하신가요?"><input type="submit" value="검색">
</form>

<div class="click-container" >
<div class="maplink">
<a>지도로 검색</a>
</div>

<div class="maplink">
<a>인기품목 검색</a>
</div>

<div class="maplink">
<a>추천 검색</a>
</div>

<div class="maplink">
<a>새로 등록된 물품</a>
</div>
</div>
</div>

</body>
</html>