package com.enez.market.product;

public class JjimPoriductDTO {

	 /* 
	팔로워 한 프로필 디테일 데이터
	1 프로필 이미지 /RESET_USER테이블
	2 닉네임 /RESET_USER
	3 평점 /RESET_USER
	4 상품 번호 /PRODUCT  key
	5 상품 이미지/PRODUCT // 상의 할 부분 상품이미지 여러개 뽑아야함 코드 복잡해짐
	6 아이디 - [찜하기] 시 사용 - 이미 찜한 상품인데...? 찜하기취소로 변경
	 추가 해야 할것
	 ++ 상품 갯수
	 ++ 찜한 사람수
	 */
	String profileimage,pr_image,nickname,manner,productno,id;
	
	public JjimPoriductDTO() {
		// TODO Auto-generated constructor stub
	}

	

	public String getProfileimage() {
		return profileimage;
	}



	public void setProfileimage(String profileimage) {
		this.profileimage = profileimage;
	}



	public String getPr_image() {
		return pr_image;
	}



	public void setPr_image(String pr_image) {
		this.pr_image = pr_image;
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

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}



	@Override
	public String toString() {
		return "JjimPoriductDTO [profileimage=" + profileimage + ", pr_image=" + pr_image + ", nickname=" + nickname
				+ ", manner=" + manner + ", productno=" + productno + ", id=" + id + "]";
	}
	
}
