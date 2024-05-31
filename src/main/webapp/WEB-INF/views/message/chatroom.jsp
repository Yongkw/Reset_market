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
.lsitcontainer{
	margin:0 auto;
	width:600px;
	height:790px;
	background:gray;
	border: 1px solid #DCDCDC ;
}
.productdata{ 
	margin:0 auto;
	margin-top:5px;
	width: 100%;
	height: 7%;
	background: #1b311b;
	display:flex;
	align-items:center;
	padding-left:20px;
	padding-right:5px;
	color: white;
	*{
	margin-left:15px;
	margin-right:15px;
	}
	img{
		max-width:80px ;
		height:90% ;
		border-radius: 10px;
	}
}
.productdata>div{
	width: 70%;
	font-size: xx-large;
	text-wrap: nowrap;
    text-overflow: ellipsis;
    overflow-x: clip;
}
.chatarea{
	margin:0 auto;
	padding-top:5px;
	padding-left: 30px;
	padding-right:30px;
	width:100%;
	height:78%;
	background: rgb(226 255 238);
	display: flex;
	flex-direction: column;
	overflow: auto;
	
	
}.chatarea p{
	margin: 0 auto;
}

.inputdata{
	margin:0 auto;
	width:100%;
	height:10%;
	background: #dcdcdc;
	position: relative;

}
.formtextarea{
	    border: none;
	    resize: none;
	    width: 100%;
	    height: 100%;
	    margin: 0 auto;
}
#showimage{
	position: absolute;
	background: gray;
	width: 100px;
	max-height: 150px; 
	left:30px;
	display: block;
}  

.btnset{
	width:100%;
	background: #afacac	;
	border: 1px solid gray;
	display: flex;
	height: 35px;
	align-items:baseline;
	justify-content: space-around;
	>input{
		height: 100%;
		border: none;
		margin: 0 0 0 0;
		background: white;
	}
}


.chatting{
	border: 1px solid #d5d5d5;
	border-radius: 10px;
	max-width: 300px;
	min-width: 130px; 
	margin-bottom: 5px;  
	word-break:break-all;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left:10px;
	padding-right: 10px;
	 
	 
}  

