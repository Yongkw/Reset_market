package com.enez.market.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.enez.market.product.FollowProfileDTO;
import com.enez.market.product.JjimPoriductDTO;
import com.enez.market.product.ProductDTO;
import com.enez.market.product.UserProfileDTO;



@Controller
public class MemberController {
	@Autowired
	SqlSession sqlSession;
	String path = "C:\\Users\\Administrator\\Desktop\\realreal market (5)\\src\\main\\webapp\\image";

	@RequestMapping(value = "/signup")
	public String member_signup() {

		return "signup";
	}

	@RequestMapping(value = "/checkid")
	@ResponseBody
	public String idcheck(String id) {

		Service ss = sqlSession.getMapper(Service.class);
		String bigo = "";
		int count = ss.idch(id);
		if (count == 1) {
			bigo = "no";
		} else {
			bigo = "ok";
		}

		return bigo;
	}

	@RequestMapping(value = "/membersave", method = RequestMethod.POST)
	public String membersv(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {

		String member_id = mul.getParameter("sign_id");
		String member_pw = mul.getParameter("pw1");
		String member_name = mul.getParameter("name");
		String phone = mul.getParameter("phone1") + "-" + mul.getParameter("phone2") + "-" + mul.getParameter("phone3");
		String address = mul.getParameter("addr2");
		String nickname = mul.getParameter("nickname");
		MultipartFile mf = mul.getFile("profile_image");
		String fname = mf.getOriginalFilename();
		String category_check1 = mul.getParameter("cate1") + "/" + mul.getParameter("cate2");
		Service ss = sqlSession.getMapper(Service.class);
		if (fname.equals("")) {
			ss.membersave1(member_id, member_pw, member_name, address, phone, nickname, category_check1);
		} else {
			fname = filesave(fname, mf.getBytes());
			mf.transferTo(new File(path + "\\" + fname));

			ss.membersave(member_id, member_pw, member_name, address, phone, nickname, category_check1, fname);
		}
		return "redirect:main_view";

	}

	private String filesave(String fname, byte[] bytes) {
		UUID ud = UUID.randomUUID();
		String name = ud.toString() + "_" + fname;

		return name;

	}

	@RequestMapping(value = "/checknick")
	@ResponseBody
	public String nickcheck(String nick) {

		Service ss = sqlSession.getMapper(Service.class);
		String bigo = "";

		int count = ss.nickch(nick);
		if (count == 1) {
			bigo = "no";
		} else {
			bigo = "ok";
		}

		return bigo;
	}

	@RequestMapping(value = "/loginok", method = RequestMethod.POST)
	public String loginsuccess(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String member_id = request.getParameter("login_id");
		String member_pw = request.getParameter("login_pw");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter piw = response.getWriter();
		Service ss = sqlSession.getMapper(Service.class);
		MemberDTO dto = ss.loginok(member_id, member_pw);
		if (dto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("member_id", dto.getMember_id());
			hs.setAttribute("loginstate", true);
			hs.setMaxInactiveInterval(1800);

			piw.print("<script>alert('" + dto.member_id + "님 환영합니다!'); </script>");
			piw.print("<script>window.location.href='/market/main_view';</script>");
			piw.close();

		} else {
			piw.print("<script>alert('일치하는 회원이 없습니다!')</script>");
			piw.print("<script> window.location.href='/market/main_view';</script>");
			piw.close();

		}
		return null;

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession hs = request.getSession();
		hs.removeAttribute("dto");
		hs.removeAttribute("loginstate");
		hs.removeAttribute("member_id");
		hs.setAttribute("loginstate", false);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter piw = response.getWriter();
		piw.print("<script> alert('안전하게 로그아웃 되었습니다!!');</script>");
		piw.print("<script>window.location.href='/market/main';</script>");
		piw.close();

		return null;

	}

	@RequestMapping(value = "/memberlist")
	public String memberlist(HttpServletRequest request, HttpServletResponse response, Model mo) throws IOException {
		HttpSession hs = request.getSession();
		String memberId = (String) hs.getAttribute("member_id");
		//Boolean flag = (Boolean) hs.getAttribute("loginstate");
		if (memberId != null) {
		if ("admin".equals(memberId)) {
			Service ss = sqlSession.getMapper(Service.class);
			ArrayList<MemberDTO> list = ss.printmember();
			mo.addAttribute("list", list);
			return "memberlist";

		} else {
			PrintWriter piw = response.getWriter();
			response.setContentType("text/html;charset=utf-8");

			piw.print("<script> alert('관리자만 열람 가능!');</script>");
			piw.print("<script> window.location.href='/market/main'</script>");
			piw.close();

		}

		
	}
		return null;
	}

	@RequestMapping(value = "/login")
	public String login() {

		return "login";
	}

	@RequestMapping(value = "/myinfo_search")
	public String searchinfo() {

		return "membersearch";
	}

	@ResponseBody
	@RequestMapping(value = "/idsearch", method = RequestMethod.POST)
	public String idsearch(HttpServletRequest request) {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		System.out.println(phone);
		System.out.println(name);
		Service ss = sqlSession.getMapper(Service.class);
		String id = ss.idresult(name, phone);
		System.out.println(id);
		return id;
	}

	@ResponseBody
	@RequestMapping(value = "/pwsearch", method = RequestMethod.POST)
	public String pwsearch(HttpServletRequest request) {
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		System.out.println("아이디 :"+id);
		System.out.println("폰번:"+phone);
		System.out.println("이름 : "+name);
		Service ss = sqlSession.getMapper(Service.class);
		String pw = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 7);
		System.out.println("새비번 : "+pw);
		ss.pwresult(id, name, phone ,pw); //반환 할 값이 없기때문에
		
		return pw;
	}
	
	
	@RequestMapping(value = "/myinfo")
	public String myinfo(HttpSession hs, Model mo,HttpServletResponse response) throws IOException {
	    String member_id = (String) hs.getAttribute("member_id"); 

	    if (member_id != null) {
	        Service ss = sqlSession.getMapper(Service.class);
	        MemberDTO member = ss.select(member_id);
	        if (member != null) {
	            String phone = member.getPhone();
	            String[] ph = phone.split("-");
	            String phone1 = ph[0];
	            String phone2 = ph[1];
	            String phone3 = ph[2];
	            
	            mo.addAttribute("member_id", member.getMember_id());
	            mo.addAttribute("member_pw", member.getMember_pw());
	            mo.addAttribute("member_name", member.getMember_name());
	            mo.addAttribute("address", member.getAddress());
	            mo.addAttribute("phone1", phone1);
	            mo.addAttribute("phone2", phone2);
	            mo.addAttribute("phone3", phone3);
	            mo.addAttribute("nickname", member.getNickname());
	            mo.addAttribute("profile_image", member.getProfile_image());
	            
	            return "myinfo";
	        }
	        
	    }
	    else {
        	response.setContentType("text/html;charset=utf-8");
			PrintWriter piw = response.getWriter();
			piw.print("<script>alert('로그인 후 이용가능!');</script>");
			piw.print("<script>window.location.href='/market/login'</script>");
			piw.close();
			
        	
        }
	    	return "redirect:login";
	    
	}
	
