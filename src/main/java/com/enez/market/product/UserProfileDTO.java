package com.enez.market.product;

public class UserProfileDTO {
	/*유저 마이페이지 프로필에 들어갈 데이터
	 * 1.닉네임 //user
	 * 2.상점오픈일 //user
	 * 3.상점 방문자수 - 미구현
	 * 4.판매한 상품 수 - ? 판매완료 된 수? 판매중을 포함한 수? //product
	 * 5.찜한 수 //jjim
	 * 6.찜 받은 수 //jjim
	 * 7.자기소계 - 미구현 
	 * 8.메너 온도 //user
	 * 9.프로필 이미지 //user
	 * 10.프로필 유저 아이디
	 */
	
	String stdate, profile_image, nickname,prductsu,jjimdo,jjimget,manner,id;
	//추가 상점 방문자수, 자기소계

	public UserProfileDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "UserProfileDTO [stdate=" + stdate + ", profile_image=" + profile_image + ", nickname=" + nickname
				+ ", prductsu=" + prductsu + ", jjimdo=" + jjimdo + ", jjimget=" + jjimget + ", manner=" + manner + "]";
	}

	public String getStdate() {
		return stdate;
	}

	public void setStdate(String stdate) {
		this.stdate = stdate;
	}

	public String getProfile_image() {
		return profile_image;
	}

	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPrductsu() {
		return prductsu;
	}

	public void setPrductsu(String prductsu) {
		this.prductsu = prductsu;
	}

	public String getJjimdo() {
		return jjimdo;
	}

	public void setJjimdo(String jjimdo) {
		this.jjimdo = jjimdo;
	}

	public String getJjimget() {
		return jjimget;
	}

	public void setJjimget(String jjimget) {
		this.jjimget = jjimget;
	}

	public String getManner() {
		return manner;
	}

	public void setManner(String manner) {
		
		this.manner = manner;
	}
	
}
