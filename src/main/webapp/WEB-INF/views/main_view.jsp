<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<head>
<!-- bxslider cdn시작 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- bxslider cdn끝 -->
<jsp:include page="main_popup.jsp" />
<style type="text/css">
.dCIUug {
    width: 1024px;
    margin: auto;
    padding: 3.5rem 0px 1.5rem;
}

.dCIUug h2 {
    font-size: x-large;
    font-weight: 549;
    margin-bottom: 1.5rem;
}

h1, h2, h3, h4, h5, h6 {
    font-size: 14px;
    font-weight: 400;
    margin: 0px;
}
.kSnlsd {
    display: flex;
    flex-wrap: wrap;
}
.eCFZgW {
    width: 196px;
    margin-right: 11px;
    margin-bottom: 11px;
}
.iizKix {
    border: 1px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    display: block;
}
a {
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}

.eSpfym {
    position: relative;
    width: 100%;
    height: 194px;
}
.ikEnr {
    padding: 15px 10px;
    height: 80px;
}

.gwleiO {
    position: relative;
    font-size: 14px;
    padding-bottom: 20px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.ldPLFl {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    align-items: center;
    height: 20px;
}

.moVyh {
    font-size: 16px;
    font-weight: 600;
   	text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}

.moVyh::after {
    content: "원";
    font-size: 13px;
    margin-left: 3px;
}
.eYNXkt {
    font-size:12px;
    color:rgb(136,136,136);
}

.fanqbi {
    background: white;
}
.bInodS {
    min-width: 1236px;
}
.eCFZgW:nth-child(5n) {
    margin-right: 0px;
}

.ezgzFX {
    position: relative;
    max-width: 100%;
    margin: 0px auto;
    background: white;
}

.slick-slider {
    position: relative;
    display: block;
    box-sizing: border-box;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
    touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.ezgzFX .slick-prev {
    left: calc(50% - 500px);
    background-image: url(/pc-static/resource/2c3876a….png);
}
.ezgzFX .slick-arrow::before {
    position: absolute;
    display: inline-block;
    content: "";
    font-family: "Noto Sans KR", sans-serif;
    width: 10px;
    height: 10px;
    top: 8px;
    right: 10px;
    color: black;
}


element.style {
    width: 17408px;
    opacity: 1;
    transform: translate3d(-8192px, 0px, 0px);
}
.slick-slider .slick-track, .slick-slider .slick-list {
    -webkit-transform: translate3d(0, 0, 0);
    -moz-transform: translate3d(0, 0, 0);
    -ms-transform: translate3d(0, 0, 0);
    -o-transform: translate3d(0, 0, 0);
    transform: translateZ(0);
}
.slick-track {
    position: relative;
    top: 0;
    left: 0;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.slick-initialized .slick-slide {
    display: block;
}
.dJDUPg {
    text-align: center;
}
.gLLlZb {
    width: 100%;
    position: relative;
    padding-top: 29.1666%;
    cursor: pointer;
}
.sc-krDsej.gLLlZb {
    width: 100%;
    position: relative; /* 추가 */
    padding-top: 29.1666%;
    cursor: pointer;
}
.slick-slide img {
    display: block;
}
.fVUxsR {
    top: 0px;
    left: 0px;
    object-fit: cover;
    position: absolute;
    width: 100%;
    height: 100%;
}
</style>
<!-- bxslider 스크립트 -->
<script>
      $(document).ready(function(){
        $(".mainslider").bxSlider({
        	auto:true
        	
        });
      });
      
      $(document).ready(function() {
          $('.updateTime').each(function() {
              var timestamp = $(this).data('timestamp');
              $(this).text(formatTime(timestamp));
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

<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>
<div class="bInodS">
	<div class="fanqbi">
	<!-- 슬라이드배너 시작 -->
		<div class="ezgzFX">
			 <div class="mainslider">
      <div><img src="https://www.thebodyshop.co.kr/files/public/site/2024/202402/ba4f459a-c4d4-4203-a0a3-0749f46920a2.jpg"></div>
      <div><img src="https://www.thebodyshop.co.kr/files/public/site/2024/202402/12afe1fb-b41e-46cd-8135-94c7860fefb2.jpg"></div>
      <div><img src="https://www.thebodyshop.co.kr/files/public/site/2023/202305/dcb064a5-fee7-4d94-a918-9c242257fdc0.jpg"></div>
    </div>
		</div>
	
	
	<section class="dCIUug">
		<h2>오늘의 추천상품</h2>
		<!-- 상품리스트 시작 -->
		<div class="kSnlsd">
		
		
		 <c:forEach items="${main_list}" var="aa"  varStatus="loop">
		 	<c:if test="${loop.index < 5}">
			<div class="eCFZgW">
			
				<a class="iizKix" href="productout?product_no=${aa.product_no}" >
					<div class="eSpfym">
						<img alt="" src="./image/${aa.main_image}" width="194" height="194">
					</div>
					<div class="ikEnr">
						<div class="gwleiO">${aa.title}</div>
						<div class="ldPLFl"> 
						<div class="moVyh"><fmt:formatNumber value="${aa.price}" pattern="#,###" /> </div>
					<div class="eYNXkt updateTime" data-timestamp="${aa.update_at}"></div>
						</div>
					</div>
				</a>
			</div>
			</c:if>
			</c:forEach>
		</div>
	</section>
	
	<section class="dCIUug">
		<h2>이달의 거래왕</h2>
		<!-- 상품리스트 시작 -->
		<div class="kSnlsd">
		<c:forEach items="${main_list2}" var="aa" varStatus="loop">
		<c:if test="${loop.index < 5}">
			<div class="eCFZgW">
				<a class="iizKix" href="productout?product_no=${aa.product_no}" >
					<div class="eSpfym">
						<img alt="" src="./image/${aa.main_image}" width="194" height="194">
					</div>
					<div class="ikEnr">
						<div class="gwleiO">${aa.title}</div>
						<div class="ldPLFl">
						<div class="moVyh"><fmt:formatNumber value="${aa.price}" pattern="#,###" /> </div>
							<div class="eYNXkt updateTime" data-timestamp="${aa.update_at}"></div>
						</div>
					</div>
				</a>
			</div>
			</c:if>
			</c:forEach>
		</div>
	</section>
	
	<section class="dCIUug">
		<h2>내가 관심있는상품</h2>
		<!-- 상품리스트 시작 -->
		<div class="kSnlsd">
		<c:forEach items="${main_list3}" var="aa" varStatus="loop">
		<c:if test="${loop.index < 5}">
			<div class="eCFZgW">
				<a class="iizKix" href="productout?product_no=${aa.product_no}" >
					<div class="eSpfym">
						<img alt="" src="./image/${aa.main_image}" width="194" height="194">
					</div>
					<div class="ikEnr">
						<div class="gwleiO">${aa.title}</div>
						<div class="ldPLFl">
						<div class="moVyh"><fmt:formatNumber value="${aa.price}" pattern="#,###" /> </div>
							<div class="eYNXkt updateTime" data-timestamp="${aa.update_at}"></div>
						</div>
					</div>
				</a>
			</div>
			</c:if>
			</c:forEach>
		</div>
	</section>

	</div>
	</div>
</body>
</html>