	@RequestMapping(value = "/membermodify", method = RequestMethod.POST)
	public String modysave(MultipartHttpServletRequest mul,HttpSession hs) throws IOException {
		String member_id = (String) hs.getAttribute("member_id");
		String new_pw = mul.getParameter("new_pw");
		String phone = mul.getParameter("phone1") + "-" + mul.getParameter("phone2") + "-" + mul.getParameter("phone3");
		String address = mul.getParameter("addr2");
		String nickname = mul.getParameter("new_nick");
		MultipartFile mf = mul.getFile("profile_image");
		Service ss = sqlSession.getMapper(Service.class);
		String nowpw = mul.getParameter("nowpw");
		String fname = mf.getOriginalFilename();
		System.out.println("현재비번 :"+nowpw);
		System.out.println("새비번 :"+new_pw);
		System.out.println("주소 :"+address);
		System.out.println("연락처"+phone);
		System.out.println("닉네임 :"+nickname);
		System.out.println("파일이름 :"+fname); // 이게 기존 저장되어있는 사진파일을 의미함..
		System.out.println("접속된 아이디 : " + member_id);
		String oldimg = ss.oldimg(member_id); 
			
		
		if(mf != null && !mf.isEmpty()) {// 만약 새이미지가 업로드 되면 즉 mf가 널값이 아니거나 , 비어있지 않다면
			//이전파일 삭제
			if(!"default_image.jpg".equals(oldimg)) //이전파일이 널이 아니라면.. 이전파일을  삭제한다..
			{
				File oldfile = new File(path+"\\"+oldimg);
				oldfile.delete(); // 이전 파일 삭제
				
			}
			// 새로 업로드된 파일을 저장해줌
			fname = mf.getOriginalFilename();
			fname = filesave(fname,mf.getBytes());		
			mf.transferTo(new File(path+"\\"+fname));
			
			
		 } else { // 새 파일이 null이거나 비어있는 경우
		            // 이전 파일이 존재하는 경우에만 파일명을 이전 파일명으로 설정
		            fname = oldimg;
		        }
		    
				
			
		
		if(new_pw.equals("") || new_pw.equals(null))//새로운 패스워드가 없으면 
		{
			ss.modify(member_id,nowpw,phone,address,nickname,fname); // nowpw 기존 비밀번호를 삽입
			
		}
		else
		{
			ss.modify_2(member_id,new_pw,phone,address,nickname,fname); // 새로운 비밀번호가 있으면 new_pw 넣어줌..!
			
		}
		
		return "redirect:myinfo";
	}
	
	
	@RequestMapping(value = "/resign")
	public String resign(HttpServletRequest request, HttpSession hs , Model mo,HttpServletResponse response) throws IOException {
		Service ss= sqlSession.getMapper(Service.class);
		String member_id = (String)hs.getAttribute("member_id");
		
		if(member_id != null){
			MemberDTO member = ss.select(member_id);
			mo.addAttribute("member_id", member_id);
			mo.addAttribute("member_pw", member.getMember_pw());
			return "resign";
		}
		else{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter piw = response.getWriter();
			piw.print("<script>alert('로그인 후 이용가능!');</script>");
			piw.print("<script>window.location.href='/market/login'</script>");
			piw.close();
			
			
		}
		
		return "login";
	}
	
	
	@RequestMapping(value = "resignok" , method = RequestMethod.POST)
	public String resignok(HttpServletRequest request,HttpSession hs) {
		String id = request.getParameter("rs_id");
		String pw = request.getParameter("rs_pw");
		System.out.println("회원 탈퇴 아이디는 : "+id);
		System.out.println("회원 탈퇴 하는 사람 비밀번호는 : "+pw);
		Service ss = sqlSession.getMapper(Service.class);
		ss.resign(id,pw);
		hs = request.getSession();
		hs.removeAttribute("dto");
		hs.removeAttribute("loginstate");
		hs.removeAttribute("member_id");
		hs.setAttribute("loginstate", false);
		hs.invalidate();// 세션을 완전히 종료하는 함수
		
		return "redirect:/main_view";
	}
	
