<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">

* {
	margin: 0;
	padding: 0;
}

ul li {
	list-style: none;
	
}
/* a밑줄 제거*/
a{
	text-decoration: none;
}

:root{
	--nav-height : 120px; /*네비바 높이*/
	--nav-height2 : 60px; /*카테고리 박스 위치 네비바 높이 - 60*/
}
.nav-bar>div {
	height: 100%;
	position:relative ;
	z-index: 100;
}
.nav-bar {
	width: 100%; 
	height:var(--nav-height);
	position: relative;
	top: 0px;
	z-index: 100;
	background: #FCFCFC;	
	box-shadow: 0px 3px 3px 0px #008000 ;
}

.nav-bar-log{
	margin: 0 auto;
	width: 8%; 
	float: left;
	overflow: hidden;
	}
.nav-bar-log>a>img{
	position: relative;
	z-index:101;
	height: 100%;
	left:50%;
	top:50%;
	transform:translate(-50%,-50%);
}
	
.div1{
	width: 5%;
	float: left;
}
.div1>div{
	margin-top: var(--nav-height2);
}
.div1>div>div{
	float:right;
	outline: 0;
	border:  0;
}
	
.div2{
	width: 87%; 
	float: left;
	position: static;
	}
.nav-bar-div {
	width:100%;
	height:50%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-left:5%; 
	padding-right: 5%;
	
	}
	
.nav-bar-div>span{
	margin-left : 2%;
	margin-right :2%;
	width:80%;
	height: 50%;
	border-radius: 4px;
	text-align: center;
	font-size: large;
}
.nav-bar-div>span>label{
	margin:0;
	width: 100%;
	height: 100%;
	display:flex;
    justify-content: center; /* 자식 요소를 가로(수평) 기준으로 가운데 정렬시킴 */
    align-items: center; /* 자식 요소를 세로(수직) 기준으로 가운데 정렬시킴 */
}
.nav-bar-div>span>label:hover{
	box-shadow: inset 0 -4px 4px -4px #ad4232 ;
		
}
.nav-bar-div>span>label>a{
color: #b8d8b8;
}

.nav-bar-div>span>label:hover>a{
	color: #649a64;
	text-decoration: none;
	
}
.div2-2{
	position:relative ;
	z-index: 99;
	width:100%;
	height:50%;
	left: 56%;
	transform:translate(-50%,0);
	display: flex;
	justify-content: center;
	}
	.div2-2>form{
	height: 100%;
	width: 80%; 
	display: flex;
	justify-content: center;
	align-items: center;
	}
.div3{
width: 25%;
float: right;

}

.div3-1{
	width:100%;
	height:50%;
	}
.div3-1>span{
	width: 100%;
	margin-top:5%;
	margin-left:10%;
	display:inline-block;
	font-size: small;
	}
	
.div3-1>span a{
	margin-left: 5%;
	}
	
.div3-2{
	width:100%;
	height:50%;
	}


.search-bar {
	margin: 0 auto;
	width: 65%;
	height: 50%;
	border-radius: 15px;
	border: solid 1px #006400;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.search-bar>div{
	height:100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.search-bar>div>p{
	color: gray;
	white-space: nowrap;
	margin: 0;
}
.search-a {/*검색 구간*/
	width: 85%;
	position: relative;
	overflow: hidden;
}
#select-kategori{
border:none;
margin-left: 3px;
white-space: nowrap;
color: gray;
}
.search-b {/*버튼 구간*/
	margin-right:2%;
	height:100%;
	width:8%;
	position: relative;
	float: right;
	display: block;
	justify-content: center;
}
.search-bar_input {
	background: none;
	width: 30%;
	height: 25px;
	border: none;
	-webkit-appearance: none;/*버튼 속성지우기*/
	text-align: center;
	margin-left: 10px;
	overflow: auto;
	font-size: 15px;
	transition: ease 0.5s;
}

.search-bar_input:hover {
	outline: none;
	width: 80%;
	text-align: left;
	border-bottom: 1px solid #006400;
}

.search-bar_input:focus {
	outline: none;
	width: 95%;
	text-align: left;
	border-bottom: 1px solid #006400;
}

