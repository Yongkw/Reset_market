package com.enez.market.product;

import java.util.ArrayList;

public interface Service {

	void productsave(String member_id, String product_image, String title, String category_name, String location,
			int price, String detail);

	ArrayList<ProductDTO> productout(String title);

	void count(String title);

	int jjimcount(int pr_no);
	int jjimcheck(int pr_no, String thisid, String seller_id);
	void jjimupdate_insert(int pr_no, String thisid, String seller_id);
	void jjimupdate_delet(int pr_no, String thisid, String seller_id);


}
