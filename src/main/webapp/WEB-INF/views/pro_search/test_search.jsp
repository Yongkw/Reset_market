<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">


<script>
    $(document).ready(function(){
        $.ajax({
            url: 'ajaxtest', // 서버의 엔드포인트 URL
            type: 'POST', // HTTP 메소드
            data: { 'iddd': '' }, // 보낼 데이터, 여기서는 예시로 'iddd'라는 키에 데이터를 넣습니다.	
            success: function(tt){ // 요청 성공 시 실행될 콜백 함수
                console.log(tt); 
                console.log('성공'); // 성공 메시지 출력
                
                var ttt = JSON.parse(tt);
                for(var i in ttt){
                	var c = ttt[i];
                	console.log(c);
                }
                
            },
            error: function(xhr, status, error){ // 요청 실패 시 실행될 콜백 함수
                console.error(error); // 에러 메시지를 콘솔에 출력
                console.log('실패'); // 실패 메시지 출력
            }
        });
    });
</script>

<title>Insert title here</title>
</head>
<body>
	<div style="margin: 0 auto; width: 70%; height: 2000px; border: 1px solid gray;">
		<a href="main_view">메인 뷰</a><br>
		<a href="event_input_view">이벤트 추가 뷰</a><br>
		<a href="pricechart_view">시세 검색</a><br>
		<a href="test_search">태스트 뷰</a><br>
		<input type="text" value="" id="search">


		</div>
</body>
</html>