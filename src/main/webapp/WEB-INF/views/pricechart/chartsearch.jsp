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
	width:1200px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items:center;
	margin: 0 auto;
} 

.maplink{
font-size: xx-large;
margin: 15px ;
}
.click-container{
	display: flex;
	flex-wrap: wrap;
	align-items:center;
	justify-content: center;
	
}

form>input[type=text] {
	width: 350px;
	height: 50px;
	border-color: green;
	border-radius: 10px 0 0 10px;

}

form>input[type=submit] {
	background-color:white;
	border-color: green;
	border-left:none;
	height: 50px;
	width:40px;
	border-radius: 0 10px 10px 0;
	
}

.maplink{
width: 500px;
height: 500px;
background-color: #4d4d4d;
display: flex;
justify-content: center;
align-items: center;
border-radius: 30px;

position: relative;
overflow: hidden; 
}

.maplink>img{
	position: absolute;
	width: 100%;
	height: 100%;
	margin: 0 auto;
	top: 0;
	left: 0;
	opacity:0.7; 
	transition: all 1s ease-out;
}

.maplink:hover{
 >img{
	width: 150%;
	height: 150%;
	top: -75px;
	left: -75px;
	opacity:0.1;
	}
 }

.maplink:hover >p{
	width: 100%;
	height:36%;
	padding-top:13%;
	background-color:#1e1919;
	text-align:center;
	font-size: x-large;
	color: white;
}

.chart-container p{margin: 0; transition: all 0.5s;} 
</style>
</head>
<body>
<div class="chart-container" >
<h2>시세 검색 키워드</h2>
<form action="searchresult">
<input type="text" name="chartsearch" id="chart-search-input" placeholder="  어떤 제품의 시세가 궁금 하신가요?"><input type="submit" value="검색">
</form>

<div class="click-container" >
<div class="maplink" onclick="location.href='mapview'" >
<img src="./image/mapimage.PNG">
<p>지도로 검색</p>
</div>

<div class="maplink" onclick="location.href='searchresult'">
<img src="./image/chartimage.PNG">
<p>인기품목 검색</p>
</div>


</div>
</div>

</body>
</html>