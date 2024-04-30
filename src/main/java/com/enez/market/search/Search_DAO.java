package com.enez.market.search;

import java.util.ArrayList;

public class Search_DAO {

	public static PageboardDTO paging(int page, int size,int pagelimit) {
		
		int blocklimit = 3;
	
		
		int maxpage = (int)(Math.ceil((double)size/pagelimit)); 
		int startpage =(((int)(Math.ceil((double)page/blocklimit)))-1)*blocklimit+1; 
		int endpage = startpage+blocklimit-1;
		if(endpage>maxpage) {endpage = maxpage;}
		
		PageboardDTO dto = new PageboardDTO();
		dto.setNow(page);
		dto.setPull(size);
		dto.setStart(startpage);
		dto.setEnd(endpage);

		return dto;
	}

}
