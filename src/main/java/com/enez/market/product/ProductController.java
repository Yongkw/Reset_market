package com.enez.market.product;

import java.io.File;
import java.io.IOException;
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
public class ProductController {

	
		@Autowired
		SqlSession sqlSession;
		String path = "\\\\Mac\\Home\\Desktop\\project\\src\\main\\webapp\\image";
		
		@RequestMapping(value = "/productinput")
		public String product1() {
			
			return "productinput";
		}
		
		@RequestMapping(value = "/productsave", method = RequestMethod.POST)
		public String product2(MultipartHttpServletRequest mul ,HttpSession si) throws IllegalStateException, IOException {
			String member_id = (String) si.getAttribute("member_id");
			
			if(member_id != null)
			{
			String title = mul.getParameter("title");
			String product_image="";
			String ca_name1 = mul.getParameter("ca_name1");
			String ca_name2 = mul.getParameter("ca_name2");
			String category_name = ca_name1+","+ca_name2;
			String location = mul.getParameter("location");
			int price = Integer.parseInt(mul.getParameter("price"));
			String detail = mul.getParameter("detail");
			List<MultipartFile> mfArray = mul.getFiles("product_image");
			Service ss =sqlSession.getMapper(Service.class);
			for (MultipartFile mf : mfArray) {
				String filename = mf.getOriginalFilename();
				mf.transferTo(new File(path + "\\" + filename)); // 이미지 파일을 저장
				product_image += (product_image.isEmpty() ? "" : ",") + filename; // 이미지 파일 이름을 문자열에 추가
		    }
			 System.out.println("가져온 아이디값 : "+member_id );
			 System.out.println("가져온 사진들: "+product_image);
			 System.out.println("가져온 제목 :" + title);
			 System.out.println("가져온 카테고리 :" + category_name);
			 System.out.println("가져온 지역 :" + location);
			 System.out.println("가져온 가격 :" + price);
			 System.out.println("가져온 설명 :" + detail);
			ss.productsave(member_id,product_image,title,category_name,location,price,detail);
			return "redirect:main";
			}
			else
			{
			return "redirect:login";
			}
		}
		@RequestMapping(value = "/")
		public String product3(MultipartHttpServletRequest mul) {
			return "";
		}
		
		@RequestMapping(value = "/productout")
		public String product4(HttpServletRequest request,Model mo) {
			String title = request.getParameter("title");
			
			Service ss = sqlSession.getMapper(Service.class);
			count(title);
			ArrayList<ProductDTO>list= ss.productout(title);
		
			  String aa = list.get(0).product_image+",";
		      ArrayList<String> listimg = new ArrayList<String>();
		      while(true) {
		         if(-1==aa.indexOf(",")) break;
		         int size1 = aa.indexOf(",");
		         String img = aa.substring(0, size1);
		         aa=aa.substring(img.length()+1);
		         System.out.println(img);
		         listimg.add(img);
		      }
			System.out.println(listimg);
			mo.addAttribute("img",listimg);
			mo.addAttribute("list",list);
			
			return "productdetail";
		}

		private void count(String title) {
			Service ss = sqlSession.getMapper(Service.class);
			ss.count(title);
		}
		
}
