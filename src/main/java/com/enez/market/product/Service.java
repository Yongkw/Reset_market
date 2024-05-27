package com.enez.market.product;

import java.util.ArrayList;
import java.util.List;

import com.enez.market.member.MemberDTO;

public interface Service {

	void productsave(String member_id, String product_image, String title, String category_name, String location,
			int price, String detail);

	ArrayList<ProductDTO> productout(String title);

	void count(String title);

	int jjimcount(int pr_no);
	int jjimcheck(int pr_no, String thisid, String seller_id);
	void jjimupdate_insert(int pr_no, String thisid, String seller_id);
	void jjimupdate_delet(int pr_no, String thisid, String seller_id);



	//마이페이지 기능추가 04-26
	int idcheck(String user);

	List<String> likejjim(String user);
	List<String> getjjim(String user);

	UserProfileDTO getCreateDate(String user);
	ArrayList<JjimPoriductDTO> getlikejjimProduct(List<String> list);
	ArrayList<FollowProfileDTO> getFollowProfile(List<String> list);

	ArrayList<ProductDTO> productoutByPr_number(String product_no);
	void countByPr_no(String product_no);

	void deljjim(String pr_no, String user);

    void mainimagesave(int product_no,String main_image,String member_id);

	ArrayList<Product_managerDTO> promanager(String member_id);

	ArrayList<Product_managerDTO> promanagerimage(String member_id);


	void statevlaue(String vlaue, int vlaue2);

    void prodelect(String delect);

    ArrayList<ProductDTO> update(String title);

    void mainimageup(String main_image, String member_id, int product_no);

    void update2(int product_no, String member_id, String product_image, String title, String category_name,
            String location, int price, String detail);

    ArrayList<Product_memberDTO> promember(String sellerId);

    ArrayList<ProductDTO> prosangjum(String sellerId);

    int saveproduct(String member_id);

    void proimage(String delect);
    
    List<Product_managerDTO> getProductsByState(String state);
	
	
	
}
