package com.enez.market.board;

public class PersonalDTO {
	int personal_no;
	String personal_category,personal_title,personal_content,personal_img,personal_name,personal_id,personal_email, create_at, answer_state, answer_content;
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;
	public PersonalDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getPersonal_no() {
		return personal_no;
	}
	public void setPersonal_no(int personal_no) {
		this.personal_no = personal_no;
	}
	public String getPersonal_category() {
		return personal_category;
	}
	public void setPersonal_category(String personal_category) {
		this.personal_category = personal_category;
	}
	public String getPersonal_title() {
		return personal_title;
	}
	public void setPersonal_title(String personal_title) {
		this.personal_title = personal_title;
	}
	public String getPersonal_img() {
		return personal_img;
	}
	public void setPersonal_img(String personal_img) {
		this.personal_img = personal_img;
	}
	public String getPersonal_name() {
		return personal_name;
	}
	public void setPersonal_name(String personal_name) {
		this.personal_name = personal_name;
	}
	public String getPersonal_id() {
		return personal_id;
	}
	public void setPersonal_id(String personal_id) {
		this.personal_id = personal_id;
	}
	public String getPersonal_email() {
		return personal_email;
	}
	public void setPersonal_email(String personal_email) {
		this.personal_email = personal_email;
	}
	public String getCreate_at() {
		return create_at;
	}
	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}
	public String getPersonal_content() {
		return personal_content;
	}
	public void setPersonal_content(String personal_content) {
		this.personal_content = personal_content;
	}
	public String getAnswer_state() {
		return answer_state;
	}
	public void setAnswer_state(String answer_state) {
		this.answer_state = answer_state;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
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
