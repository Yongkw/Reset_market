package com.enez.market.search;

import java.util.ArrayList;

public class Search_DAO {

	public static PageboardDTO paging(int page, int size,int pagelimit) {
		//전테 글갯수 조회
		//전체 페이지 갯수 계산 
		//시작 펭이지 값 계산
		//씉 페이지 값계산
		
		// page - 현 페이지
		// size - 게시물 사이즈
		// pagelimit - 게시물 출력 개수
		//

		
		int blocklimit = 3;//하단에 보여줄 숫자
	
		
		int maxpage = (int)(Math.ceil((double)size/pagelimit)); //전체 페이지수 
		int startpage =(((int)(Math.ceil((double)page/blocklimit)))-1)*blocklimit+1; //시작페이지
		int endpage = startpage+blocklimit-1;//끝 페이지
		if(endpage>maxpage) {endpage = maxpage;}
		
		PageboardDTO dto = new PageboardDTO();
		dto.setNow(page);
		dto.setPull(size);
		dto.setStart(startpage);
		dto.setEnd(endpage);

		return dto;
	}

}
