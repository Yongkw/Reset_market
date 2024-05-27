package com.enez.market.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.enez.market.member.MemberDTO;



@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	String imagepath = "C:\\Users\\Administrator\\Desktop\\ezen-reset_market\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "/notice_out" )
	public String notice(Model mo,HttpSession hs) {	 
		String member_id = (String)hs.getAttribute("member_id");
		if(member_id==null) {
			member_id=" ";
		}
		System.out.println(member_id);
		 Service ss = sqlSession.getMapper(Service.class);
		 MemberDTO member = ss.select(member_id);
		 ArrayList<BoardDTO> list = ss.noticeout();
		 mo.addAttribute("list", list);
		 System.out.println(list);
		 mo.addAttribute("member", member);
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
	public String personal_form(HttpSession hs, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String member_id = (String)hs.getAttribute("member_id");
		
		PrintWriter piw = response.getWriter();
		System.out.println(member_id);
		if(member_id==null) {		
			piw.print("<script>alert('로그인을 해주세요!'); </script>");
			piw.print("<script>window.location.href='/market/main_view';</script>");
			piw.close();
		}
		else {
		}
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
	
	
	
	@RequestMapping(value = "/swindleform", method = RequestMethod.GET)
	public String swindle_form(HttpSession hs, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String member_id = (String)hs.getAttribute("member_id");
		
		PrintWriter piw = response.getWriter();
		System.out.println(member_id);
		if(member_id==null) {		
			piw.print("<script>alert('로그인을 해주세요!'); </script>");
			piw.print("<script>window.location.href='/market/main_view';</script>");
			piw.close();
		}
		else {
		}
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
	public String swindledetail(HttpServletRequest request, Model mo, SwindleDTO swindledto,HttpSession hs) {
    	String member_id = (String)hs.getAttribute("member_id");
		if(member_id==null) {
			member_id=" ";
		}
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
	    mo.addAttribute("move", ss.movePage(swindledto.getSwindle_no()));
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
	
	@RequestMapping (value = "/swindlesearch1", method = RequestMethod.POST)
	public String search_notice1(HttpServletRequest request, Model mo) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String swindle_search = request.getParameter("swindle_search");
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<SwindleDTO> list = new ArrayList<SwindleDTO>();
		list = ss.swindlesearch(swindle_search);		
		mo.addAttribute("list", list);
		return "swindlemore";
	}
	
	@RequestMapping(value = "/swindlemore", method = RequestMethod.GET)
	public String swindlemore(HttpServletRequest request, PageDTO dto, Model mo) {
		String nowPage=request.getParameter("nowPage");
	    String cntPerPage=request.getParameter("cntPerPage");
	    
		Service ss = sqlSession.getMapper(Service.class);
		
		int total=ss.total();	     
	       if(nowPage==null && cntPerPage == null) { 
	          nowPage="1";
	          cntPerPage="5";
	       }
	       else if(nowPage==null) {
	          nowPage="1";
	       }
	       else if(cntPerPage==null) {
	          cntPerPage="5";
	       }      
	       dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
	       mo.addAttribute("paging",dto);
	       mo.addAttribute("list",ss.page(dto));
	       
	//	ArrayList<SwindleDTO> list = ss.swindleoutmore();
	//	mo.addAttribute("list", list);
		return "swindlemore";
	}
	
	@RequestMapping(value = "/swindle_main", method = RequestMethod.GET)
	public String swindle_main(Model mo) { 
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<SwindleDTO> list = ss.swindleout();
		mo.addAttribute("list", list);
		return "swindle_main";
	}
	
	@RequestMapping(value = "/info_out")
	public String mypage(HttpServletRequest request,HttpSession hs,Model mo, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String member_id = (String)hs.getAttribute("member_id");
		
		PrintWriter piw = response.getWriter();
		System.out.println(member_id);
		if(member_id==null) {		
			piw.print("<script>alert('로그인을 해주세요!'); </script>");
			piw.print("<script>window.location.href='/market/main_view';</script>");
			piw.close();
		}
		else {
		Service ss = sqlSession.getMapper(Service.class);
		MemberDTO member = ss.select(member_id);
		ArrayList<PersonalDTO> list = ss.personalout(member_id);
		mo.addAttribute("list",list);
		mo.addAttribute("member", member);
		}
		return "info_out";
	}
	
	@RequestMapping(value = "/info_swindle")
	public String mypage2(HttpServletRequest request,HttpSession hs,Model mo) {
		String member_id = (String)hs.getAttribute("member_id");		
		System.out.println(member_id);	
		Service ss = sqlSession.getMapper(Service.class);
		MemberDTO member = ss.select(member_id);
		
		ArrayList<SwindleDTO> list = ss.infoswindleout(member_id);
		mo.addAttribute("list",list);
		mo.addAttribute("member", member);

		return "info_swindle";
	}
	
	@RequestMapping(value = "/personaldetail", method = RequestMethod.GET)
	public String personaldetail(HttpServletRequest request, Model mo, PersonalDTO personaldto) {   	
    	int personal_no = Integer.parseInt(request.getParameter("personal_no"));
    	
		Service ss = sqlSession.getMapper(Service.class);
		
		ArrayList<PersonalDTO> list = ss.personal_detail(personal_no);
		
		String aa = list.get(0).personal_img+",";
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
	    mo.addAttribute("move", ss.movePage(personaldto.getPersonal_no()));
		return "personal_detail";
	}
	
	@RequestMapping(value = "/personal_update",method = RequestMethod.GET  )
	public String personal_update(HttpServletRequest request, Model mo) {	 
		int personal_no = Integer.parseInt(request.getParameter("personal_no"));
		System.out.println(personal_no);
		Service ss = sqlSession.getMapper(Service.class);
		ArrayList<PersonalDTO> list = ss.perupdate(personal_no);
		mo.addAttribute("list", list);
		return "personal_update";
	}
	
	@RequestMapping(value = "/personalupsave", method = RequestMethod.POST)
	public String personal_updatesave(HttpServletRequest request) {
		int personal_no = Integer.parseInt(request.getParameter("personal_no"));
        String answer_content = request.getParameter("answer_content");
        String answer_state = request.getParameter("answer_state");
    
        Service ss =sqlSession.getMapper(Service.class);      
        ss.personalupdate(personal_no,answer_content,answer_state);
        return "redirect:/info_out";
        
	}
	
	@RequestMapping("/python1")
	public String python1() throws InterruptedException, IOException {

        String a1; //실행될 파이썬 파일의 경로설정
        ProcessBuilder processBuilder; //실행객체
        a1 = "C:\\ezenpython\\cyberout.py";
        processBuilder = new ProcessBuilder("python",a1);
        processBuilder.redirectErrorStream(true);
        Process process = processBuilder.start();
        int result = process.waitFor();

        return "redirect:/swindle_main";
    }
	
	
}
