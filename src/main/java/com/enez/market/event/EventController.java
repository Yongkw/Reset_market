package com.enez.market.event;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class EventController {

	@Autowired
	SqlSession sqlSession;
	String imagepath = "C:\\Users\\Administrator\\Desktop\\ezen-reset_market\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "/event_out")
	public String eventpage(Model mo) {
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<EventDTO> list = ss.eventout();
		System.out.println(list.get(0).event_img);
		mo.addAttribute("list",list);
		return"event_out";
	}
	
	@RequestMapping(value = "/eventform")
	public String eventform() {
		
		return "event_form";
	}
	
	
	@RequestMapping(value = "/eventsave", method = RequestMethod.POST)
	public String event_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String event_title = mul.getParameter("event_title");
		String event_content = mul.getParameter("event_content");
		String event_state = mul.getParameter("event_state");
		String event_sday=mul.getParameter("event_sday");
		String event_fday=mul.getParameter("event_fday");
		
		MultipartFile mf = mul.getFile("event_img");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(imagepath+"//"+fname));
		System.out.println(fname);
		
		Service ss = sqlSession.getMapper(Service.class);
		ss.insert(event_title,event_content,fname, event_state, event_sday,event_fday);
		return "redirect:/event_out";
	}
	 
	@RequestMapping(value = "/event_update",method = RequestMethod.GET  )
	public String event_update(HttpServletRequest request, Model mo) {	 
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		System.out.println(event_no);
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<EventDTO> list = ss.eventupdate(event_no);
		mo.addAttribute("list", list);
		return "event_update";
	}
	
	@RequestMapping(value = "/event_upsave",method = RequestMethod.POST)
	public String event_upsave(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String event_title=mul.getParameter("event_title");
		String event_content=mul.getParameter("event_content");
		String event_state=mul.getParameter("event_state");
		String event_sday=mul.getParameter("event_sday");
		String event_fday=mul.getParameter("event_fday");
		int event_no = Integer.parseInt(mul.getParameter("event_no"));
		System.out.println("값 : "+event_no);
		
		MultipartFile mf = mul.getFile("event_img");
		String fname = mf.getOriginalFilename();
		System.out.println("이미지 : "+fname);
		mf.transferTo(new File(imagepath+"//"+fname));
		
		Service ss = sqlSession.getMapper(Service.class);
		ss.event_update(event_title, event_content, fname, event_state,event_sday,event_fday, event_no);
		return "redirect:/event_out";
	}
	
	@RequestMapping(value = "/eventdetail")
	public String notice_view(HttpServletRequest request, Model mo){
		int event_no = Integer.parseInt(request.getParameter("event_no"));
		Service ss = sqlSession.getMapper(Service.class);
		event_count(event_no);
		ArrayList<EventDTO> list = ss.event_detail(event_no);
		mo.addAttribute("list", list);
		return "event_detail";
	}

	private void event_count(int event_no) { 
		// 조회수 증가
		Service ss = sqlSession.getMapper(Service.class);
		ss.count(event_no);
	}
	
	@RequestMapping(value = "/event_del")
	   public String eventdelete(HttpServletRequest request) {	      
		  int event_no = Integer.parseInt(request.getParameter("event_no"));
	      String event_img = request.getParameter("event_img");
	      Service ss = sqlSession.getMapper(Service.class);

	      File img = new File(imagepath+"\\"+event_img);
	      System.out.println(img);
	      img.delete();
	       
	      ss.ev_dela(event_no);
	      return "redirect:/event_out";
	   }
	
}
