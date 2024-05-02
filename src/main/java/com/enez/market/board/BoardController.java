package com.enez.market.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/personal_form", method = RequestMethod.GET)
	public String personal_form() {
		
		return "personal_form";
	}
	
	@RequestMapping(value = "/personalsave", method = RequestMethod.POST)
	public String personal_insert(MultipartHttpServletRequest mul ,HttpSession si) throws IllegalStateException, IOException {
		String member_id = (String) si.getAttribute("member_id");
		
		if(member_id != null)
		{
		String personal_category = mul.getParameter("personal_category");
		String personal_title = mul.getParameter("personal_title");
		String personal_content = mul.getParameter("personal_content");
		String personal_img="";
		String personal_name = mul.getParameter("personal_name");
		String personal_email = mul.getParameter("personal_email");
		List<MultipartFile> mfArray = mul.getFiles("personal_img");
		Service ss =sqlSession.getMapper(Service.class);
		for (MultipartFile mf : mfArray) {
			String filename = mf.getOriginalFilename();
			mf.transferTo(new File(imagepath + "\\" + filename)); // 이미지 파일을 저장
			personal_img += (personal_img.isEmpty() ? "" : ",") + filename; // 이미지 파일 이름을 문자열에 추가
	    }
		 System.out.println("가져온 아이디값 : "+member_id );
		 System.out.println("가져온 카테고리: "+personal_category);
		 System.out.println("가져온 제목 :" + personal_title);
		 System.out.println("가져온 사진 :" + personal_img);
		 System.out.println("가져온 내용 :" + personal_content);
		 System.out.println("가져온 이름 :" + personal_name);
		 System.out.println("가져온 이메일 :" + personal_email);
		ss.personalsave( personal_title, personal_content, personal_img, personal_name, member_id, personal_email,personal_category);
		return "redirect:/notice_out";
		}
		else
		{
		return "redirect:login";
		}
	}
	
	@RequestMapping(value = "/swindle_main", method = RequestMethod.GET)
	public String swindle_main(Model mo) {
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<SwindleDTO> list = ss.swindleout();
		mo.addAttribute("list", list);
		return "swindle_main";
	}
	
	@RequestMapping(value = "/swindleform", method = RequestMethod.GET)
	public String swindle_form() {
		
		return "swindle_form";
	}
	
    @RequestMapping(value = "/swindlesave", method = RequestMethod.POST)
    public String swindle_insert(MultipartHttpServletRequest mul ,HttpSession si) throws IllegalStateException, IOException {
        String member_id = (String) si.getAttribute("member_id");
        
        if(member_id != null)
        {
        String swindle_title = mul.getParameter("swindle_title");
        String case_content = mul.getParameter("case_content");
        String suspect_id = mul.getParameter("suspect_id");     
        String case_img ="";
        List<MultipartFile> mfArray = mul.getFiles("case_img");
        Service ss =sqlSession.getMapper(Service.class);
        for (MultipartFile mf : mfArray) {
            String filename = mf.getOriginalFilename();
            mf.transferTo(new File(imagepath + "\\" + filename)); // 이미지 파일을 저장
            case_img += (case_img.isEmpty() ? "" : ",") + filename; // 이미지 파일 이름을 문자열에 추가
        }
        
        ss.swindlesave(swindle_title,case_content,case_img,member_id,suspect_id);
        return "redirect:/swindle_main";
        }
        else
        {
        return "redirect:login";
        }
    }
    
    @RequestMapping(value = "/swindledetail", method = RequestMethod.GET)
	public String swindledetail(HttpServletRequest request, Model mo) {
    	
    	int swindle_no = Integer.parseInt(request.getParameter("swindle_no"));
    	
		Service ss = sqlSession.getMapper(Service.class);
		swindle_count(swindle_no);
		
		ArrayList<SwindleDTO> list = ss.swindle_detail(swindle_no);
		
		
		String aa = list.get(0).case_img+",";
	    ArrayList<String> listimg = new ArrayList<String>();
	    while(true) {
	         if(-1==aa.indexOf(",")) break;
	         int size1 = aa.indexOf(",");
	         String img = aa.substring(0, size1);
	         aa=aa.substring(img.length()+1);
	         System.out.println(img);
	         listimg.add(img);
	      }
	    mo.addAttribute("img",listimg);
	    mo.addAttribute("list", list);
		
		return "swindle_detail";
	}

	private void swindle_count(int swindle_no) {
		// 조회수 증가
		Service ss = sqlSession.getMapper(Service.class);
		ss.count(swindle_no);
		
	}
	
	@RequestMapping(value = "/swindle_update",method = RequestMethod.GET  )
	public String swindle_update(HttpServletRequest request, Model mo) {	 
		int swindle_no = Integer.parseInt(request.getParameter("swindle_no"));
		System.out.println(swindle_no);
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<SwindleDTO> list = ss.swinupdate(swindle_no);
		mo.addAttribute("list", list);
		return "swindle_update";
	}
	
	@RequestMapping(value = "/swindleupsave", method = RequestMethod.POST)
	public String swindle_updatesave(MultipartHttpServletRequest mul,HttpSession si) throws IllegalStateException, IOException {
		String member_id = (String) si.getAttribute("member_id");
		int swindle_no = Integer.parseInt(mul.getParameter("swindle_no"));
        String swindle_title = mul.getParameter("swindle_title");
        String case_content = mul.getParameter("case_content");
        String suspect_id = mul.getParameter("suspect_id");     
        String case_img ="";
        List<MultipartFile> mfArray = mul.getFiles("case_img");
        Service ss =sqlSession.getMapper(Service.class);
        for (MultipartFile mf : mfArray) {
            String filename = mf.getOriginalFilename();
            mf.transferTo(new File(imagepath + "\\" + filename)); // 이미지 파일을 저장
            case_img += (case_img.isEmpty() ? "" : ",") + filename; // 이미지 파일 이름을 문자열에 추가
        }
        
        ss.swindleupdate(swindle_title,case_content,case_img,member_id,suspect_id,swindle_no);
        return "redirect:/swindle_main";
        
	}
	
	@RequestMapping(value = "/swindle_del", method = RequestMethod.GET)
	   public String swindledelete(HttpServletRequest request) {	      
		int swindle_no = Integer.parseInt(request.getParameter("swindle_no"));
	      Service ss = sqlSession.getMapper(Service.class);
	      
	      ss.swindle_dela(swindle_no);
	      return "redirect:/swindle_main";
	   }
	
	@RequestMapping (value = "/swindlesearch", method = RequestMethod.POST)
	public String search_notice(HttpServletRequest request, Model mo) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String swindle_search = request.getParameter("swindle_search");
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<SwindleDTO> list = new ArrayList<SwindleDTO>();
		list = ss.swindlesearch(swindle_search);		
		mo.addAttribute("list", list);
		return "swindle_main";
	}
}
