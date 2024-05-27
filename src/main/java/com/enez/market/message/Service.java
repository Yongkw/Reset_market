package com.enez.market.message;

import java.util.ArrayList;

public interface Service {

	ArrayList<MesssageSendDTO> getchatroomlist(String userid);

	ArrayList<MesssageSendDTO> getchttingdata(int bno, int pno);
 
	void sendchatdata(String text, String image, int pr_no, int board_no, String send_id, String get_id);

	void sendchatdata2(int board_no, int pr_no, String send_id, String get_id, String text, String image);

	ArrayList<MesssageSendDTO> readchttingdata(int i, int j, String attribute);

	void createchatroom(String pno, String userId);

	String getboardno(String pno, String userId);

	int checkgetid(String userId, String pno);

	MesssageSendDTO getopponent(int i);

	void readcheck(int bNo, int cNo, String user);

	void readcheck2(int board_no, String send_id);
	void outsender(int board_no, String send_id);
	void outsender2(int board_no, String send_id);

	String getimage(String opponent);

	void setChattingOut(String userid);

	int newdatacheck(int bNo, int cNo);
 
	
	
}
