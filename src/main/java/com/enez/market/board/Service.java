package com.enez.market.board;

import java.util.ArrayList;

public interface Service {

	public ArrayList<BoardDTO> noticeout();

	public void insert(String notice_title, String notice_content, String notice_writer, String fname, String notice_category);

	public ArrayList<BoardDTO> detailview(int notice_no);

	public void count(int notice_no);

	public ArrayList<BoardDTO> noupdate(int notice_no);

	public void update(String notice_title,   String notice_content, String fname, String notice_writer, String notice_category, int notice_no);

	public void dela(int notice_no);

	public ArrayList<BoardDTO> noticesearch(String search_content);
	

}
