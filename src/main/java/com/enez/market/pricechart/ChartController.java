package com.enez.market.pricechart;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
	// String imagecut =
	// "\\\\Mac\\Home\\Desktop\\project\\src\\main\\webapp\\image";

	String imagecut = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\image";
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
		Service service = sqlSession.getMapper(Service.class);
		ArrayList<addMap_DTO> list = service.getAddress();
		JSONArray listdata = new JSONArray();
		for (addMap_DTO m : list) {
			JSONObject mapDT = new JSONObject();
			mapDT.put("pr_no", m.product_no);
			mapDT.put("location", m.location);
			listdata.add(mapDT);
		}

		String jsondata = listdata.toJSONString();
		PrintWriter pw = response.getWriter();
		pw.print(jsondata);
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "findproduct_prno", method = RequestMethod.POST)
	public void findproduct_prno(Model model, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		String pr_no = request.getParameter("pr_no");
		JSONArray list = new JSONArray();
		if (pr_no != null) {
			Product_search_DTO dto = service.mapProductList(pr_no);
			if (dto != null) {
				JSONObject pro_json = new JSONObject();
				pro_json.put("product_no", Integer.toString(dto.product_no));
				pro_json.put("view_cnt", Integer.toString(dto.view_cnt));
				pro_json.put("price", Integer.toString(dto.price));
				pro_json.put("category_name", dto.category_name);
				pro_json.put("title", dto.title);
				pro_json.put("img1", dto.getImg1());
				pro_json.put("location", dto.location);

				list.add(pro_json);
			}
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			response.getWriter().write("주소가 정보가 전달 되지 않음");
		}

		String jsondata = list.toJSONString();
		PrintWriter pw = response.getWriter();
		pw.print(jsondata);
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "map_productlist", method = RequestMethod.POST) // 지도 상품리스트
	public void map_productlist(Model model, HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		Service service = sqlSession.getMapper(Service.class);
		String[] pr_nolist = request.getParameterValues("prnolist");
		JSONArray list = new JSONArray();
		if (pr_nolist != null && pr_nolist.length > 0) {
			for (String i : pr_nolist) {
				Product_search_DTO dto = service.mapProductList(i);
				if (dto != null) {
					JSONObject pro_json = new JSONObject();
					pro_json.put("product_no", Integer.toString(dto.product_no));
					pro_json.put("view_cnt", Integer.toString(dto.view_cnt));
					pro_json.put("price", Integer.toString(dto.price));
					pro_json.put("category_name", dto.category_name);
					pro_json.put("title", dto.title);
					pro_json.put("img1", dto.getImg1());
					pro_json.put("location", dto.location);

					list.add(pro_json);
				}
			}
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			response.getWriter().write("주소가 정보가 전달 되지 않음");
		}

		String jsondata = list.toJSONString();
		PrintWriter pw = response.getWriter();
		pw.print(jsondata);

	}

	@RequestMapping(value = "searchresult")
	public String pricechart2(Model model, HttpServletRequest request) throws UnsupportedEncodingException {
		Service service = sqlSession.getMapper(Service.class);
		String find_name = request.getParameter("chartsearch");
		if (find_name == null)
			find_name = "";
		String gopage = "searchresult";

		ArrayList<Product_search_DTO> countproduct = service.findchart_count(find_name);
		ArrayList<Product_search_DTO> dateproduct = service.findchart_date(find_name);

		model.addAttribute("count_list", countproduct);
		model.addAttribute("date_list", dateproduct);
		model.addAttribute("findname", find_name);
		return gopage;
	}

	@ResponseBody
	@RequestMapping(value = "/chartDataSet") // 차트 데이터 json 반환
	public void ajaxtest(HttpServletResponse response, Model model, HttpServletRequest request) throws IOException {
		request.setCharacterEncoding("utf-8");
		Service service = sqlSession.getMapper(Service.class);
		String findname = request.getParameter("findname");

		ArrayList<Product_chart_DTO> dateAvgSet = service.findchart_dateAvgSet(findname);

		JSONArray priceobj = new JSONArray();
		priceobj = priceAvg(dateAvgSet);

		String tt = priceobj.toJSONString();
		PrintWriter pw = response.getWriter();
		pw.print(tt);
	}

	private JSONArray priceAvg(ArrayList<Product_chart_DTO> dateAvgSet) { // 차트 데이터를 json 오브젝트로 변환후 반환
		Map<String, Integer> priceSet = new TreeMap<String, Integer>();
		Map<String, Integer> pricelist = new TreeMap<String, Integer>();
		for (Product_chart_DTO set : dateAvgSet) {
			String month = set.update_at;

			if (priceSet.containsKey(month)) {
				priceSet.put(month, priceSet.get(month) + set.price);
				pricelist.put(month, pricelist.get(month) + 1);

			} else {
				pricelist.put(month, 1);
				priceSet.put(month, set.price);
			}

		}
		Iterator<String> keys = priceSet.keySet().iterator();
		while (keys.hasNext()) {
			String str = keys.next();
			int con = pricelist.get(str);
			if (con != 0) {
				pricelist.put(str, priceSet.get(str) / con);
			}
		}

		JSONArray listjson = new JSONArray();

		List<String> sortedKeys = new ArrayList<>(pricelist.keySet());
		Collections.sort(sortedKeys);

		for (String key : sortedKeys) {
			JSONObject chardate = new JSONObject();
			chardate.put(key, pricelist.get(key));
			listjson.add(chardate);
		}
		return listjson;
	}

}