	@RequestMapping(value = "/deletemember")
	public String deletemember(HttpServletRequest request) {
		String member_id = request.getParameter("member_id");
		String profile_image = request.getParameter("profile_image");
		System.out.println("아이디는?" + member_id);
		System.out.println("프로필 이미지는?"+profile_image);
		Service ss = sqlSession.getMapper(Service.class);
		
		if(profile_image == null || profile_image.equals("") || "default_image.jpg".equals(profile_image))
		{
			ss.member_delete(member_id);
			
		}
		else
		{
			File dimg = new File(path+"\\"+profile_image);
			if(dimg.exists()) {
				dimg.delete();
				
			}
			ss.member_delete(member_id);
			
			
		}
		
		return "redirect:memberlist";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "introsave")
	public String intro(HttpServletRequest request,HttpSession hs,Model mo) {
		String member_id = (String)hs.getAttribute("member_id");
		String intro = request.getParameter("intro");
		Service ss = sqlSession.getMapper(Service.class);
		ss.itrsave(member_id,intro);
		
		return "";
	}
	
	
	@RequestMapping(value = "sdpage")
	public String sdpage(HttpServletRequest request , HttpSession hs , Model mo) {
		String user_id = (String)hs.getAttribute("member_id");
		String member_id=request.getParameter("member_id");
		System.out.println("찜한 사람 닉네임 :"+member_id);
		Service ss = sqlSession.getMapper(Service.class);
		MemberDTO member = ss.select(member_id);
	 
		
		//찜데이터
		com.enez.market.product.Service pp = sqlSession.getMapper(com.enez.market.product.Service.class);
		if(member_id.equals("")||member_id.equals(null)||member_id.isEmpty()||pp.idcheck(member_id)==0) {return "redirect:main";}
		List<String> likejjim = pp.likejjim(member_id); // 내가 찜한 사람들의 상품넘버 리스트
		List<String> getjjim = pp.getjjim(member_id); // 날 찜한 사람들의 상품넘버 리스트
		
		
		
		UserProfileDTO userdata= pp.getCreateDate(member_id); // 안에 있는 값 stdata, profile_image, nickname,category_check1
		ArrayList<JjimPoriductDTO> JjimPoriduct  =new ArrayList<JjimPoriductDTO>();//내가 찜한 사람들의 상품 데이터
		ArrayList<FollowProfileDTO> FollowProfile  =new ArrayList<FollowProfileDTO>(); //날 찜한 사람들의 프로필 데이터
		// 상대방의 상품정보 
		ArrayList<ProductDTO> list = pp.productout1(member_id);
		
		JjimPoriduct = pp.getlikejjimProduct(likejjim); 
		FollowProfile = pp.getFollowProfile(getjjim);
		// 추가로 넘겨야 할거 - 자기소계?,상점방문수 + 상품 데이터
		
		
		if(user_id.equals(member_id) ) {
			mo.addAttribute("list", list);
			mo.addAttribute("member", member);
			mo.addAttribute("jjimPoriduct",JjimPoriduct);
			mo.addAttribute("followProfile", FollowProfile);
			mo.addAttribute("userdata",userdata);
			return "redirect:mypage";
		}
		else
			ss.readcnt(member_id);
			mo.addAttribute("list", list);
			mo.addAttribute("member", member);
			mo.addAttribute("jjimPoriduct",JjimPoriduct);
			mo.addAttribute("followProfile", FollowProfile);
			mo.addAttribute("userdata",userdata);
			
		return "mypage2";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/sort" ,method = RequestMethod.POST)
	public List<ProductDTO> sort(HttpServletRequest request,Model mo) {
		Service ss = sqlSession.getMapper(Service.class);
		com.enez.market.product.Service pp = sqlSession.getMapper(com.enez.market.product.Service.class);
		String seller_id = request.getParameter("seller_id");
		String state = request.getParameter("state");
		String order = request.getParameter("order");
		//List<ProductDTO> products = null;
		List<ProductDTO>products=pp.productout1(seller_id);
		System.out.println("넘어온 아이디 : "+seller_id);
		System.out.println("상태값 값 : "+state);
		System.out.println("오더 값 : "+order);
		if (state.equals("전체")) {
			products = ss.sortnew(seller_id);
		} else {
		    products = pp.statesort(seller_id, state);
		}

		// 가격에 따른 정렬
		if (order == "new") {
		    products = ss.sortnew(seller_id);
		} else if (order == "prasc") {
		    products = ss.high(seller_id);
		} else if (order == "prdesc") {
		    products = ss.low(seller_id);
		}

	
		return products;
	
	}
	
	@ResponseBody
	@RequestMapping(value = "search_member",method = RequestMethod.POST)
	public ArrayList<MemberDTO> member_list(@RequestParam String option,@RequestParam String value,Model mo) {
		Service ss = sqlSession.getMapper(Service.class);
		System.out.println("넘어온 옵션: "+option);
		System.out.println("넘어온 밸류: "+value);
		ArrayList<MemberDTO> dto = null;
		if(option.equals("아이디")) {
			dto = ss.search_id(value);
			
			System.out.println("아이디 dto :"+dto);
		}
		else if(option.equals("이름")) {
			
			dto = ss.search_name(value);
			
		}
		else {
			
			dto = ss.search_phone(value);
			
		}
		
		
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping(value = "delmem", method = RequestMethod.POST)
	public String delmem(@RequestParam String member_id,@RequestParam String profile_image) {
		Service ss = sqlSession.getMapper(Service.class);
		System.out.println("삭제할 아이디 : "+member_id);
		System.out.println("삭제할 프로필 이미지 :" + profile_image);

		
		//관리자 삭제 불가능하게
		
		
		
		if(profile_image == null || profile_image.equals("") || "default_image.jpg".equals(profile_image))
		{
			ss.member_delete(member_id);
			return "success" ;
		}
		else if(member_id.equals("admin"))
		{
			return "false";
		}
		else
		{
			File dimg = new File(path+"\\"+profile_image);
			if(dimg.exists()) {
				dimg.delete();
				
			}
			ss.member_delete(member_id);
			return "success" ;
			
		}
		
	
	}
	
}
