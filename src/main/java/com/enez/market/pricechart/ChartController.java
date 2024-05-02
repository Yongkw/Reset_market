package com.enez.market.pricechart;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChartController {
	//String imagecut = "\\\\Mac\\Home\\Desktop\\project\\src\\main\\webapp\\image";

	
	String imagecut = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\image";
	String resourcescut = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\resources\\";
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "pricechart_view")
	public String pricechart1() {
		return "pricechart_view";
	}
	
	@RequestMapping(value = "mapview")
	public String mapview() {
		return "mapview";
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "getdata")
	public void getmapdata(HttpServletResponse response) throws IOException {
		Service service= sqlSession.getMapper(Service.class);
		ArrayList<addMap_DTO> list = service.getAddress();
		JSONArray listdata = new JSONArray();
		for(addMap_DTO m :list) {
			JSONObject mapDT = new JSONObject();
			mapDT.put("pr_no",m.product_no);
			mapDT.put("location",m.location);
			listdata.add(mapDT);
		}

		
		String jsondata=listdata.toJSONString();
		PrintWriter pw =response.getWriter();
		pw.print(jsondata);	       
	}
	
	@RequestMapping(value = "map_reset")
	public String mapview0(Model model) {
		model.addAttribute("returnno", 3);
		return "map_reset";
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "findproduct_prno", method = RequestMethod.POST)
	public void findproduct_prno(Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		String pr_no = request.getParameter("pr_no");
		JSONArray list = new JSONArray();
		       if(pr_no !=null) {
		            Product_search_DTO dto = service.mapProductList(pr_no);
		            if (dto != null) {
		            		JSONObject pro_json = new JSONObject();
		            		pro_json.put("product_no", Integer.toString(dto.product_no));
		            		pro_json.put("view_cnt", Integer.toString(dto.view_cnt));
		            		pro_json.put("price", Integer.toString(dto.price));
		            		pro_json.put("category_name", dto.category_name);
		            		pro_json.put("title", dto.title);
		            		pro_json.put("img1", dto.img1);
		            		pro_json.put("location", dto.location);
		            		
			            	list.add(pro_json);
		                }
		       	} else {
					response.setStatus(HttpServletResponse.SC_NOT_FOUND); 
					response.getWriter().write("주소가 정보가 전달 되지 않음");	
		      	}

				String jsondata=list.toJSONString();
				PrintWriter pw =response.getWriter();
				pw.print(jsondata);	       
		}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "map_productlist", method = RequestMethod.POST)
	public void map_productlist(Model model,HttpServletResponse response,HttpServletRequest request) throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		String[] pr_nolist = request.getParameterValues("prnolist");
		JSONArray list = new JSONArray();
		       if(pr_nolist !=null && pr_nolist.length > 0) {
		            for(String i :pr_nolist) {
		            	Product_search_DTO dto = service.mapProductList(i);
		            	if (dto != null) {
		            		JSONObject pro_json = new JSONObject();
		            		pro_json.put("product_no", Integer.toString(dto.product_no));
		            		pro_json.put("view_cnt", Integer.toString(dto.view_cnt));
		            		pro_json.put("price", Integer.toString(dto.price));
		            		pro_json.put("category_name", dto.category_name);
		            		pro_json.put("title", dto.title);
		            		pro_json.put("img1", dto.img1);
		            		pro_json.put("location", dto.location);
		            		
			            	list.add(pro_json);
		                }
		       	    }
		       	} else {
					response.setStatus(HttpServletResponse.SC_NOT_FOUND); 
					response.getWriter().write("주소가 정보가 전달 되지 않음");	
		      	}

				String jsondata=list.toJSONString();
				PrintWriter pw =response.getWriter();
				pw.print(jsondata);
		       
		}
	
	
	@ResponseBody
	@RequestMapping(value = "map_resetjson2", method = RequestMethod.POST)
	public void map_resetjson2(HttpServletResponse response,@RequestBody List<Map<String, String>> maplist) throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		/* 들어온 데이터 형태 : [{no:1,lat:2,lng:3,code:4}]
		*/
		if(maplist.size()>0) {
			service.mapDelete();
			for (Map<String, String> map : maplist) {
				System.out.println(map);
				service.resetMapData(Integer.parseInt(map.get("pr_no")),map.get("lat"),map.get("lng"),map.get("code"));
			}
			MapResetDate.create_jsonf(maplist);
		}else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 성공 상태 코드를 설정합니다.
			response.getWriter().write("주소가 정보가 전달 되지 않음");	
		}
		response.setStatus(HttpServletResponse.SC_OK); // 성공 상태 코드를 설정합니다.
		response.getWriter().write("Success"); // 클라이언트에게 메시지를 보냅니다.
		}

	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/map_resetjson")
	public void map_resetjson(HttpServletResponse response,Model model,HttpServletRequest request) throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		ArrayList<addMap_DTO> addlist =  service.getAddress(); // 나중에 판매완료를 제외하는 조건만 달면 됨
		System.out.println("addlist : "+addlist.size());
		Map<String, String> addMap= new TreeMap<String, String>();
		
		for (addMap_DTO set : addlist) {
				addMap.put(set.product_no,set.location);
		}
		JSONObject mapobj = new JSONObject();

		Iterator<String> keys = addMap.keySet().iterator();
		
		while (keys.hasNext()) {
			String str = (String) keys.next();
			mapobj.put(str, addMap.get(str));
		}
		
		
		String tt=mapobj.toJSONString();
		PrintWriter pw =response.getWriter();
		pw.print(tt);
		
	}
	
	
	

	
	@RequestMapping(value = "searchresult" ,method = RequestMethod.POST)
	public String pricechart2(Model model,HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		Service service = sqlSession.getMapper(Service.class);
		String find_name = request.getParameter("chartsearch");
		String gopage="searchresult";
		
		
		ArrayList<Product_search_DTO> countproduct = service.findchart_count(find_name);
		ArrayList<Product_search_DTO> dateproduct = service.findchart_date(find_name);
		
		model.addAttribute("count_list",countproduct);
		model.addAttribute("date_list",dateproduct);
		model.addAttribute("findname",find_name);
		return gopage;
	}
	@ResponseBody
	@RequestMapping(value = "/chartDataSet") //차트 데이터 ajax 반환
	public void ajaxtest(HttpServletResponse response,Model model,HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		Service service = sqlSession.getMapper(Service.class);
		String findname = request.getParameter("findname");
		
		ArrayList<Product_chart_DTO> dateAvgSet = service.findchart_dateAvgSet(findname);
		
		if(findname.equals("")) {
		}
		JSONObject priceobj = new JSONObject();
		priceobj = priceAvg(dateAvgSet);
		
		
		String tt=priceobj.toJSONString();
		PrintWriter pw = response.getWriter();
		pw.print(tt);
	}
	

	


	private JSONObject priceAvg(ArrayList<Product_chart_DTO> dateAvgSet) { //차트 데이터를 json 오브젝트로 변환후 반환
		Map<String, Integer> priceSet=new TreeMap<String, Integer>();
		Map<String, Integer> pricelist= new TreeMap<String, Integer>();
		for (Product_chart_DTO set : dateAvgSet) {
				String month = set.update_at.substring(2, 7);

			 if (priceSet.containsKey(month)) {
		            priceSet.put(month,priceSet.get(month) + set.price);
		            pricelist.put(month, pricelist.get(month)+1);
		            
		        } else {
		        	pricelist.put(month, 1);
		        	priceSet.put(month, set.price);
		        }
			
		}
		Iterator<String> keys = priceSet.keySet().iterator();
		while (keys.hasNext()) {
			String str = keys.next();
			int con = pricelist.get(str);
			if (con!=0) {
				 pricelist.put(str,priceSet.get(str)/con);
			}
		}


		JSONObject chardate = jsonchart(pricelist);
		
		
		return chardate;
	}
	
	@SuppressWarnings("unchecked") //맵데이터를 json 오브젝트로 변환후 반환
	public JSONObject jsonchart(Map<String, Integer> pricelist) {
		
		JSONObject obj = new JSONObject();

		Iterator<String> keys = pricelist.keySet().iterator();
		
		while (keys.hasNext()) {
			String str = (String) keys.next();

			obj.put(str, pricelist.get(str));

		}
		return  obj;
	}
	
	
}
