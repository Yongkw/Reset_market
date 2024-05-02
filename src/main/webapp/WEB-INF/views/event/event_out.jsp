<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

.main.name {
  height: 40px;
  border-bottom: 2px solid #241d1e;
}

.row {
  margin: 10px -16px;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
}

.h4 {
 padding-top: 30px;
 padding-bottom: 15px;
 
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}


/*  버튼 스타일 */
.btn-container {
  display: flex;
  justify-content: center;
}

.btn { 
  margin-top: 20px;
  margin-right: 10px;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}

.button {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 5px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 5px 5px;
  cursor: pointer;
  border-radius: 16px;
}

.button:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>  

<!-- MAIN (Center website) -->
<div class="main">
<div class="main name">
<h2>Event</h2>
</div>

<div id="myBtnContainer" class="btn-container">
  <button class="btn active" onclick="filterSelection('all')"> 전체보기</button>
  <button class="btn" onclick="filterSelection('ing_event')"> 진행중인 이벤트</button>
  <button class="btn" onclick="filterSelection('finish_event')">  종료된 이벤트</button>
</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
	<c:forEach items="${list }" var="aa">
   <div class="column '${aa.event_state }'">
    <div class="content">
    <a href="eventdetail?event_no=${aa.event_no }">
      <img src="./image/${aa.event_img }" width="300px" height="300px"> </a>
      <h4><strong>${aa.event_title }</strong></h4>
      <p>기간 : 
    <fmt:parseDate value="${aa.event_sday}" var="startDate" pattern="yyyy-MM-dd HH:mm:ss" />
    <fmt:formatDate value="${startDate}" pattern="yyyy/MM/dd" />
    ~ 
    <fmt:parseDate value="${aa.event_fday}" var="endDate" pattern="yyyy-MM-dd HH:mm:ss" />
    <fmt:formatDate value="${endDate}" pattern="yyyy/MM/dd" />
	</p>
    </div>
  
      </div>
    	</c:forEach>

<!-- END GRID -->
</div>
<!-- END MAIN -->

<div class="btn-container">
     <button type="submit" class="btn" onclick="location.href='eventform'" style="border: 1px solid currentColor;">작성하기</button>
</div>

</div>

<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>
</body>
</html>