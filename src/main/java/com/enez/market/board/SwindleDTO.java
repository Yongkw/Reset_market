package com.enez.market.board;

public class SwindleDTO {
	int swindle_no, groups, swindle_cnt;
	String  swindle_title, case_content, case_img, victim_id, suspect_id, create_at, update_at;
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;
	public SwindleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSwindle_no() {
		return swindle_no;
	}
	public void setSwindle_no(int swindle_no) {
		this.swindle_no = swindle_no;
	}
	public int getGroups() {
		return groups;
	}
	public void setGroups(int groups) {
		this.groups = groups;
	}
	public String getSwindle_title() {
		return swindle_title;
	}
	public void setSwindle_title(String swindle_title) {
		this.swindle_title = swindle_title;
	}
	public String getCase_content() {
		return case_content;
	}
	public void setCase_content(String case_content) {
		this.case_content = case_content;
	}
	public String getCase_img() {
		return case_img;
	}
	public void setCase_img(String case_img) {
		this.case_img = case_img;
	}
	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}
	public String getVictim_id() {
		return victim_id;
	}
	public void setVictim_id(String victim_id) {
		this.victim_id = victim_id;
	}
	public String getSuspect_id() {
		return suspect_id;
	}
	public void setSuspect_id(String suspect_id) {
		this.suspect_id = suspect_id;
	}
	public int getSwindle_cnt() {
		return swindle_cnt;
	}
	public void setSwindle_cnt(int swindle_cnt) {
		this.swindle_cnt = swindle_cnt;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getLasttitle() {
		return lasttitle;
	}
	public void setLasttitle(String lasttitle) {
		this.lasttitle = lasttitle;
	}
	
	
	
	
}
