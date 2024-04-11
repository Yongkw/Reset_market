package com.enez.market.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqlSession;
	String path = "\\\\Mac\\Home\\Desktop\\project\\src\\main\\webapp\\image";

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

		String member_id = mul.getParameter("id");
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
		return "redirect:main";

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
		String member_id = request.getParameter("id");
		String member_pw = request.getParameter("pw");
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
			piw.print("<script>window.location.href='/market/main';</script>");
			piw.close();

		} else {
			piw.print("<script>alert('일치하는 회원이 없습니다!')</script>");
			piw.print("<script> window.location.href='/market/login';</script>");
			piw.close();

		}
		return null;

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession hs = request.getSession();
		hs.removeAttribute("dto");
		hs.removeAttribute("loginstate");
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
		String jumin = request.getParameter("jumin");
		String name = request.getParameter("name");
		Service ss = sqlSession.getMapper(Service.class);
		String pw = ss.pwresult(id, jumin, name);
		System.out.println(pw);
		System.out.println(id);
		System.out.println(jumin);
		return pw;
	}

}
