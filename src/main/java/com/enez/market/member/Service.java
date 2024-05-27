package com.enez.market.member;

import java.util.ArrayList;
import java.util.List;

import com.enez.market.product.ProductDTO;

public interface Service {

	void membersave1(String member_id, String member_pw, String member_name, String address, String phone,
			String nickname, String category_check1);
	
	void membersave(String member_id, String member_pw, String member_name, String address, String phone,
			String nickname, String category_check1, String fname);

	int idch(String member_id);

	int nickch(String nick);

	ArrayList<MemberDTO> printmember();

	MemberDTO loginok(String member_id, String member_pw);

	String idresult(String name, String phone);

	void pwresult(String id, String name, String phone, String pw);

	void member_delete(String member_id);

	MemberDTO select(String member_id);

	void modify(String member_id, String nowpw, String phone, String address, String nickname, String fname);

	void modify_2(String member_id, String new_pw, String phone, String address, String nickname, String fname);

	String oldimg(String member_id);

	void resign(String id, String pw);

	void itrsave(String member_id, String intro);

	MemberDTO sdpage(String nickname);

	MemberDTO memnick(String member_id, String nickname);

	String sdnick(String nickname);

	void readcnt(String member_id);

	ArrayList<ProductDTO> product_out(String member_id);
	
	List<ProductDTO> sortnew(String seller_id);

	//이름검색
	ArrayList<MemberDTO> search_name(String value);
	//전화번호 검색
	ArrayList<MemberDTO> search_phone(String value);
	//아이디 검색
	ArrayList<MemberDTO> search_id(String value);



	

	

}
