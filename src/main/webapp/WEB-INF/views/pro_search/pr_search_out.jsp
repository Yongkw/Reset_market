<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style type="text/css">
.resultcontainer a{
    color: rgb(33, 33, 33);
    text-decoration: none;
    cursor: pointer;
}

.dCIUug {
    width: 100%;
    margin: auto;
    padding: 3.5rem 0px 1.5rem;
}
.kSnlsd {
    display: flex;
    flex-wrap: wrap;
}
.eCFZgW {
    width: 196px;
    margin-right: 11px;
    margin-bottom: 11px;
    margin-left: 11px;
} 

.iizKix {
    border: 1px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    display: block;
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



.pagebox{
margin: 0 auto;
background: white;
width: 300px;
height: 45px;
border: 2px solid #dcdcdc ;
border-radius: 100%;
position: relative;
display: flex;
justify-content: space-evenly;
align-items: center;
}
.pr-search-top{
	height: 100px;
}
.pr-search-top>span{
	width:200px;
	height: 100px; 
	margin:50px;
	font-size: xx-large;
	color: rgb(220,220,220);
}
</style>

<script>  
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
</head>
<body>
<div class="resultcontainer" style="margin: 0 auto; width:70%;  " > 
 
<!--  -->

	<section class="dCIUug">
	<div class="pr-search-top" ><span > 검색 결과 </span></div>
		<!-- 상품리스트 시작 -->
		<div class="kSnlsd">
		
		
		 <c:forEach items="${list}" var="aa"  varStatus="loop">
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
			</c:forEach>
		</div>
	</section>

<!--  -->
<div class="pagebox">

<c:choose>
<c:when test="${page.now == 1 }">
<span><a>이전</a></span>
</c:when>
<c:otherwise>
<span><a href="pr_search?navbar_p=${find}&&pr_page=${page.now-1}" >이전</a></span>
</c:otherwise>
</c:choose> 

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