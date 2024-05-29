package com.enez.market.board;

import java.util.ArrayList;

import com.enez.market.member.MemberDTO;

public interface Service {

	public ArrayList<BoardDTO> noticeout();

	public void insert(String notice_title, String notice_content, String notice_writer, String fname, String notice_category);

	public ArrayList<BoardDTO> detailview(int notice_no);

	public void count(int notice_no);

	public ArrayList<BoardDTO> noupdate(int notice_no);

	public void update(String notice_title,   String notice_content, String fname, String notice_writer, String notice_category, int notice_no);

	public void dela(int notice_no);

	public ArrayList<BoardDTO> noticesearch(String search_content);
	
    public void personalsave(String personal_title, String personal_content, String personal_img, String personal_name,
            String member_id, String personal_email, String personal_category);

    public ArrayList<SwindleDTO> swindleout();

    public void swindlesave(String swindle_title, String case_content, String case_img, String member_id, String suspect_id);

	public ArrayList<SwindleDTO> swindle_detail(int swindle_no);

	public ArrayList<SwindleDTO> swinupdate(int swindle_no);

	public void swindleupdate(String swindle_title, String case_content, String case_img, String member_id,
			String suspect_id, int swindle_no);

	public void swindle_dela(int swindle_no);

	public ArrayList<SwindleDTO> swindlesearch(String swindle_search);

	public ArrayList<SwindleDTO> swindleoutmore();

	public ArrayList<SwindleDTO> page(PageDTO dto);

	public int total();

	public Object movePage(int swindle_no);

	public MemberDTO select(String member_id);

	public ArrayList<PersonalDTO> personalout(String member_id);

	public ArrayList<SwindleDTO> infoswindleout(String member_id);

	public ArrayList<PersonalDTO> personal_detail(int personal_no);

	public ArrayList<PersonalDTO> perupdate(int personal_no);

	public void personalupdate(int personal_no, String answer_content, String answer_state);

	public ArrayList<PersonalDTO> faqadmin();

	public ArrayList<SwindleDTO> swindleadmin();

	public ArrayList<PersonalDTO> page2(PageDTO dto);

	
	
}
