<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html> 
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<head>
 <style type="text/css">
 .listcontainer{
	width: 600px;
	height: 790px;
	background: #486100; 
	margin: 0 auto;
 }
 .messlist{
	margin: 0 auto;
	width: 100%;
 	height: 720px;
 	background:#f5fff8;
 	overflow: auto;
 }
 .mess{
 	margin-top:5px;
	margin: 0 auto;
 	border:1px solid #DCDCDC;
 	border-radius:5px;
 	width: 95%;
 	height: 150px;
 	display: flex; 
 	position: relative;
 	background: #f4fffe;
 }
 .mess label{
	position: absolute;
	width: 100%;
	height: 100%; 
 }
 .profileimg{
	width: 150px;
	height: 150px;
 }
 .profileimg>div{
 	width: 95%;
 	height: 95%;
 	background:white;
 	margin: 0 auto;
 }
 .profileimg img{
 	width:100%;
 	height: 100%;
 }
 .messdata{
 	width: 400px;
 	height: 100%;
 }
 
 .messdata>div:first-child{
 	width: 100%;
 	height: 70%;
 	overflow: hidden;
 	padding-top: 10px; 
    padding-left: 15px;
 	color: #505743ab;
 }
 .messdata>div:first-child p{
 	margin: 5px;
 	font-size: large;
 	font-weight:bold;
 }
 .messdata>div:first-child p:nth-child(1){
 	float:right;
	color: #87a783;
	margin-right: 15px;
 }
 
 .messdata>div:last-child{
 	width: 100%;
 	height: 30%;
 	overflow: hidden;
 	display: flex;
    padding-left: 15px;
    padding-right: 5px;
 	color: #505743ab;
 	justify-content: space-between;
 }
.btnset{
	width: 100%;
	height: 50px;
	background: #c8ebc4; 
	display: flex;
	justify-content: space-around;
}
.btnset>input[type=button]{
	border: 1px solid #87a783;
	background: #b1d1ad; 
	width:25%;
	font-size:x-large;
	color:#486100;
	
	&:hover{
		background: #477942;
		color:white;
	}
}
.btnset>input:first-child{border-left: none;}
.btnset>input:last-child{border-right: none;}
hr{margin: 1px auto;    width: 97%;    border: 1px solid #dae9da;}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('.updateTime').each(function() {
        var timestamp = $(this).data('timestamp');
        $(this).text(formatTime(timestamp));
    });
    $('.btn-state').on("click",function(){
    	var state = $(this).val();
    	$('.mess').css("display","none");
    	$('.mess[data-state='+state+']').css("display","flex");
    });

    $('.btn-stateall').on("click",function(){
    	var state = $(this).val();
    	$('.mess').css("display","flex");
    });

     
});

function formatTime(timestamp) {
    var now = new Date();
    var updateTime = new Date(timestamp);
    var timeDiff = now - updateTime;

    // 시간 간격을 계산하여 표시 형식을 결정합니다.
    // 이 부분은 원하는 표시 형식으로 변경할 수 있습니다.
    if (timeDiff < 60000) {
        return '방금 전';
    } else if (timeDiff < 3600000) {
        return Math.floor(timeDiff / 60000) + '분 전';
    } else if (timeDiff < 86400000) {
        return Math.floor(timeDiff / 3600000) + '시간 전';
    } else if (timeDiff < 2592000000) {
        return Math.floor(timeDiff / 86400000) + '일 전';
    } else {
        return Math.floor(timeDiff / 2592000000) + '달 전';
    }
} 
</script>
</head>
<body> 
		<div class="listcontainer"> 
			<div class="btnset" >
				<input type="button" class="btn-stateall" value="전체보기">
				<input type="button" class="btn-state" value="판매중">
				<input type="button" class="btn-state" value="거래중">
				<input type="button" class="btn-state" value="판매완료">
			</div>
			
			
			<div class="messlist">
			<c:forEach items="${list}" var="i" > 
			
			<div data-state="${i.pr_state}"  class="mess" onclick="location.href='resetchat2?bno=${i.board_no}&pno=${i.pr_no}'">
				<div class="profileimg">
					<div>
					<img alt="" src="./image/${i.pr_image}">
					</div>
				</div>
				<div class="messdata">
					<div>
						<p><c:if test="${i.last_check !=0}">${i.last_check}</c:if></p>
						<p>${i.pr_title}</p> 
						<p> 판매자 : ${i.member_name}</p>
					</div>
					<div>
					<c:choose>
						<c:when test="${i.text!=' '}"><p>${i.text}<p></c:when> 
						<c:otherwise><p> (사진) </p></c:otherwise>
					</c:choose>
					<div class="updateTime"  data-timestamp="${i.chatdate}"></div> 
					</div>
				</div> 
			</div>	
			<hr>
			</c:forEach>
				
			</div> 
		</div> 
</body>

</html>
 