<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.back>div{

}
#chart-search{
width: 90%;
margin-left:0 auto;
}
#chart-search-input{
width: 90%;
margin-left:0 auto;

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

<div><!-- 추천 제품 검색어 -->
</div>

<div><!-- 최근 조회한 검색어 -->
<h2></h2>
<h3></h3>
</div>

<div><!-- 실시간/인기 검색어 -->
</div>

</div>
</body>
</html>