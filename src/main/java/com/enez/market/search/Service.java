package com.enez.market.search;

import java.util.ArrayList;

public interface Service {

	int pr_search(String title,String kategori);

	ArrayList<Product_search_DTO> pr_search2(String title,int start,int end,String kategori);
	ArrayList<Product_search_DTO> pr_search3(int start,int end);

	void insert_event(String event_title, String event_in, String event_start_date, String event_end_date, String fname1,
			String fname2);

	

	ArrayList<Product_search_DTO> pr_search3_1(int i, int number);

	ArrayList<Product_search_DTO> pr_search3_2(int i, int number);

	ArrayList<Product_search_DTO> pr_search3_3(int i, int number);
	
	
}
