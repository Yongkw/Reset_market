<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="now" value="${System.currentTimeMillis()}" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function chk(){
 var req = document.myForm.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.myForm.submit();
 }else{
  alert("개인정보 약관에 동의하셔야 합니다.");
 }
}
 
function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");
 location.href="./personal_form";
}

</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="${path}/resources/css/prosale2.css?v=${now}css?v=${now}" rel="stylesheet" />
<meta charset="UTF-8">
<style>

.main {
  max-width: 1000px;
  margin: auto;
  position: relative; /* 상대적 위치 설정 */
  margin-bottom: 60px;
}
.topnav {
  margin-left: 320px;
  margin-right: 422px;
  overflow: hidden;
  background-color: white;
  border-bottom: 1px solid #ccc;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 10px 16px;
  text-decoration: none;
  font-size: 17px;
  margin-top: 15px;
  border-bottom: 3px solid transparent;
}

.topnav a:hover {
  border-bottom: 3px solid green;
}

.topnav a.active {
  border-bottom: 3px solid green;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}
.group_rgt{
	float: right;
	margin-top:4px;
}
.txt_req {
	margin-right: 4px;
	font-size: 14px;
	color: #ff243e;
}

.con_top {
    position: relative;
    background-color: #F8F8F8;
    padding: 35px 0;
    text-align: center;
}

.con_top .ico_tit.qus {
    background-image: url('https://www.lottecinema.co.kr/NLCHS/Content/images/customer/ic_qus.png');
    display: inline-block;
    background-repeat: no-repeat;
    background-position: top 10% left;
    min-width: 250px;
    min-height: 35px;
    line-height: 1.4;
    padding-left: 55px;
    text-align: left;
    font-size: 15px;
}

.con_top .ico_tit.qus a {
    display: block;
    color: #000;
    font-size: 15px;
    text-decoration: underline;
}

.con_tit {
 font-size: 20px;
 margin: 30px 0;
 border-bottom: 2px solid #000;
}

.mt5 {
    margin-top: 5px !important;
}
.list_txt {
    font-size: 13px;
}
.mt10 {
    margin-top: 10px !important;
}

.contxt_type1 {
	margin: 10px 0 30px 0;
	text-align: center;
}

.contxt_type1 . tit {
	padding-bottom: 5px;
	font-size: 15px;
	color: #000;
}

.txt_color02 {
 color: #ff7787 !important;
}

dd {
 display:  block;
}

.contxt_type1 .desc{
	font-size: 12px;
	color: #707070;
	line-height: 1.3;
}
.bJyhFc {
    display: inline-flex;
    overflow: hidden;
    position: relative;
    width: 100%;
    box-sizing: border-box;
}
.bJyhFc li.on {
    background-color: rgb(31, 31, 31);
    border: 1px solid rgb(31, 31, 31);
}

.bJyhFc li.on > a {
    color: rgb(255, 255, 255);
}


.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
}


.bJyhFc li {
    flex: 1 1 0%;
    float: left;
    border-top: 1px solid rgb(222, 222, 222);
    border-right: 1px solid rgb(222, 222, 222);
    border-left: 1px solid rgb(222, 222, 222);
    border-bottom: 1px solid rgb(222, 222, 222);
    box-sizing: border-box;
    text-align: center;
}

.bJyhFc li > a {
    display: inline-block;
    width: 100%;
    padding: 17px 0px 15px;
    line-height: 14px;
    font-size: 14px;
    font-weight: 400;
    color: rgb(170, 170, 170);
}

a {
    text-decoration: none;
    color: rgb(102, 102, 102);
    cursor: pointer;
}

