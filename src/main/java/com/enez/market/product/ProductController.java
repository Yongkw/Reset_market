package com.enez.market.product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
public class ProductController {

	
		@Autowired
		SqlSession sqlSession;
		//String path = "\\\\Mac\\Home\\Desktop\\Sourectree\\YongKwon\\src\\main\\webapp\\image";
		String path = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\image";
		
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

			int jcount = ss.jjimcount(list.get(0).product_no);
			mo.addAttribute("img",listimg);
			mo.addAttribute("list",list);
			mo.addAttribute("jjim",jcount);
			
			return "productdetail";
		}

		private void count(String title) {
			Service ss = sqlSession.getMapper(Service.class);
			ss.count(title);
		}
		@RequestMapping(value = "/mypage")
		public String product5() {
			return "mypage";
		}
		@ResponseBody
		@RequestMapping(value = "jjimcount")
		public void product_jjim(HttpServletRequest request, HttpServletResponse response) throws IOException {
			// 찜버튼 누를시 찜 테이블 유저 체크 select, 있다면 삭제 없다면 생성 delete, insert   
			Service service = sqlSession.getMapper(Service.class);
			int pr_no= Integer.parseInt(request.getParameter("pr_no"));
			String thisid=request.getParameter("thisid");
			String seller_id=request.getParameter("seller_id");
			
			System.out.println("pr_no: "+pr_no+" thisid :"+thisid+" seller_id : "+seller_id);
			if(request.getParameter("thisid").equals("null")) { //만약 비회원 이라면 실행 안되게 
				response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 성공 상태 코드를 설정합니다.
				response.getWriter().write("로그인 후 이용가능 합니다.");	
			}
			int count=service.jjimcheck(pr_no,thisid,seller_id);
			if(count>0) {
			service.jjimupdate_delet(pr_no,thisid,seller_id);
			}else{
			service.jjimupdate_insert(pr_no,thisid,seller_id);
			}
			int jcount = service.jjimcount(pr_no);
			PrintWriter pw =response.getWriter();
			pw.print(jcount);
			
		}
		
}
