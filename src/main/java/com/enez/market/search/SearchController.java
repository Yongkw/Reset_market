package com.enez.market.search;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class SearchController {
	
	String imagecut = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\image";
	//String imagecut = "\\\\Mac\\Home\\Desktop\\project\\src\\main\\webapp\\image";
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "main_view") 
	public String mainView(Model model) throws UnsupportedEncodingException {
		Service service = sqlSession.getMapper(Service.class);
		int number = 6; 

		ArrayList<Product_search_DTO> product_list_cout= service.pr_search3_1(1,number);
		ArrayList<Product_search_DTO> product_list_date= service.pr_search3_2(1,number);
		ArrayList<Product_search_DTO> product_list_fick= service.pr_search3_3(1,number);
		model.addAttribute("main_list", product_list_cout);
		model.addAttribute("main_list2", product_list_date);
		model.addAttribute("main_list3", product_list_fick);
		
		
		return "main_view";
	}


	@RequestMapping(value = "eventinsert") 
	public String event2(Model model,MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		Service service = sqlSession.getMapper(Service.class);

		MultipartFile mf1 =mul.getFile("title_image");
		MultipartFile image_preview =mul.getFile("image_preview");

		String fname = mf1.getOriginalFilename();
		String fname2 = image_preview.getOriginalFilename();
		mf1.transferTo(new File(imagecut+fname));
		mf1.transferTo(new File(imagecut+fname2));
		String event_title = mul.getParameter("event_title");
		String event_in = mul.getParameter("event_in");
		String event_start_date = mul.getParameter("event_start_date");
		String event_end_date = mul.getParameter("event_end_date");
		
		
		service.insert_event(
				event_title,
				event_in,
				event_start_date,
				event_end_date,
				fname,
				fname2
				);

		return "eventinsert";
		
	}

	@RequestMapping(value = "event_input_view")
	public String event1(Model model){
		return "event_input_view";
	}
	
	
	
	@RequestMapping(value = "pr_search") 
	public String search2(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String find = request.getParameter("navbar_p");
		String p =request.getParameter("pr_page");
		String kate = request.getParameter("findkate");

		System.out.println("검색 조건 : 카테고리: "+kate+"검색키워드: "+find);
		if(kate==null||kate.equals("null")||kate.equals("0")) {
			kate="";
		}
		
		if(find==null||find.equals("null")||find.equals("0")) {
			find="";
		}
		
		Service service = sqlSession.getMapper(Service.class);
		
		int findPage=1;
		int pageLenth=12; 
		int stratpage =1;
		int endpage =1;
		/*1 - 1 - 3
		 * 2 - 4 - 6
		 * 3 - 7 - 9
		 * 4- 10 - 12 
		 * */
		if(p==null||p.equals("null")||p.equals("0")) {
			findPage =1;
		}else {
			findPage =Integer.parseInt(p);
			
		}
		endpage = findPage*pageLenth;
		stratpage = endpage-pageLenth+1;
		
		
		
		
		ArrayList<Product_search_DTO> product_list= service.pr_search2(find,stratpage,endpage,kate);
		int findProductSize= service.pr_search(find,kate);
		
		
		PageboardDTO page = paging(findPage,findProductSize,pageLenth); 
		model.addAttribute("find", find);
		model.addAttribute("list", product_list);
		model.addAttribute("page", page); 
 
		if(page.pull%pageLenth>0) { 
			model.addAttribute("pageM",page.pull/pageLenth+1);
		}else {
			model.addAttribute("pageM", page.pull/pageLenth);
		}
		 
		return "pr_searcht";
		
	}
	
	@RequestMapping(value = "/productdetail")
	public String product() {
		return "productdetail";
	}

	public PageboardDTO paging(int page, int size,int pagelimit) {
		int blocklimit = 3;
	
		
		int maxpage = (int)(Math.ceil((double)size/pagelimit)); 
		int startpage =(((int)(Math.ceil((double)page/blocklimit)))-1)*blocklimit+1; 
		int endpage = startpage+blocklimit-1;
		if(endpage>maxpage) {endpage = maxpage;}
		
		PageboardDTO dto = new PageboardDTO();
		dto.setNow(page);
		dto.setPull(size);
		dto.setStart(startpage);
		dto.setEnd(endpage);

		return dto;
	}
	

	
}
