<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 이미지 삽입 미리보기 -->
<script type="text/javascript">
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
<meta charset="UTF-8">
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto);
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);
body,
input,
select,
textarea,
body * {
  font-family: 'Roboto', sans-serif;
  box-sizing: border-box;
}
body::after, body::before,
input::after,
input::before,
textarea::after,
textarea::before,
body *::after,
body *::before {
  box-sizing: border-box;
}


h1 {
  font-size: 4rem;
  text-align: center;
  margin: 0 0 2em;
}

.container {
  position: relative;
  max-width: 1000px;
  height: 1150px;
  margin: 5rem auto;
  background: #f6fbf5;
  width: 200%;
  padding: 3rem 5rem 0;
  border-radius: 1px;
  border: 0.0625rem solid #999;
}
.container::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  box-shadow: 0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.2);
  -webkit-transform: scale(0.98);
          transform: scale(0.98);
  -webkit-transition: -webkit-transform 0.28s ease-in-out;
  transition: -webkit-transform 0.28s ease-in-out;
  transition: transform 0.28s ease-in-out;
  transition: transform 0.28s ease-in-out, -webkit-transform 0.28s ease-in-out;
  z-index: -1;
}
.container:hover::before {
  -webkit-transform: scale(1);
          transform: scale(1);
}

.button-container {
  text-align: center;
}

fieldset {
  margin: 0 0 3rem;
  padding: 0;
  border: none;
}

.form-group {
  position: relative;
  margin-top: 2.25rem;
  margin-bottom: 2.25rem;
}

.form-inline > .form-group,
.form-inline > .btn {
  display: inline-block;
  margin-bottom: 0;
}

.form-help {
  margin-top: 0.125rem;
  margin-left: 0.125rem;
  color: #b3b3b3;
  font-size: 0.8rem;
}

.form-help, .form-group .form-help {
  position: absolute;
  width: 100%;
}

.form-group input {
  height: 4rem;
}
.form-group textarea {
  resize: none;
}

.form-group .input-file {
  display: none;
}
.form-group .input-date {
  width: 40%;
  font-size: 1.5rem;
  height: 4rem;
  padding: 0.125rem 0.125rem 0.0625rem;
  background: none;
  border: none;
  line-height: 1.6;
  box-shadow: none;
}
.form-group .control-label {
  position: absolute;
  top: 0.25rem;
  pointer-events: none;
  padding-left: 0.125rem;
  z-index: 1;
  color: black;
  font-size: 1.5rem;
  font-weight: normal;
  -webkit-transition: all 0.28s ease;
  transition: all 0.28s ease;
}
.form-group .bar {
  position: relative;
  border-bottom: 0.0625rem solid #999;
  display: block;
}
.form-group .bar::before {
  content: '';
  height: 0.125rem;
  width: 0;
  left: 50%;
  bottom: -0.0625rem;
  position: absolute;
  background: #337ab7;
  -webkit-transition: left 0.28s ease, width 0.28s ease;
  transition: left 0.28s ease, width 0.28s ease;
  z-index: 2;
}
.form-group input,
.form-group textarea {
  display: block;
  background: none;
  padding: 0.125rem 0.125rem 0.0625rem;
  font-size: 1.5rem;
  border-width: 0;
  border-color: transparent;
  line-height: 1.9;
  width: 100%;
  color: transparent;
  -webkit-transition: all 0.28s ease;
  transition: all 0.28s ease;
  box-shadow: none;
}
.form-group input[type="file"] {
  line-height: 1;
}
.form-group input[type="file"] ~ .bar {
  display: none;
}

.form-group input:focus,
.form-group input:valid,
.form-group input.form-file,
.form-group input.has-value,
.form-group textarea:focus,
.form-group textarea:valid,
.form-group textarea.form-file,
.form-group textarea.has-value {
  color: #333;
}

.form-group input:focus ~ .control-label,
.form-group input:valid ~ .control-label,
.form-group input.form-file ~ .control-label,
.form-group input.has-value ~ .control-label,
.form-group textarea:focus ~ .control-label,
.form-group textarea:valid ~ .control-label,
.form-group textarea.form-file ~ .control-label,
.form-group textarea.has-value ~ .control-label {
  font-size: 1.5rem;
  color: black;
  top: -1rem;
  left: 0;
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
}

.form-group input:focus ~ .control-label,
.form-group textarea:focus ~ .control-label {
  color: black;
}

