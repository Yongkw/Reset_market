package com.enez.market.message;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile; 

@Controller
public class MessageController {

	
		@Autowired
		SqlSession sqlSession;
		
		//String path = "\\\\Mac\\Home\\Desktop\\Sourectree\\YongKwon\\src\\main\\webapp\\image";
		String path = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\image";

		@RequestMapping(value = "/resetchat")
		public String message(Model model,HttpSession session) { 
			String userid = (String) session.getAttribute("member_id");
			Service service = sqlSession.getMapper(Service.class);
			ArrayList<MesssageSendDTO> list = new ArrayList<MesssageSendDTO>();
			if(userid!=null) {
				list = service.getchatroomlist(userid); 
			}
 

			
			model.addAttribute("list", list);
			//list = > BOARD_NO, PR_NO,	CHATDATE, TEXT, pr_image,pr_title,member_name
			return "resetchat";
			
		}  
		@RequestMapping(value = "/resetchat2")
		public String message2(@RequestParam( value = "bno", required = false)String bno,@RequestParam(value = "pno")String pno,Model model,HttpSession session) {
			Service service = sqlSession.getMapper(Service.class);
			String userId =(String)session.getAttribute("member_id");
			ArrayList<MesssageSendDTO> list = new ArrayList<MesssageSendDTO>();
 
			if(userId==null)return "redirect:/productout?product_no="+pno;  // 로그인 체크
			if(bno==null)bno=service.getboardno(pno,userId);  				// 상점 페이지에서 들어오면 null 값, 체팅리스트에서 들어오면 not null
			if(bno==null) {													// 위 데이터 베이스에 bno의 값이 없으면 체팅방을 만들지 확인
				if (service.checkgetid(userId,pno)==0) {  					// 만약 판매자 본인이 판매자와 채팅 클릭시 처리
					service.createchatroom(pno,userId);    
					bno=service.getboardno(pno,userId);
				}else {
					return "redirect:/productout?product_no="+pno;
					
				}
			}
			list =  service.getchttingdata(Integer.parseInt(bno),Integer.parseInt(pno)); 
			if(!list.get(0).get_id.equals(userId) && !list.get(0).send_id.equals(userId)) return "redirect:/main"; // 다른 아이디로 url 경로로 들어올시 처리
			
			String opponent =""; 
			if(list.get(0).get_id.equals(userId)) {
				opponent = list.get(0).send_id;
			}else {
				opponent = list.get(0).get_id;
			} 
			String opponentimage = service.getimage(opponent);
			MesssageSendDTO product= service.getopponent(Integer.parseInt(pno));
			product.setLast_check(1);
			model.addAttribute("list",list); 					// 채팅 데이터
			model.addAttribute("me", userId);					// 자신의 아이디
			model.addAttribute("opponent",opponent); 			// 상대 아이디
			model.addAttribute("opponentimage",opponentimage); 	// 상대 프로필
			model.addAttribute("product",product); 				// 상대 상점 정보
			
			return "resetchat2";
		}  


		@RequestMapping(value = "/resetchatout")
		public String message3(Model model,HttpSession session,@RequestParam("board_no")int BoardNo) { 
			String userid = (String) session.getAttribute("member_id");
			Service service = sqlSession.getMapper(Service.class);
			service.outsender(BoardNo ,userid);
			service.outsender2(BoardNo ,userid);
			
			return "redirect:/resetchat";
		}  

		@ResponseBody
	    @RequestMapping(value = "/chatsend", method = RequestMethod.POST)
	    public String ajax1(@ModelAttribute MesssageSendDTO messsageSendDTO,HttpSession session) throws IllegalStateException, IOException {
			Service service = sqlSession.getMapper(Service.class); 
			String text = messsageSendDTO.getText();
			String image = "";
			int pr_no = messsageSendDTO.getPr_no();
			int board_no = messsageSendDTO.getBoard_no();
			String send_id = (String) session.getAttribute("member_id");
			String get_id = messsageSendDTO.getGet_id();
			service.readcheck2(messsageSendDTO.board_no,send_id);
	        
	        if(messsageSendDTO.getFile()!=null) {  
	        	MultipartFile multipartFile = messsageSendDTO.getFile();
	        	multipartFile.transferTo(new File(path+"\\"+messsageSendDTO.getFile().getOriginalFilename())); 
			      service.sendchatdata2(board_no,pr_no, send_id,get_id,text,messsageSendDTO.getFile().getOriginalFilename());
	        } else { 
			      service.sendchatdata2(board_no,pr_no, send_id,get_id,text,image);
			}
  
			return "ok";
	    }

		@SuppressWarnings("unchecked")
		@ResponseBody
	    @RequestMapping(value = "/readchat", method = RequestMethod.POST)
	    public void ajax2(@RequestParam("chatMaxNo")String chatMaxNo,@RequestParam("boardNo")String boardNo,HttpSession session,
	    		HttpServletResponse response ) throws IOException{
			Service service = sqlSession.getMapper(Service.class); 
			int cNo = Integer.parseInt(chatMaxNo);
			int bNo = Integer.parseInt(boardNo);
			String user = (String)session.getAttribute("member_id");
			
			
			ArrayList<MesssageSendDTO> list =  service.readchttingdata(bNo,cNo,user);
			service.readcheck(bNo,cNo,user);
			if(service.newdatacheck(bNo,cNo)>0) {
				JSONArray jsonlist = new JSONArray();
				for (MesssageSendDTO dto : list) {
					JSONObject jObject = new JSONObject();
					jObject.put("chat_no", dto.getChat_no());
					jObject.put("send_id", dto.getSend_id());
					jObject.put("get_id", dto.get_id);
					jObject.put("text", dto.getText());
					jObject.put("image", dto.getImage());
					jObject.put("chatdate", dto.getChatdate());
					jObject.put("last_check", dto.getLast_check());
					jsonlist.add(jObject);
				}
				
				String jsondata=jsonlist.toJSONString();
				PrintWriter printWriter =response.getWriter();
				printWriter.print(jsondata);
			}
	    }


}
