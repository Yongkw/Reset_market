<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<link href="${path}/resources/css/promanager.css" rel="stylesheet" />

</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
    $(".cfkuaA").click(function(){
        $(this).siblings(".efSUdZ").toggle(); // 형제 요소인 .efSUdZ를 toggle
    });
    $(".gQomUt").mouseenter(function(){
        $(this).addClass("kMEBRe").removeClass("gQomUt"); // 해당 클래스를 변경
    }).mouseleave(function(){
        $(this).addClass("gQomUt").removeClass("kMEBRe"); // 해당 클래스를 변경
    });
    $(".gQomUt").click(function(){
        var value = $(this).text(); // 선택한 요소의 텍스트 가져오기
        $(this).closest(".efSUdZ").siblings(".cfkuaA").find(".css-1uccc91-singleValue").text(value); // 현재 요소의 부모 요소인 .cfkuaA를 찾고 그 안에 있는 .css-1uccc91-singleValue에 텍스트 설정
    });
});

// JavaScript를 사용하여 클래스 변경
document.addEventListener('DOMContentLoaded', function() {
    // 모든 .sangselect 요소에 대해 이벤트 리스너 추가
    document.querySelectorAll('.sangselect').forEach(item => {
        item.addEventListener('click', event => {
            // 모든 sangselect 클래스에서 sangselect_red 클래스를 제거
            document.querySelectorAll('.sangselect').forEach(el => el.classList.remove('sangselect_red'));
            // 클릭된 div에 sangselect_red 클래스 추가
            event.target.classList.add('sangselect_red');
        });
    });
});
</script>
<div class="kXbHsX">
	<main class="gWXLML">
		<header class="cYodSH">
			<form action="" class="cPIzmp" style="margin-left: 1rem">
				<input type="text" placeholder="상품을 입력해주세요">
				<button type="submit" class="eEJEPk">
				</button>
			</form>
			<div class="fHXDuD">
				<div class="css-2b097c-container">
					<span class="css-1laao21-a11yText">
						<span>
							&nbsp;
							option 10개씩, selected.
						</span>
						<span>
						   &nbsp;
						       0 results available. Select is focused , press Down to open the menu,  
						</span>
					</span>
					<div class="cfkuaA">
						<div class="css-1hwfws3">
							<div class="css-1uccc91-singleValue">5개씩</div>
						</div>
						<div class="hoYcgM"></div>
					</div>
					<div class="efSUdZ">
						<div class="kJZJBa">
						<!-- 
						<div id="test_1" tabindex="-1" class="kMEBRe">10개씩</div> -->
							<div class="gQomUt">5개씩</div>
							<div class="gQomUt">10개씩</div>
							<div class="gQomUt">15개씩</div>
						
						</div>
					</div>
				</div>
			</div>
			<div style="display: flex; align-items: center; margin-left: auto;">
				<div>
					<div style="display:flex; column-gap: 24px;">
						<div class="sangselect">전체</div>
						<div class="sangselect">판매중</div>
						<div class="sangselect">거래완료</div>
						<div class="sangselect">판매완료</div>
					</div>
				</div>
			</div>
		</header>
		
		<table>
			<thead>
				<tr>
					<th>사진</th>
					<th>판매상태</th>
					<th>상품명</th>
					<th>가격</th>
					<th>찜</th>
					<th>최근수정일</th>
					<th>조회수</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<a href="#">
					<img src="https://media.bunjang.co.kr/product/260585830_1_1713429659_w304.jpg"width="152" height="152">
					</a>
				</td>
				<!--판매 상태 -->
				<td class="padiv1">
					<div class="css-2b097c-container"> 
						<div class="cfkuaA">
							<div class="css-1hwfws3">
								<div class=" css-1uccc91-singleValue" style="text-align: center;">판매중</div>
							</div>
							<div class="hoYcgM"></div>
						</div>
						<div class="efSUdZ">
						<div class="kJZJBa">
						<!-- 
						<div id="test_1" tabindex="-1" class="kMEBRe">10개씩</div> -->
							<div class="gQomUt">거래중</div>
							<div class="gQomUt">삭제</div>
							<div class="gQomUt">판매완료</div>
						
						</div>
					</div>
					</div>
				</td>
				<!-- 상품명 -->
				<td>
					<a>상품명</a>
				</td>
				<!-- 가격 -->
				<td>
				15,000원
				</td>
				<!-- 찜 -->
				<td>
				0
				</td>
				<!-- 최근 수정일 -->
				<td>
				2024-05-01 17:39
				</td>
				<!-- 조회수 -->
				<td>
				0
				</td>
				<!-- 기능 -->
				<td>
				<button class="eNwDap" >
					<a href="#" >수정</a>
				</button>
				</td>
			</tr>
			
			<tr>
				<td>
					<a href="#">
					<img src="https://media.bunjang.co.kr/product/260585830_1_1713429659_w304.jpg"width="152" height="152">
					</a>
				</td>
				<!--판매 상태 -->
				<td class="padiv1">
					<div class="css-2b097c-container"> 
						<div class="cfkuaA">
							<div class="css-1hwfws3">
								<div class=" css-1uccc91-singleValue" style="text-align: center;">판매중</div>
							</div>
							<div class="hoYcgM"></div>
						</div>
						<div class="efSUdZ">
						<div class="kJZJBa">
						<!-- 
						<div id="test_1" tabindex="-1" class="kMEBRe">10개씩</div> -->
							<div class="gQomUt">거래중</div>
							<div class="gQomUt">삭제</div>
							<div class="gQomUt">판매완료</div>
						
						</div>
					</div>
					</div>
				</td>
				<!-- 상품명 -->
				<td>
					<a>상품명</a>
				</td>
				<!-- 가격 -->
				<td>
				15,000원
				</td>
				<!-- 찜 -->
				<td>
				0
				</td>
				<!-- 최근 수정일 -->
				<td>
				2024-05-01 17:39
				</td>
				<!-- 조회수 -->
				<td>
				0
				</td>
				<!-- 기능 -->
				<td>
				<button class="eNwDap" >
					<a href="#" >수정</a>
				</button>
				</td>
			</tr>
		</tbody>
		</table>
		
	</main>
</div>

</body>
</html>