package com.enez.market.product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

import com.enez.market.member.MemberDTO;


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
			Service ss = sqlSession.getMapper(Service.class);
			String title = request.getParameter("title");
			String product_no = request.getParameter("product_no"); 
			ArrayList<ProductDTO>list = new ArrayList<ProductDTO>(); 
			
			if(product_no!=null) {
			 list= ss.productoutByPr_number(product_no);
			ss.count(product_no);
			}else {
				list= ss.productout(title);
				count(title);
			}
			
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
			mo.addAttribute("jjim",jcount);
			mo.addAttribute("img",listimg);
			mo.addAttribute("list",list); 
			
			return "productdetail";
		}

		private void count(String title) {
			Service ss = sqlSession.getMapper(Service.class);
			ss.count(title);
		}
		@RequestMapping(value = "/mypage")
		public String product5(Model mo,HttpSession session) {
			Service ss = sqlSession.getMapper(Service.class);
			String user = (String)session.getAttribute("member_id");
			if(user.equals("")||user.equals(null)||user.isEmpty()||ss.idcheck(user)==0) {return "redirect:main";}
			List<String> likejjim = ss.likejjim(user); // 내가 찜한 사람들의 상품넘버 리스트
			List<String> getjjim = ss.getjjim(user); // 날 찜한 사람들의 상품넘버 리스트
			List<String> newgetList = getjjim.stream().distinct().collect(Collectors.toList());// 중복제거
					
			UserProfileDTO userdata= ss.getCreateDate(user); // 안에 있는 값 stdata, profile_image, nickname,category_check1
			ArrayList<JjimPoriductDTO> JjimPoriduct  =new ArrayList<JjimPoriductDTO>();//내가 찜한 사람들의 상품 데이터
			ArrayList<FollowProfileDTO> FollowProfile  =new ArrayList<FollowProfileDTO>(); //날 찜한 사람들의 프로필 데이터
			
			JjimPoriduct = ss.getlikejjimProduct(likejjim); 
			FollowProfile = ss.getFollowProfile(newgetList);

			// 추가로 넘겨야 할거 - 자기소계?,상점방문수 + 상품 데이터
			mo.addAttribute("jjimPoriduct",JjimPoriduct);
			mo.addAttribute("followProfile", FollowProfile);
			mo.addAttribute("userdata",userdata);
			return "mypage";
		}
 
		@RequestMapping(value = "jjimcancle")
		public String jjimcancle(HttpServletRequest request,HttpSession session) {
			String pr_no = request.getParameter("pr_no");
			String user = (String)session.getAttribute("member_id");
			Service service = sqlSession.getMapper(Service.class);
			service.deljjim(pr_no,user);
			
			return "redirect:mypage";
		}
		@ResponseBody
		@RequestMapping(value = "jjimcount")
		public void product_jjim(HttpServletRequest request, HttpServletResponse response) throws IOException {
			// 찜관련 미구현 : 자기 자신을 찜할 때에 막음
			// 찜버튼 누를시 찜 테이블 유저 체크 select, 있다면 삭제 없다면 생성 delete, insert   
			Service service = sqlSession.getMapper(Service.class);
			int pr_no= Integer.parseInt(request.getParameter("pr_no"));
			String thisid=request.getParameter("thisid");
			String seller_id=request.getParameter("seller_id");
			PrintWriter pw =response.getWriter();
			
			if(thisid.equals("null")||thisid==null) { //만약 비회원 이라면 실행 안되게 
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
			pw.print(jcount);
			
		}
		
}
