<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style type="text/css">

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
.pagebox{
margin: 0 auto;
background: white;
width: 300px;
height: 45px;
border: 2px solid #dcdcdc ;
border-radius: 100%;
position: relative;
display: flex;
justify-content: center;
align-items: center;
}
</style>

</head>
<body>
<div style="margin: 0 auto; width:80%; border: 3px solid #DCDCDC ;  " >
<div id="pr-search-top" ><span style="height: 80px; " ></span></div>
<div class="pr-main-div">
<c:forEach var="i" items="${list}">

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


<div class="pagebox">
<span><a href="pr_search?navbar_p=${find}&&pr_page=${page.now-1}" >이전</a></span>

<c:forEach begin="${page.start}" end="${page.end}" var="i" step="1" >
<span>
<c:choose>
<c:when test="${i eq page.now}">
<a>${i}</a>
</c:when>

<c:otherwise>
<a href="pr_search?navbar_p=${find}&&pr_page=${i}" >${i}</a>
</c:otherwise>
</c:choose>

</span>
</c:forEach>

<c:choose>
<c:when test="${page.now>=page.end}">
<span><a>다음</a></span>
</c:when>
<c:otherwise>
<span><a href="pr_search?navbar_p=${find}&&pr_page=${page.now+1}" >다음</a></span>
</c:otherwise>
</c:choose>
</div>

</div>

</body>
</html>