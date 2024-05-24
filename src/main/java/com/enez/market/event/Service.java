package com.enez.market.event;

import java.util.ArrayList;

import com.enez.market.member.MemberDTO;

public interface Service {

	public ArrayList<EventDTO> eventout();

	public ArrayList<EventDTO> eventupdate(int event_no);

	public void event_update(String event_title, String event_content, String fname, String event_state,
			String event_sday, String event_fday, int event_no);

	public ArrayList<EventDTO> event_detail(int event_no);

	public void count(int event_no);

	public void ev_dela(int event_no);

	public void insert(String event_title, String event_content, String fname, String event_state, String event_sday,
			String event_fday, String fname2);

	public MemberDTO select(String member_id);

}
