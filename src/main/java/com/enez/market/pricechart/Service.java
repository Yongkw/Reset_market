package com.enez.market.pricechart;

import java.util.ArrayList;
import java.util.Map;

public interface Service {

	ArrayList<Product_search_DTO> findchart_count(String find_name);

	ArrayList<Product_search_DTO> findchart_date(String find_name);

	ArrayList<Product_chart_DTO> findchart_dateAvgSet(String find_name);

	ArrayList<addMap_DTO> getAddress();

	void resetMapData(int product_no, String map_lat, String map_lng);
	void mapDelete();

	
}
