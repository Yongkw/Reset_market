package com.enez.market.member;

import java.util.ArrayList;

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

	String pwresult(String id, String jumin, String name);

	

	

}
