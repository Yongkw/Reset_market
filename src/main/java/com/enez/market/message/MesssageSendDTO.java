package com.enez.market.message;

import org.springframework.web.multipart.MultipartFile;

public class MesssageSendDTO {

    // board_no chat_no pr_no send_id get_id text image chatdate last_check close
	int board_no; //채팅방 넘버 - 시퀀스
	int chat_no; //채팅 넘버 0에서 하나씩 증가. insert시 SELECT NVL(MAX(chat_no), 0) + 1 FROM RESET_CHATTING where board_no
	int pr_no; //상품 넘버
	String send_id; //채팅을 보낸 아이디
	String get_id; //채팅을 받은 아이디
	String text; //채팅 내역
	String image;//채팅 이미지
	MultipartFile file; //채팅 이미지
	String chatdate; //채팅 날자
	int last_check; //안읽은 매세지 체크 - 받은 아이디가 읽으면 0, 안 읽었으면 1  -  1이면 받은사람이 안읽은것 - 그러므로 체팅방 입장시 해당 1을 0으로 바꾸는 업데이트 필요 													//+ 프로젝트 채팅이 websoket가 아니므로 2초마다 실행 되는 ajax에서 이 칼럼을 0으로 바꾸어야함 
	int close; //채팅방 폭파시 1 폭파 아닐시 0 기본값 0  - 만약 이 칼럼이 1일 경우 체팅방 리스트에 보이지 않게											//+ 프로젝트 채팅이 websoket가 아니므로 2초마다 실행 되는 ajax에서 이 칼럼을 0으로 바꾸어야함 
	int closeget; //채팅방 폭파시 1 폭파 아닐시 0 기본값 0  - 개터 만약 이 칼럼이 1일 경우 체팅방 리스트에 보이지 않게

	String pr_image;
	String pr_state;
	String pr_title;
	String member_name;
	String member_img;
	String pr_location;
	
	
	
	public String getPr_state() {
		return pr_state;
	}
	public void setPr_state(String pr_state) {
		this.pr_state = pr_state;
	}
	public String getPr_location() {
		return pr_location;
	}
	public void setPr_location(String pr_location) {
		this.pr_location = pr_location;
	}
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	@Override
	public String toString() {
		return "board_no=" + board_no +", chatdate=" + chatdate+"---";
	}
	public String getPr_title() {
		return pr_title;
	}
	public void setPr_title(String pr_title) {
		this.pr_title = pr_title;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getPr_image() {
		return pr_image;
	}
	public void setPr_image(String pr_image) {

		if(pr_image.contains(",")) {
			this.pr_image=pr_image.substring(0, pr_image.indexOf(","));
		}else { 
			this.pr_image = pr_image;
		}  
	} 
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getChat_no() {
		return chat_no;
	}
	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getGet_id() {
		return get_id;
	}
	public void setGet_id(String get_id) {
		this.get_id = get_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
 
	public String getChatdate() {
		return chatdate;
	}
	public void setChatdate(String chatdate) {
		this.chatdate = chatdate;
	}
	public int getLast_check() {
		return last_check;
	}
	public void setLast_check(int last_check) {
		this.last_check = last_check;
	}

	public int getClose() {
		return close;
	}
	public void setClose(int close) {
		this.close = close;
	}
	 
	
	
}
