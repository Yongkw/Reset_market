package com.enez.market.product;

public class Product_memberDTO {
	String member_id, member_name, nickname, profile_image;
	int manner;
	
	
	public Product_memberDTO() {}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public int getManner() {
		return manner;
	}
	public void setManner(int manner) {
		this.manner = manner;
	}


}