.getchat{
	background: white;
	float: inline-start;
	~.updateTime{
		float: inline-start;
	}
}
.formchat{
	background: #FFFFCC	; 
	float: inline-end;
	~.updateTime{
	float: inline-end;
}
}
.setimg{
max-width: 150px;
max-height: 300px;
}
.btn-upload {
  width: 150px;
  height: 30px;
  margin-top: 2px;
  background: #f7f7f7;
  border: 1px solid rgb(187 187 187);
  border-radius: 10px;
  font-weight: 500;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  &:hover {
    background: #919191;
    color: #fff;
  }
}
.chatContainer{
	width:100%;
	>img{
		width:35px ;
		height:35PX ;
		border:1px solid #d8d8d8;
		border-radius: 10px;
		float: left;
		background: whitesmoke;
		}
}
#imgfilebtn {
  display: none;
}
.updateTime{color: #a1a1a1;}
.lastread{
	color: #d2d2d2;
	margin: 0 auto;
}

 </style>
 
</head>
<body> 
	<br style=" height: 15px;">
	<div class="lsitcontainer">
		<div class="productdata">
		
		<img alt="상품 페이지로 가기" src="./image/${product.pr_image}" onerror="this.style.display='none'" onclick="location.href='productout?product_no=${list.get(0).pr_no}'">
			<div onclick="location.href='productout?product_no=${list.get(0).pr_no}'">
				${product.pr_title} 
			</div>
			<img alt="체팅 리스트로" src="./image/icon-white.png" style=" filter: invert(1);" onclick="location.href='resetchat'">
		</div>
		<div id="chatarea" class="chatarea" >   
			  <c:forEach items="${list}" var="i" >
				<c:if test="${i.last_check == 1 && i.send_id != me && product.last_check == 1}" >
					<c:set target="${product}" property="last_check" value="0" />
					<div class="lastread">--------- 여기 까지 읽으셨습니다 ------------</div>
				</c:if> 
				
			<div class="chatContainer">
			 
				<c:choose>
				<c:when test="${i.send_id == me}">
					<div class="formchat chatting">
						<c:if test="${i.image!=null}"> <img class="setimg" src="./image/${i.image}" onerror="this.style.display='none'"></c:if>
					 	<p> ${i.text}</p>${point}
					 </div>
				</c:when>
				
				<c:otherwise>
					<img alt="상대방 마이페이지로 가기" src="./image/${opponentimage}" onerror="this.onerror=null; this.src='./image/icon-user.png'" onclick="location.href='mypage?find_id=${opponent}'">
					<div class="getchat chatting">
					<c:if test="${i.image!=null}"> <img class="setimg" src="./image/${i.image}" onerror="this.style.display='none'"></c:if>
					<p> ${i.text}</p>
					</div>
				</c:otherwise>
				</c:choose> 
				<div class="updateTime" data-timestamp="${i.chatdate}"></div>  
			</div>
			</c:forEach>
		</div>	
		<div class="inputdata">  
			<img src="" id="showimage" onclick="closeimg()">
			<textarea id="msg" name="message" class="formtextarea" maxlength="120" placeholder="120자 미만" > </textarea>  
		</div>	
		<div class="btnset">  
			<label for="sendbtn">
			<input class="btn-upload" type="button" id="sendbtn" value="Send">
			</label>
			
			<label for="imgfilebtn">
			  <div class="btn-upload">파일 업로드하기</div>
			</label>
			<input type="file" id="imgfilebtn" accept="image/gif, image/jpeg, image/png" onchange="readURL(this)" onclose="closeimg()">
			
			<label for="outuser">
			<input class="btn-upload"  type="button" id="outuser" value="채팅창 나가기" onclick="roomOut(${list.get(0).board_no})">
			</label>
		</div>	
		</div>
	<script type="text/javascript">
	$(document).ready(function() {
 		datecheck = setInterval( function () {
 		    $('.updateTime').each(function() {
 		        var timestamp = $(this).data('timestamp');
 		        $(this).text(formatTime(timestamp));
 		    });
 		    
 		    }, 1000);
 		 
	});

	function formatTime(timestamp) {
	    var now = new Date();
	    var updateTime = new Date(timestamp);
	    var timeDiff = now - updateTime;
	    
 
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
		$(document).ready(function(){ 
			const chattingarea = document.getElementById('chatarea');
 			const boardNo=  ${list.get(0).getBoard_no()};
 			const prNo = ${list.get(0).getPr_no()}; 
 			const getId = "${opponent}"; 
 			const opponentimage = "${opponentimage}";
 			let chatMaxNo = ${list.get(list.size()-1).chat_no};
 			const userid = "${me}";
			scrollbottum();

			
			$("#sendbtn").click(function(){
				var get = $(".formtextarea").val().replace(/\n/g, "<br>") ;
				if(get==null||get==0||get==""){get=" "};
				var inputfile = document.getElementById("imgfilebtn").files[0];
 
				if((get!=" " && get!="")||(inputfile!==undefined)){ 
					$(".formtextarea").val("");
					if(inputfile!==undefined){ 
						var fReader = new FileReader(); 
						fReader.readAsDataURL(inputfile);
						fReader.onloadend = function(Readerdata){ 
							closeimg();
							scrollbottum(); 
		                    blind();
			                sendData(get,inputfile);
 
						} 
					}else{
						/*
						chattingarea.insertAdjacentHTML("beforeend","<div class='chatting formchat setimg'><p>"+get+"</p></div>"); */
						scrollbottum();
	                    blind();
		                sendData2(get);
					}
				} 
			});

	 		function sendData(text,file){ 
	 			console.log(text);
	 			console.log(file);
	 			console.log('여기는 파일 전송')
                var formData = new FormData();
                formData.append('text', text); 
                formData.append('board_no', boardNo); 
                formData.append('pr_no', prNo);  
                formData.append('get_id', getId); 
                formData.append('file', file); 
                 
	            $.ajax({
	                url: 'chatsend', // 서버의 업로드 엔드포인트
	                type: 'POST',
	                data: formData,
	                processData: false, // 필수: jQuery가 데이터를 처리하지 않도록 설정
	                contentType: false, // 필수: jQuery가 컨텐츠 타입을 설정하지 않도록 설정
	                success: function(response) {
	                    console.log('Success:', response); 
	                },
	                error: function(request,status,error){        
	                	console.log("error "+error); // 실패 시 처리       
	                
	                }
	            });
				
	 		}

	 		function sendData2(text){
	 			console.log(text); 


                var formData = new FormData(); 
                formData.append('text', text); 
                formData.append('board_no', boardNo); 
                formData.append('pr_no', prNo);  
                formData.append('get_id', getId); 
	            $.ajax({
	                url: 'chatsend', // 서버의 업로드 엔드포인트
	                type: 'POST',
	                data: formData,
	                processData: false, // 필수: jQuery가 데이터를 처리하지 않도록 설정
	                contentType: false, // 필수: jQuery가 컨텐츠 타입을 설정하지 않도록 설정
	                success: function(response) {
	                    console.log('Success:', response);
	                    
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                    console.log('Error:', textStatus, errorThrown);
	                }
	            });
				
	 		}
			
	 		timer = setInterval( function () {
	 			readchat(); 
	 		    }, 3000);
			function readchat(){

				var priceSet=[];
				var dateSet=[]; 

		            $.ajax({
		        	    url: 'readchat', // 서버의 엔드포인트 URL
		        	    type: 'POST', // HTTP 메소드
		        	    data: {'chatMaxNo':chatMaxNo,
		        	    		'boardNo':boardNo},
		        	    dataType : 'json',
		        	    traditional: true,
		        	    success: function(data){
                    		console.log(data)
  
		                    for(var i in data){
	                    		console.log("send_id : ",data[i]['send_id'])
			                    chatMaxNo = data[i]['chat_no'];
		                    	if(data[i]['send_id']==userid){
		                    		console.log(1)
		                    	chattingarea.insertAdjacentHTML("beforeend","<div class='chatContainer'> "+
		                    			"<div class='chatting formchat'>"+
										"<img class='setimg' src='./image/"+data[i]['image']+"' onerror=\"this.style.display='none'\">"+
										"<p>"+data[i]['text']+"</p></div>"+
										"<div class='updateTime ' data-timestamp='"+data[i]['chatdate']+"'></div></div>"
										); 
		                    		
		        				scrollbottum(); 
		                    	}else{
		                    		console.log(2)
		                    		chattingarea.insertAdjacentHTML("beforeend",""+
		                    				"<div class='chatContainer'> "+
		                    				"<img alt=\"상대방 마이페이지로 가기\" src=\'./image/"+opponentimage+"'"+
		                    				" onerror=\"this.onerror=null; this.src='./image/icon-user.png'\" onclick='location.href=mypage?find_id="+getId+"'>"+
		                    				
			                    			"<div class='getchat chatting'>"+
											"<img class='setimg' src='./image/"+data[i]['image']+"' onerror=\"this.style.display='none'\">"+
											"<p>"+data[i]['text']+"</p></div>"+
											"<div class='updateTime ' data-timestamp='"+data[i]['chatdate']+"'></div></div>"
											); 
		            			scrollbottum(); 
		                    	}
		                    } 
		                    
		                },
		                error: function(request,status,error){        
		                	console.log("error "+error); // 실패 시 처리       
		                
		                }
		            });

					
			}

	 		function blind(){
	 			$(".lastread").css("display","none");
	 		} 
		});
		function scrollbottum() {
			let chatUl = document.getElementById('chatarea');
			  chatUl.scrollTop = chatUl.scrollHeight;
		}
		function closeimg() {
			const showimage = document.getElementById('showimage');
			const input = document.getElementById('imgfilebtn');
			input.value = '';
		    document.getElementById('showimage').src = "";
		}
		function readURL(input) { 
			  if (input.files && input.files[0]) {
				var showimage=document.getElementById('showimage');
			    var reader = new FileReader();
			    var fileWH = input.files[0];
			    reader.onload = function(e) {  
			 			getHeight(e,showimage); 
			    	showimage.src = e.target.result;
			    };
			    reader.readAsDataURL(input.files[0]);
			  } else {
				  showimage.src = "";
			  }
			}
 		function getHeight(e,showimage){
            var img = new Image();
            img.src = e.target.result; 
            img.onload = function(){
            	var h =(this.height/this.width*100)+2;
		    	showimage.style.top="-"+h+"px";
            } 
 		}
 		function roomOut(board_no){
 			const result = confirm("대화창을 나가시겠습니까?");
 			if(result){
 		    	location.replace('resetchatout?board_no='+board_no);
 			}
 		}
	</script>
	
</body>

</html>