.form-group input:focus ~ .bar::before,
.form-group textarea:focus ~ .bar::before {
  width: 100%;
  left: 0;
}
.has-error .legend.legend, .has-error.form-group .control-label.control-label {
  color: #d9534f;
}
.has-error.form-group .form-help,
.has-error.form-group .helper, .has-error.checkbox .form-help,
.has-error.checkbox .helper, .has-error.radio .form-help,
.has-error.radio .helper, .has-error.form-radio .form-help,
.has-error.form-radio .helper {
  color: #d9534f;
}
.has-error .bar::before {
  background: #d9534f;
  left: 0;
  width: 100%;
}

.button {
  position: relative;
  background: currentColor;
  border: 1px solid currentColor;
  font-size: 1.1rem;
  color: #3d3d3d;
  margin: 10rem 0;
  padding: 0.75rem 3rem;
  cursor: pointer;
  -webkit-transition: background-color 0.28s ease, color 0.28s ease, box-shadow 0.28s ease;
  transition: background-color 0.28s ease, color 0.28s ease, box-shadow 0.28s ease;
  overflow: hidden;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
.button span {
  color: #fff;
  position: relative;
  z-index: 1;
}
.button::before {
  content: '';
  position: absolute;
  background: #071017;
  border: 50vh solid #1d4567;
  width: 30vh;
  height: 30vh;
  border-radius: 50%;
  display: block;
  top: 50%;
  left: 50%;
  z-index: 0;
  opacity: 1;
  -webkit-transform: translate(-50%, -50%) scale(0);
          transform: translate(-50%, -50%) scale(0);
}
.button:hover {
  color: #black;
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.14), 0 1px 18px 0 rgba(0, 0, 0, 0.12), 0 3px 5px -1px rgba(0, 0, 0, 0.2);
}
.button:active::before, .button:focus::before {
  -webkit-transition: opacity 0.28s ease 0.364s, -webkit-transform 1.12s ease;
  transition: opacity 0.28s ease 0.364s, -webkit-transform 1.12s ease;
  transition: transform 1.12s ease, opacity 0.28s ease 0.364s;
  transition: transform 1.12s ease, opacity 0.28s ease 0.364s, -webkit-transform 1.12s ease;
  -webkit-transform: translate(-50%, -50%) scale(1);
          transform: translate(-50%, -50%) scale(1);
  opacity: 0;
}

label#largeFile:after {
  position:absolute;
  width:60%;
  max-width: 200px;
  content:"Upload your file";
  margin:30px auto;
  text-align:center;
  padding: 10px 0px 10px 0px;
  border-radius:10px;
  border:3px dashed #ccc;
  color:#ccc;
  font-family:"Helvetica Neue", Helvetica, Arial;
  font-size: 15px; 
}

label#largeFile:hover:after {
  background:#ccc;
  color:#fff;
  cursor:pointer;
}


label#largeFile input#file {
    width: 0px;
    height: 0px;
}

textarea {
  width: 100%;
  max-width: 900px;
  height: 200px;
  max-height: 200px;
  padding: 15px;
  background: transparent;
  outline: none;
}

</style>
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="container">
  <form action="event_upsave" method="post" enctype="multipart/form-data">
    <h1>EVENT Update</h1>
  <c:forEach items="${list }" var="aa">
    <div class="form-group">
      <input type="text" required="required" name="event_title" maxlength="100"/>
      <label for="input" class="control-label" >Title</label><i class="bar"></i>
    </div>
    
     <div class="form-group">
      <input type="date" required="required" name="event_sday"  placeholder="이벤트 시작일"/>
      <label for="input" class="control-label">Event Start</label><i class="bar"></i>
    </div>
    
     <div class="form-group">    
      <input type="date" required="required" name="event_fday" placeholder="이벤트 종료일"/>
      <label for="input" class="control-label">Event Finish</label><i class="bar"></i>
    </div>

    <div class="form-group">
      <textarea required="required" name="event_content"></textarea>
      <label for="textarea" class="control-label">Event Content</label><i class="bar"></i>
    </div>
    
     <div style="font-size: 1.5rem; font-weight: normal;">   
     Event State<br>
       <input type="radio" name="event_state" value="ing_event">진행중
       <input type="radio" name="event_state" value="finish_event" checked="checked">종료
      
    </div>

    <div class="form-group">
     <label for="input" class="control-label">Image</label>
    <label id="largeFile" for="file">
    <input type="file" id="file" name="event_img" onchange="readURL(this);" />
	</label>
	
	<div style="margin-left: 220px; margin-top: 20px;">
	<img id="preview" style="width:300px; height:300px;"/>
	</div>
 	</div> 

   <input type="hidden" value="${list.get(0).event_no }" name="event_no" >
    <div class="button-container">
    <button type="submit" class="button"><span>수정하기</span></button>
    <button type="button" class="button" onclick="location.href='event_out'"><span>목록</span></button>
  </div>
  </c:forEach>  
  </form>
</div>
</body>
</html>