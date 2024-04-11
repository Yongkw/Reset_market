<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.midmenu{
	width: 50%; 
	margin: 0 auto;
	position: relative;
	}
.menubar {
	width:100%;
	height:50%;
	display: flex;
	justify-content: space-around;
	align-items: center;
	
	}
	
.menubar>span{
	margin-left:2%; /*span 끼리의 간격 */
	margin-right:2%;
	width:80%;
	border: 1px solid red ;
	border-radius: 4px;
	font-size: large;
}
.menubar>span>label{
margin:0;
width: 100%;
height: 100%;
	display:flex;
    justify-content: center; /* 자식 요소를 가로(수평) 기준으로 가운데 정렬시킴 */
    align-items: center; /* 자식 요소를 세로(수직) 기준으로 가운데 정렬시킴 */
}
.menubar>span>label:hover{
	
	box-shadow: inset 0 -4px 4px -4px red ;
	 
}
.menubar>span>label>a{
color: gray;
text-decoration: none;
}

</style>
</head>
<body>
<div class="midmenu" >
		<div id="menu" class="menubar">
				<span><label for="link-1" ><a id="link-1" href="#" >1번링크</a></label></span>
				<span><label for="link-2" ><a id="link-2" href="#" >2번링크</a></label></span>
				<span><label for="link-3" ><a id="link-3" href="#" >3번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >4번링크</a></label></span>
				<span><label for="link-5" ><a id="link-5" href="#" >5번링크</a></label></span>
				<span><label for="link-6" ><a id="link-6" href="#" >6번링크</a></label></span>
			</div>
</div>
</body>
</html>