<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
.main-div {
	width: 100%;
	display: flex;
}

.search-list {
	width: 250px;
	height: 300px;
	margin: 10px 10px 10px 30px;
	border: 3px solid #DCDCDC;
	border-radius: 15px;
}

.search-list-div {
	width: 235px;
	height: 280px;
	margin-top: 5px;
	margin-left: 5px;
}

.search-top {
	
}

.search-top>a {
	margin: auto;
}

.search-list-div>span {
	width: 216px;
	height: 216px;
}

.search-list-div>span>img {
	border-radius: 10%;
	border: none;
}

.main_slide{

}

</style>

</head>
<body>
<div style="margin: 0 auto; width:75%; border: 1px solid gray ; " >
<div style=" margin:0px 30px 0px 30px; overflow: hidden; " >
<h3>리셋마켓에서 추천 상품</h3>
		<div style="margin: 0 auto; width:100%; border: 3px solid #DCDCDC; transform:" class="main-slide-div" >
		<div id="search-top">
			<span style="height: 80px;"></span>
		</div>
		<div class="main-div">
 
			<c:forEach var="i" items="${main_list}">
				<a href="productout?title=${i.title}">
				<div class="search-list">
					<div class="search-list-div">
						<span><img alt="상품 이미지" src="./image/${i.product_image}" width="200px"
							height="200px"></span>

						<table width="216px" height="70px" style="margin-top: 10px;">
							<tr>
								<td colspan="2"><a style="font-weight: bolder;">${i.title}</a></td>
							</tr>
							<tr>
								<td colspan="2"><a>${i.location}</a></td>
							</tr>
							<tr>
								<td><a>${i.price}</a></td>
								<td style="width: 14%;"><a>${i.view_cnt}</a></td>
							</tr>
						</table>
					</div>
				</div>
				</a>
			</c:forEach>
		</div>
		</div>
		<input type="radio" class="main_slide" id="slide_div1" name="slide" >
		<input type="radio" class="main_slide" id="slide_div2" name="slide" >
		<hr>
		
<h3>최근 등록된 상품</h3>
		<div style="margin: 0 auto; width:100%; border: 3px solid #DCDCDC;">
		<div id="search-top">
			<span style="height: 80px;"></span>
		</div>
		<div class="main-div">

			<c:forEach var="i" items="${main_list3}">

				<div class="search-list">
					<div class="search-list-div">
						<span><img alt="상품 이미지" src="./image/${i.product_image}" width="200px"
							height="200px"></span>

						<table width="216px" height="70px" style="margin-top: 10px;">
							<tr>
								<td colspan="2"><a style="font-weight: bolder;">${i.title}</a></td>
							</tr>
							<tr>
								<td colspan="2"><a>${i.location}</a></td>
							</tr>
							<tr>
								<td><a>${i.price}</a></td>
								<td style="width: 14%;"><a>${i.view_cnt}</a></td>
							</tr>
						</table>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
		<hr>
		
<h3>추천 상품</h3><div style="margin: 0 auto; width:100%; border: 3px solid #DCDCDC;">
		<div id="search-top">
			<span style="height: 80px;"></span>
		</div>
		<div class="main-div">

			<c:forEach var="i" items="${main_list2}">

				<div class="search-list">
					<div class="search-list-div">
						<span><img alt="상품 이미지" src="./image/${i.product_image}" width="200px"
							height="200px"></span>

						<table width="216px" height="70px" style="margin-top: 10px;">
							<tr>
								<td colspan="2"><a style="font-weight: bolder;">${i.title}</a></td>
							</tr>
							<tr>
								<td colspan="2"><a>${i.location}</a></td>
							</tr>
							<tr>
								<td><a>${i.price}</a></td>
								<td style="width: 14%;"><a>${i.view_cnt}</a></td>
							</tr>
						</table>
					</div>
				</div>
			</c:forEach>
		</div>
		</div>
		<hr>
		
		
	</div>
</div>

</body>
</html>