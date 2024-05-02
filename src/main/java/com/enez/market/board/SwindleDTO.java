package com.enez.market.board;

public class SwindleDTO {
	int swindle_no, groups, swindle_cnt, prevNum, nextNum;
	String  swindle_title, case_content, case_img, victim_id, suspect_id, create_at, update_at, prevTitle, nextTitle;
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
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	
	
}
