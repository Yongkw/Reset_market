package com.enez.market.board;

public class PageDTO {
//  현재 페이지, 시작 페이지, 끝 페이지, 레코드 총갯수, 페이지당 레코드의 수, 전체페이지, 쿼리, start, end
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage=3;  //한 화면에 표시할 페이지수갯수
	public PageDTO() {}
	public PageDTO(int total, int nowPage, int cntPerPage) {
	setNowPage(nowPage);
	setCntPerPage(cntPerPage);
	setTotal(total);
	
	calcLastPage(getTotal(), getCntPerPage());  // 전체 필요한 페이지 수(총 레코드 수(출력에서 글 17개를 넣었다.), 5(한 페이지당 보이는 글의 수))
	calcStartEndPage(getNowPage(), cntPage);
	calcStartEnd(getNowPage(), getCntPerPage());                  
	}   
	
	//전체 페이지수 구하기
	public void calcLastPage(int total, int cntPerPage) {  // 전체 필요한 페이지 수(총 레코드 수(17), 5)
	setLastPage((int) Math.ceil((double)total / (double)cntPerPage));  // 4 = 17 / 5 => 총 4페이지가 만들어짐
	              }   
	//화면에 시작페이지와 마지막페이지 구하기
	public void calcStartEndPage(int nowPage, int cntPage) {  // 1(현재 페이지) , 3(한 화면에 표시하고자 하는 페이지 숫자의 수(1 2 3 ▶))
	setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage); //ceil(반올림)(1/3) * 3 = 3(EndPage)
	if (getLastPage() < getEndPage()) { // 4 < 3
	setEndPage(getLastPage());  // 4(if 조건이 성립되지 않아서 그냥 EndPage 그대로 가져와서 4(오른쪽 LastPage는 조건이 맞지 않아서 신경 안써도 됨))
	}
	setStartPage(getEndPage() - cntPage + 1); // 4 - 3 + 1 = 0
	if(getStartPage()<1) { // 0 < 1
	   setStartPage(1); 
	   }
	}               
	//DB쿼리에 정의할  start,end = 화면에 보이는 페이지와 레코드 
	public void calcStartEnd(int nowPage, int cntPerPage) { // 1, 5 //만약 2, 5면
	setEnd(nowPage * cntPerPage); // 1 * 5 = 5(end) // 2 * 5 = 10
	setStart(getEnd() - cntPerPage + 1); // 5 - 5 + 1 = 1(start) // 10 - 5 + 1 = 6
	}
	            
	public int getNowPage() {
	   return nowPage;   
	   }
	public void setNowPage(int nowPage) {
	   this.nowPage = nowPage;   
	   }
	public int getStartPage() {   
	   return startPage;
	   }
	public void setStartPage(int startPage) {
	   this.startPage = startPage;
	   }
	public int getEndPage() {
	   return endPage;
	   }
	public void setEndPage(int endPage) {
	   this.endPage = endPage;
	   }
	public int getTotal() {
	   return total;
	   }
	public void setTotal(int total) {
	   this.total = total;
	   }
	public int getCntPerPage() {
	   return cntPerPage;
	   }
	public void setCntPerPage(int cntPerPage) {
	   this.cntPerPage = cntPerPage;
	   }
	public int getLastPage() {
	   return lastPage;
	   }
	public void setLastPage(int lastPage) {
	   this.lastPage = lastPage;
	   }
	public int getStart() {
	   return start;
	   }
	public void setStart(int start) {
	   this.start = start;
	   }
	public int getEnd() {
	   return end;
	   }
	public void setEnd(int end) {
	   this.end = end;
	   }
	public int getCntPage() {
	   return cntPage;
	   }
	public void setCntPage(int cntPage) {
	   this.cntPage = cntPage;
	   }

	
}

