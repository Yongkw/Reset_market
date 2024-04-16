package com.enez.market.pricechart;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class MapResetDate {

    public MapResetDate() {}

    @SuppressWarnings("unchecked")
	public static void create_jsonf(List<Map<String, String>> maplist) {

        String filePath = "C:\\Users\\Administrator\\Desktop\\project_resetmarket\\src\\main\\webapp\\resources\\mapaddress.json";

        // JSON 파일 생성 및 초기화
        initializeJsonFile(filePath);

        // JSON 파일 읽기
        JSONObject jsonObject = readJsonFile(filePath);
        
        if (jsonObject != null) {
            // positions 배열 가져오기
            JSONArray positions = (JSONArray) jsonObject.get("positions");

            // positions 배열이 없는 경우 빈 배열 생성
            if (positions == null) {
                positions = new JSONArray();
                jsonObject.put("positions", positions);
            }

            // 새로운 위치 정보 추가
            for(Map<String, String> map:maplist) {
                JSONObject newPosition = new JSONObject();
                newPosition.put("pr_no", map.get("pr_no"));
                newPosition.put("lat", map.get("lat"));
                newPosition.put("lng", map.get("lng"));
                newPosition.put("code", map.get("code"));
                positions.add(newPosition);
            }

            // JSON 파일 쓰기
            writeJsonFile(filePath, jsonObject);
        } else {
            System.out.println("JSON 파일을 읽는데 실패하였습니다.");
        }
    }

    // JSON 파일 생성 및 초기화
    private static void initializeJsonFile(String filePath) {
        JSONObject jsonObject = new JSONObject();
        JSONArray positions = new JSONArray();
        jsonObject.put("positions", positions);
        writeJsonFile(filePath, jsonObject);
    }

    // JSON 파일 읽기
    private static JSONObject readJsonFile(String filePath) {
        JSONParser parser = new JSONParser();
        try (FileReader reader = new FileReader(filePath)) {
            Object obj = parser.parse(reader);
            return (JSONObject) obj;
        } catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return null;
    }

    // JSON 파일 쓰기
    private static void writeJsonFile(String filePath, JSONObject jsonObject) {
        try (FileWriter file = new FileWriter(filePath)) {
            file.write(jsonObject.toJSONString());
            file.flush();
            System.out.println("JSON 파일이 성공적으로 수정되었습니다.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}