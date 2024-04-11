package com.enez.market.product;

import java.util.ArrayList;

public interface Service {

	void productsave(String member_id, String product_image, String title, String category_name, String location,
			int price, String detail);

	ArrayList<ProductDTO> productout(String title);

	void count(String title);

}