.search-submit {
	background: none;
	border: none;
	margin: 0 auto;
}



.kategorielist{
	clear:both;
	width: 20%;
	height: 250px !important ;
	margin: 0 auto;
	box-shadow: inset 0px 3px 3px 0px #008000 ;
	display: none;
	overflow: hidden;
	position: relative;
	right: 30%;
	border: 1px #008000 solid;
	
}
.kategorielist>div{
height:100%;
overflow: scroll;
background:#fcfcfc;
}
.kategorielist>div::-webkit-scrollbar{
  display:none;
}
.kategorie-a{
width: 35%;
}
.kategorie-b{
width: 65%;
}

.kategorielist>div>ul{
font-size: medium;
}

.kategorielist>div>ul>li{
width:100%;
height:38px;
text-align: center;
}
.kate-btnb:hover {
	border-bottom: 1px solid #008000;
}

.kategorielist>div>ul>li>input {
width: 100%;
height: 100%;
border: none;
background: none;
text-align: center;
width: 90%;
box-sizing: border-box;
}

.katebar{
width: 50px;
height: 50px;
background: #006400;
display:flex;
flex-direction: column;
justify-content: space-around;
align-items: center;
border-radius: 8px;
position: relative;
}
.katebar>div{
border:2px solid white ;
border-radius: 2px;

}
</style>
</head>
<body>
	<div class="nav-bar" id="nav-bar">
		<div class="nav-bar-log">
		
			<a href="main">
			<img alt="logimg" src="./image/log_s.png">
			</a>
		</div>
		
		
		<div class="div1">
			<div >
					<!-- <img src="./image/1_1.png" style="width: 100%;" > -->
					<div class="katebar">
					<div class="katebar2" style="position: absolute; width: 100%;height: 100%;"></div>
					<div style="width: 70%; height: 2px;  margin-top: 10%;  "></div>
					<div style="width: 70%; height: 2px;"></div>
					<div style="width: 70%; height: 2px; margin-bottom: 10%;"></div>
					</div>
					
			</div>
			
		</div>
		<div class="div2">
		
			<div class="div2-2">
					<form action="pr_search" method="get" >
				<div class="search-bar">
					<label for="search-bar_input" style="width: 100%; height: 100%;  position: absolute;z-index: 101" ></label> 
						<div style = "border-right: 1px dotted green" ;><p>검색창</p></div>
						<div id="select-kategori"  ></div>
						<div class="search-a">
							<input type="hidden" value="" id="findkate" name="findkate" >
							<input class="search-bar_input" type="text"name="navbar_p" id="search-bar_input" />
						</div>
						<div class="search-b">
							<input type="submit" style="position: relative; z-index: 102 " class="search-submit" value="검색">
						</div>
				</div>
					</form>
					
				<div class="div3" >
				<div class="div3-1" >
				<c:choose>
				<c:when test="${loginstate==true}"><!-- 로그인 상태 세션에 따른 변화 -->
					<span>
					<span style="color:black">${member_id}님!</span>
					<a href="#">마이페이지</a>
					<a href="logout">로그 아웃</a>
					</span>
				</c:when>
				<c:otherwise>
					<span>
					<a href="login" >로그인</a>
					<a href="signup">회원 가입</a>
					</span>
				</c:otherwise>
				</c:choose>
				</div>
				
				</div>	
			</div>
		<div id="menu" class="nav-bar-div">
				<span><label for="link-1" ><a id="link-1" href="#" >1번링크</a></label></span>
				<span><label for="link-2" ><a id="link-2" href="#" >2번링크</a></label></span>
				<span><label for="link-3" ><a id="link-3" href="#" >3번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >4번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >5번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >6번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >7번링크</a></label></span>
				<span><label for="link-4" ><a id="link-4" href="#" >8번링크</a></label></span>
			</div>
			
			<!-- contents 1  -->
			<div class="menu-contents">
		
			</div>		<!-- contents 1 end -->
				
		</div>
	
	<div class="kategorielist" id="kategorielist">
	<div class="kategorie-a">
	<ul >
	<li class="kate-a1"><input type="button" id="kate-a1" class="kate-btna" value="의류/잡화" ></li>
	<li class="kate-a2"><input type="button" id="kate-a2" class="kate-btna" value="가전" ></li>
	<li class="kate-a3"><input type="button" id="kate-a3" class="kate-btna" value="홈인테리어" ></li>
	<li class="kate-a4"><input type="button" id="kate-a4" class="kate-btna" value="뷰티" ></li>
	<li class="kate-a5"><input type="button" id="kate-a5" class="kate-btna" value="운동용품" ></li>
	</ul>
	</div>
	<div class="kategorie-b" id="kategorie-b">
	<ul class ="tttt">
	</ul>
	</div>
	
	
	</div>
		
	</div>
	
	<script type="text/javascript">

    $(document).ready(function(){
    	var id_check;
    	var class_check;
    	var val_check ;
    	$('.katebar2,#kategorielist').hover(function(){
    		$('#kategorielist').css("display","flex");

    	});	
    	$('#kategorielist').mouseleave(function(){
    	    var timer = setTimeout(function() {
    	    	$('#kategorielist').css("display","none");
    	    	
    	    }, 500);

    	    //타이머를 제거하여 이벤트를 방지
    	    $('.katebar2, #kategorielist').mouseenter(function() {
    	        clearTimeout(timer);
    	    });
    	});
    	
   		$(".kate-btna").hover(function(){
   			class_check=$(this).attr("class");
       		id_check = $(this).attr("id"); //카테고리 a 아이디 요소의 값 클레스값도 가져오기 가능
       		val_check = $(this).val(); //값
       		$(this).attr("backgrond","gray")
       		var kateb_list = [];
       		kateb_list = addlist(val_check,id_check); // val값, 저장값 참조 하여 리스트를 가져옴
       		kate_list_add(kateb_list);//리스트 매개변수
       		
   		});
   		function addlist(val_check,id_check) {
   			var kateb_list =[];
			$('.kate-btna').css("border","0px");
			$('#'+id_check).css("border-bottom","1px #008000 solid");
			if(val_check=="의류/잡화"){
				kateb_list.push('여성의류');
				kateb_list.push('남성의류');
				kateb_list.push('패션잡화');
				kateb_list.push('명품/브랜드');
				kateb_list.push('기타의류/잡화');
			}
			else if(val_check=="가전"){
				kateb_list.push('스마트폰/태블릿');
				kateb_list.push('노트북/PC');
				kateb_list.push('주방가구/기기');
				kateb_list.push('티비/영상가전');
				kateb_list.push('냉장고/세탁기/건조기');
			}
			else if(val_check=="홈인테리어"){
				kateb_list.push('가구');
				kateb_list.push('홈데코');
				kateb_list.push('수납/정리');
				kateb_list.push('침구');
				kateb_list.push('커튼/블라인드');
			}
			else if(val_check=="뷰티"){
				kateb_list.push('스킨케어');
				kateb_list.push('클렌징/필링');
				kateb_list.push('메이크업');
				kateb_list.push('향수');
				kateb_list.push('남성화장품');
			}
			else{
				kateb_list.push('등산/캠핑');
				kateb_list.push('낚시/낚시용품');
				kateb_list.push('자전거/킥보드');
				kateb_list.push('기타 스포츠/레저용품');
				
			}
			return kateb_list;
		}   	
   		
   		function kate_list_add(kateb_list){
   			var kate_list = $("#kategorie-b>ul"); 
   			kate_list.children().remove(); //기존에 남아있는 리스트를 삭제
   			
   			for(var i in kateb_list){
   			kate_list.append("<li class='kate-b'><input type='button' class='kate-btnb' value='"+kateb_list[i]+"' ></li>"); //리스트추가
   			}
   			
   		}
   		
   	 
   	   	
	});

    $(document).on("click", ".kate-btnb", function(){ //카테고리 함수1 검색에 추가
    	var kate = $(this).val();
    	$('#select-kategori').text(kate+" >");
    	$('#findkate').val(kate);
    	console.log($('#findkate').val());
    	
    });
	/*	
    $(document).on("click", ".kate-btnb", function(){ //카테고리 함수2 바로 링크
    	var kate = $(this).val();
    	location.replace('#?kate='+kate);
    });
    */
		</script>

</body>
</html>