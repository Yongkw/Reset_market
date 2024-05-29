package com.enez.market;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.enez.market.search.Product_search_DTO;
import com.enez.market.search.Service;

@Controller
public class HomeController {
	@Autowired  
	SqlSession sqlSession;
	


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session) {
		if (session.getAttribute("login_st")==null) {
			session.setAttribute("login_st", 0);	
			session.setMaxInactiveInterval(1800);
		}
		
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
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpSession session) {
		if (session.getAttribute("login_st")==null) {
			session.setAttribute("login_st", 0);	
			session.setMaxInactiveInterval(1800);
		}
		
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
	
}