.flimjd {
    display: block;
    width: 1024px;
    margin: auto;
    margin-bottom : 60px;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div class="main">

	<ul class="sc-4icuvf-0 bJyhFc" style="margin-top: 30px;">
	<li class=""><a href="notice_out">FAQ</a></li>
	<li class="on"><a href="personal_form">1:1문의</a></li>
	<li class=""><a href="swindle_main">사기등록</a></li>
	</ul>
	
   <div class="con_tit">
        <h2 style="margin: 0;">1:1 문의 작성하기</h2>           
   </div>
   
	<div class="con_top">
		<div class="ico_tit qus"><strong>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.
			<a href="notice_out" class="mt5">FAQ 바로가기</a></strong>
				<ul class="list_txt mt10"><li>ㆍ 1:1 문의글 답변 운영시간 : 평일 09:00~18:00</li>
										  <li>ㆍ 주말/공휴일 미운영하며, 영업시간 내 순차적 답변 처리됩니다.</li></ul></div>
	</div>
	 
    <dl class="contxt_type1">
        <dt class="tit">
            고객님의 문의에 
            <span class="txt_color02">답변하는 직원은 회원 여러분의 가족 중 한 사람</span>
            일 수 있습니다.
        </dt>
        <dd class="desc">
            고객의 언어폭력(비하, 욕설, 반말, 성희롱 등)으로부터 직원을 보호하기 위해 관련 법에 따라 수사기관에 필요한 조치를 요구할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.
        </dd>   
    </dl>
</div>

<div class="hmUNzn">
		<form name="myForm" action="personalsave" method="post" enctype="multipart/form-data">
			<main class="flimjd">
				 <div class="con_tit">
				 	<div style="display: flex; justify-content: space-between;">
				        <h3 style="margin: 0;">문의내용</h3>
				        <div class="group_rgt">
				            <span class="txt_req">* 필수입력</span>
				        </div>
				    </div> 			              
			  	 </div>

				<ul class="hcyuoc">
					
					<li class="iZffvT">
						<div class="fw22">
							분류 <span style="color: red;">*</span>
						</div>
						<div class="nqDMw">
							<div class="iIJDsQ">
								<select name="personal_category" id="personal_category">
							        <option value="회원문의">회원문의</option>
							        <option value="고객센터">고객센터</option>
							        <option value="사기문의">사기문의</option>
							        <option value="아나바다">아나바다</option>
							        <option value="오류문의">오류문의</option>
							        <option value="프로모션">프로모션</option>
							        <option value="기타문의">기타문의</option>
							      </select>
							</div>
						</div>
					</li>	
						
					<li class="iZffvT">
						<div class="fw22">
							제목 <span style="color: red;">*</span>
						</div>
						<div class="nqDMw">
							<div class="iIJDsQ">
								<input type="text" placeholder="문의 제목을 입력해 주세요."
									class="lhjRrq" name ="personal_title" >
							</div>
						</div>
					</li>
					
					<li class="iZffvT">
						<div class="fw22">
							내용 <span style="color: red;">*</span>
						</div>
						<div class="nqDMw">
							<textarea rows="6" class="gQnFKF" oninput="hideDivContent(this)" name="personal_content" placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요."></textarea>
						</div>
					</li>
					
					<li class="iZffvT">
						<div class="dXoRFE">
							이미지 <small>(3/12)</small> <span style="color: red;">*</span>
						</div>
						<div class="nqDMw">
							<ul class="czzFIC">
								<li class="oHGzg">이미지등록 
								<input type="file"
									accept="image/jpg, image/jpeg, image/png" id="btnAtt"
									multiple='multiple' name="personal_img">
								</li>
								<li draggable="false" class="iUgrwC">
									<div id='att_zone' class='att_zone'></div>
								</li>
							</ul>
							<div class="doQsrA">* 자세한 사진은 문의 처리에 큰 도움이 됩니다.</div>
						</div>
					</li>	
					
					
				</ul>
				
				
				<div class="con_tit">
				 	<div style="display: flex; justify-content: space-between;">
				        <h3 style="margin: 0;">고객정보</h3>
				        <div class="group_rgt">
				            <span class="txt_req">* 필수입력</span>
				        </div>
				    </div> 			              
			  	 </div>

				<ul class="hcyuoc">		
				
					<li class="iZffvT">
						<div class="fw22">
							성함 <span style="color: red;">*</span>
						</div>
						<div class="nqDMw">
							<div class="cYrISD">
								<input type="text" class="gZdwcQ" name ="personal_name" >
							</div>
						</div>
					</li>			
					
					<li class="iZffvT">
						<div class="fw22">
							이메일  
						</div>
						<div class="nqDMw">
							<div class="cYrISD">
								<input name="personal_email" type="text" placeholder="ex) 아이디@naver.com" class="gZdwcQ">
							</div>
							<div class="doQsrA">* 답변 완료 시 이메일로 답변 내용이 발송됩니다.</div>
						</div>
					</li>
			 </ul>
			 
			  <div class="con_tit">
			    <div style="display: flex; justify-content: space-between;">
			        <h3 style="margin: 0;">개인정보 수집에 대한 동의</h3>
			        <div class="group_rgt">
			            <span class="txt_req">※ 문의를 통해 아래의 개인정보를 수집합니다. 수집된 개인정보는 문의 외 목적으로 사용하지 않습니다.</span>
			        </div>
			    </div>       
			   </div>
			   		 
<textarea rows="10" cols="136" style="text-align: left;" readonly="readonly">
개인정보의 수집목적 및 항목
			 
① 수집 목적 : 원활한 고객 상담, 불편사항 및 문의사항 관련 의사소통 경로 확보
② 수집 항목*필수입력사항- 이용자 식별을 위한 항목 : 성명, 이메일, 아이디
			 
개인정보의 보유 및 이용기간 입력하신 개인정보는 소비자 보호에 관한 법률 등 관계 법률에 의해 다음과 같이 보유합니다.
			 
보유기간 : 문의접수 후 처리 완료시점으로 부터 3년
			 
※ 1:1문의 서비스 제공을 위한 최소한의 개인정보이며 거부할 수 있습니다. 
다만, 수집에 동의하지 않을 경우 서비스 이용이 제한됩니다.

			 
Reset Market 개인정보처리방침
			 
가. 수집하는 개인정보의 항목첫째, 회사는 회원가 입, 원활한 고객상담, 
각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
				
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
		    
만14세 미만 아동 회원가입
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
			 
단체아이디 회원가입
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
			 
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
			 
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 
해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.
			 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
			 
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
- 신용카드 결제시 : 카드사명, 카드번호 등
- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
- 계좌이체시 : 은행명, 계좌번호 등
- 상품권 이용시 : 상품권 번호

			
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공
- 생성정보 수집 툴을 통한 수집
</textarea><br>
			 
			<div style="display: flex; align-items: center;">
		    <input type="checkbox" name="req" style="margin-right: 10px;"> 개인정보 수집 및 이용에 동의합니다.
			</div>
		    
		    <div class="hDtjVn">
					<input type="button" value="동의 후 문의하기" onclick="chk()" style="margin-right: 10px;" class="fbBXvz"> 
					<input type="button" value="미동의" onclick="nochk()" class="eQoStg">

				</div>
			</main>


			</form>
		</div>

<script type="text/javascript">
 //텍스트에 값넣을때 div값 사라지게하는 기능
 function hideDivContent(textarea) {
     var divContent = textarea.nextElementSibling; // textarea 다음에 있는 div 요소를 가져옴
     divContent.style.display = textarea.value.trim() ? 'none' : 'block'; // textarea에 값이 있으면 div를 숨기고, 없으면 보이게 함
 }
 
 //이미지 관련 스크립트
 var sel_files = []; // 이미지 파일을 담을 배열을 정의하고 초기화합니다.

 // 이미지를 미리보기할 위치를 정의한 함수
 function makeDiv(img, file) {
     var div = document.createElement('div');
     div.setAttribute('style', 'width: 202px; height: 202px; margin-right: 1rem; border: 1px solid rgb(178, 178, 178); display: inline-block; position: relative;');

     var btn = document.createElement('input');
     btn.setAttribute('type', 'button');
     btn.setAttribute('value', 'x');
     btn.setAttribute('delFile', file.name);
     btn.setAttribute('style', 'width: 24px; height: 30px; position: absolute; font-size: 23px; right: 0px; top: 0px; z-index: 999; border: none; color: #000; cursor: pointer; opacity: 0.8; line-height: 1;');
     btn.onclick = function(ev){
         var ele = ev.target;
         var delFile = ele.getAttribute('delFile');

         // sel_files 배열에서 삭제할 파일을 찾아 제거합니다.
         for(var i=0 ;i<sel_files.length; i++){
             if(delFile == sel_files[i].name){
                 sel_files.splice(i, 1);
                 break; // 해당 파일을 찾으면 더 이상 반복하지 않도록 중단합니다.
             }
         }

         var dt = new DataTransfer();
         for(var f in sel_files) {
             var file = sel_files[f];
             dt.items.add(file);
         }
         btnAtt.files = dt.files;
         var p = ele.parentNode;
         p.parentNode.removeChild(p);
     };
     div.appendChild(img);
     div.appendChild(btn);
     return div;
 }

 // 이미지 미리보기 함수
 var imageView = function(att_zone, btn) {
     var attZone = document.getElementById(att_zone);
     var btnAtt = document.getElementById(btn);

     btnAtt.onchange = function(e) {
         var files = e.target.files;

         for (var f of files) {
             imageLoader(f);
         }
     };

     attZone.addEventListener('drop', function(e) {
         e.preventDefault();
         e.stopPropagation();
         var dt = e.dataTransfer;
         var files = dt.files;

         for (var f of files) {
             imageLoader(f);
         }
     }, false);

     var imageLoader = function(file) {
         var reader = new FileReader();
         reader.onload = function(ee) {
             var img = document.createElement('img');
             img.setAttribute('style', 'width: 100%; height: 100%;');
             img.src = ee.target.result;

             // 이미지를 attZone 요소에 추가
             attZone.appendChild(makeDiv(img, file));
             sel_files.push(file); // 이미지 파일을 배열에 추가합니다.
         };

         reader.readAsDataURL(file);
     };
 };

 imageView('att_zone', 'btnAtt');
 

</script>
</body>
</html>