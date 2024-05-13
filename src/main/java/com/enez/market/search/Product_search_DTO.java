package com.enez.market.search;

public class Product_search_DTO {
int product_no,view_cnt,price,image_no;
String seller_id,category_name,buyer_id,title,detail,product_image,product_state,create_at,update_at,main_image;
String location;
String img1;

public String getImg1() {
	return img1;
}

public void setImg1(String img1) {
	
	if(img1.contains(",")) {
		this.img1=img1.substring(0, img1.indexOf(","));
	}else { 
		this.img1 = img1;
	} 
}

public Product_search_DTO() {
}
public int getProduct_no() {
	return product_no;
}
public void setProduct_no(int product_no) {
	this.product_no = product_no;
}

public int getView_cnt() {
	return view_cnt;
}
public void setView_cnt(int view_cnt) {
	this.view_cnt = view_cnt;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getSeller_id() {
	return seller_id;
}
public void setSeller_id(String seller_id) {
	this.seller_id = seller_id;
}
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
public String getBuyer_id() {
	return buyer_id;
}
public void setBuyer_id(String buyer_id) {
	this.buyer_id = buyer_id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getProduct_image() {
	return product_image;
}
public void setProduct_image(String product_image) {
	this.product_image = product_image;
	setImg1(product_image);
}
public String getProduct_state() {
	return product_state;
}
public void setProduct_state(String product_state) {
	this.product_state = product_state;
}
public String getUpdate_at() {
	return update_at;
}
public void setUpdate_at(String update_at) {
	this.update_at = update_at;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getDetail() {
	return detail;
}
public void setDetail(String detail) {
	this.detail = detail;
}
public String getCreate_at() {
	return create_at;
}
public void setCreate_at(String create_at) {
	this.create_at = create_at;
}

public int getImage_no() {
	return image_no;
}
public void setImage_no(int image_no) {
	this.image_no = image_no;
}
public String getMain_image() {
	if(main_image==null) {
		return img1;
	}else {
		return main_image;
	}
}
public void setMain_image(String main_image) {
	this.main_image = main_image;
}
@Override
public String toString() {
	return "Product_search_DTO [product_no=" + product_no + ", view_cnt=" + view_cnt + ", price=" + price
			+ ", seller_id=" + seller_id + ", category_name=" + category_name + ", buyer_id=" + buyer_id + ", title="
			+ title + ", detail=" + detail + ", product_image=" + product_image + ", product_state=" + product_state
			+ ", create_at=" + create_at + ", update_at=" + update_at + ", location=" + location + "]";
}



}
