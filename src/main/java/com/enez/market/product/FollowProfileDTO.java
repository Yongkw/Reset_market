package com.enez.market.product;

public class FollowProfileDTO {
/*
팔로워 받은 프로필 디테일 데이터
1 이미지 /user
2 닉네임 /user
3 평점 /user
3 상품 갯수 /product
4 찜 갯수 (찜 한 갯수인지 찜 받은갯수인지 불명) /jjim
5 아이디 - [찜하기] 시 사용 - 설계된 찜하기는 상품을 찜하기인데...? /user
6 예비 찜한 상품 갯수 /jjim
 */
	String image,nickname,manner,productcount,jjimcountget,jjimcountdo,id;

	public FollowProfileDTO() {
		// TODO Auto-generated constructor stub
	}
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getManner() {
		return manner;
	}

	public void setManner(String manner) {
		
		this.manner = manner;
	}

	public String getProductcount() {
		return productcount;
	}

	public void setProductcount(String productcount) {
		this.productcount = productcount;
	}

	public String getJjimcountget() {
		return jjimcountget;
	}

	public void setJjimcountget(String jjimcountget) {
		this.jjimcountget = jjimcountget;
	}

	public String getJjimcountdo() {
		return jjimcountdo;
	}

	public void setJjimcountdo(String jjimcountdo) {
		this.jjimcountdo = jjimcountdo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "FollowProfileDTO [image=" + image + ", nickname=" + nickname + ", manner=" + manner + ", productcount="
				+ productcount + ", jjimcountget=" + jjimcountget + ", jjimcountdo=" + jjimcountdo + ", id=" + id + "]";
	}
	
	
}
