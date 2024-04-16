package com.enez.market.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	String imagepath = "C:\\Users\\Administrator\\Desktop\\ezen-reset_market\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "/notice_out" )
	public String notice(Model mo) {	 
		 Service ss = sqlSession.getMapper(Service.class);
		 ArrayList<BoardDTO> list = ss.noticeout();
		 mo.addAttribute("list", list);
		return "notice_out";
	}
	
	@RequestMapping(value = "/noticeform", method = RequestMethod.GET)
	public String notice_input() {
		
		return "notice_form";
	}
	
	@RequestMapping(value = "/noticesave", method = RequestMethod.POST)
	public String notice_save(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String notice_title = mul.getParameter("notice_title");
		String notice_writer = mul.getParameter("notice_writer");
		String notice_content = mul.getParameter("notice_content");
		String notice_category = mul.getParameter("notice_category");
		MultipartFile mf = mul.getFile("notice_img");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(imagepath+"\\"+fname));
		
		Service ss = sqlSession.getMapper(Service.class);
		ss.insert(notice_title,notice_content,notice_writer,fname,notice_category);
		return "redirect:/notice_out";
	}
	
	@RequestMapping(value = "/noticeupdate",method = RequestMethod.GET  )
	public String notice_update(HttpServletRequest request, Model mo) {	 
		int notice_no = Integer.parseInt(request.getParameter("notice_no"));
		System.out.println(notice_no);
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<BoardDTO> list = ss.noupdate(notice_no);
		mo.addAttribute("list", list);
		return "notice_update";
	}
	
	@RequestMapping(value = "/notice_upsave")
	public String update(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String notice_title=mul.getParameter("notice_title");
		String notice_category = mul.getParameter("notice_category");
		String notice_content=mul.getParameter("notice_content");
		String notice_writer=mul.getParameter("notice_writer");
		int notice_no = Integer.parseInt(mul.getParameter("notice_no"));
		System.out.println("값 : "+notice_no);
		
		MultipartFile mf = mul.getFile("notice_img");
		String fname = mf.getOriginalFilename();
		System.out.println("이미지 : "+fname);
		mf.transferTo(new File(imagepath+"\\"+fname));
		
		Service ss = sqlSession.getMapper(Service.class);
		ss.update(notice_title, notice_content, fname, notice_writer, notice_category, notice_no);
		return "redirect:/notice_out";
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.GET)
	   public String sangdelete(HttpServletRequest request) {	      
		  int notice_no = Integer.parseInt(request.getParameter("notice_no"));
	      Service ss = sqlSession.getMapper(Service.class);
	      
	      ss.dela(notice_no);
	      return "redirect:/notice_out";
	   }
	
}
