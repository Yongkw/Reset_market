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
			 
			ss.productsave(member_id,product_image,title,category_name,location,price,detail);
            imagedetail(product_image,member_id);
			return "redirect:main";
			}
			else 
			{
			return "redirect:login";
			}
		}
        private void imagedetail(String product_image, String member_id) {
            String main_image ="";
            Service ss = sqlSession.getMapper(Service.class);
            if (product_image != null && !product_image.isEmpty()) {
                String[] imageArray = product_image.split(",");
                main_image = imageArray[0]; // 첫 번째 이미지를 대표 이미지로 선택
            }
            ss.mainimagesave(main_image,member_id);
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
		public String product5(Model mo,HttpSession session,HttpServletRequest request) {
			Service ss = sqlSession.getMapper(Service.class);
			String user ="";
				if(""!=request.getParameter("find_id")&&!"null".equals(request.getParameter("find_id"))&&request.getParameter("find_id")!=null) {
					user =request.getParameter("find_id");
					System.out.println(user);
				}else {
					user=(String)session.getAttribute("member_id");
					System.out.println(user);
				}
				System.out.println("마이페이지 아이디 : "+user);
			if(user.equals("")||user.equals(null)||user.isEmpty()||ss.idcheck(user)==0) {return "redirect:main";}
			List<String> likejjim = ss.likejjim(user); // 내가 찜한 사람들의 상품넘버 리스트
			List<String> getjjim = ss.getjjim(user); // 날 찜한 사람들의 상품넘버 리스트
			UserProfileDTO userdata= ss.getCreateDate(user); // 안에 있는 값 stdata, profile_image, nickname,category_check1
			ArrayList<JjimPoriductDTO> JjimPoriduct  =new ArrayList<JjimPoriductDTO>();//내가 찜한 사람들의 상품 데이터
			ArrayList<FollowProfileDTO> FollowProfile  =new ArrayList<FollowProfileDTO>(); //날 찜한 사람들의 프로필 데이터
			
			JjimPoriduct = ss.getlikejjimProduct(likejjim); 
			FollowProfile = ss.getFollowProfile(getjjim);
			// 추가로 넘겨야 할거 - 자기소계?,상점방문수 + 상품 데이터
			mo.addAttribute("jjimPoriduct",JjimPoriduct);
			mo.addAttribute("followProfile", FollowProfile);
			mo.addAttribute("userdata",userdata);
			return "mypage";
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
		@ResponseBody
		@RequestMapping(value = "jjimcount_mypage")
		public void product_jjim_mypage(HttpServletRequest request) throws IOException {
			// 목적 : 맞 찜하기 - 테이블 RESET_JJIM  요소 MEMBER_ID, DOJJIMER_ID
			// 마이페이지에서 실행, 데이터는 fowid, 세션 user id
			String a= request.getParameter("fowid");
			System.out.println(a);
		}
        @RequestMapping(value = "/productmanager")
        public String product6(Model mo , HttpSession si) {
            String member_id = (String) si.getAttribute("member_id");
            
            if(member_id != null) {
            	System.out.println("가져온 멤버아이디값 :"+member_id);
                Service ss = sqlSession.getMapper(Service.class);
                ArrayList<Product_managerDTO>list=ss.promanager(member_id);
                //ArrayList<Product_managerDTO>image=ss.promanagerimage(member_id);
                mo.addAttribute("list",list);
                //System.out.println("리스트사이즈 :"+list.size()); 
                return "productmanager";
            }
            else {
                return "redirect:login";
            }
        }
        @ResponseBody
        @RequestMapping(value = "pro_state")
        public void product7(HttpServletRequest request, HttpServletResponse response) throws IOException {
        	Service ss =sqlSession.getMapper(Service.class);
        	String vlaue = request.getParameter("state");
        	int vlaue2 =Integer.parseInt(request.getParameter("state2"));
        	

        	System.out.println("가져온값 : "+vlaue);
        	System.out.println("가져온값2 : "+vlaue2);
        	
        	ss.statevlaue(vlaue,vlaue2);
        
        	
        }
		
}
