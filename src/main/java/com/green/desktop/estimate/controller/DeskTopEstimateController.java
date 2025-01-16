package com.green.desktop.estimate.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.green.cooler.mapper.CoolerMapper;
import com.green.cpu.mapper.CpuMapper;
import com.green.desktop.estimate.service.DeskTopEstimateService;
import com.green.desktopcase.mapper.DesktopCaseMapper;
import com.green.gpu.mapper.GpuMapper;
import com.green.hdd.mapper.HddMapper;
import com.green.motherboard.mapper.MotherboardMapper;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;
import com.green.power.mapper.PowerMapper;
import com.green.product.mapper.ProductMapper;
import com.green.ram.mapper.RamMapper;
import com.green.ssd.mapper.SsdMapper;

@Controller
@RequestMapping("/DeskTopEstimate")
public class DeskTopEstimateController {
// PC 견적

	@Autowired
	private DeskTopEstimateService deskTopEstimateService;

	@Autowired
	private CpuMapper cpuMapper;

	@Autowired
	private GpuMapper gpuMapper;

	@Autowired
	private RamMapper ramMapper;

	@Autowired
	private SsdMapper ssdMapper;

	@Autowired
	private CoolerMapper coolerMapper;

	@Autowired
	private DesktopCaseMapper desktopCaseMapper;

	@Autowired
	private PowerMapper powerMapper;

	@Autowired
	private HddMapper hddMapper;

	@Autowired
	private MotherboardMapper motherboardMapper;

	@Autowired
	private ProductMapper productMapper;

	@GetMapping("/DeskTopEstimateForm")
	public ModelAndView deskTopEstimateForm(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		//System.out.println("도착");
		//System.out.println(map);
		
		//int category = 13;
		//map.put("category", category);
		//List<HashMap<String, Object>> productResultList = productMapper.getProductResultMapList(map);
		//List<HashMap<String, Object>> productCategoryResultList = productMapper.productCategoryResultList(map);
		List<HashMap<String, Object>> productList = new ArrayList<>();
		if(map.get("community_idx")!= null){
			productList = deskTopEstimateService.getCommunityDeskTop(map);
		}
		String json = null;
        // JSON 변환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
			 json = objectMapper.writeValueAsString(productList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("컨트롤러 결과 96번줄:" + json);
		mv.addObject("productList",json);
		// System.out.println("작동함");
		mv.setViewName("deskTopEstimate/deskTopEstimateForm");
		return mv;
	};
	

	@RequestMapping("/DeskTopEstimateFiler")
	@ResponseBody
	public HashMap<String, Object> deskTopEstimateFiler(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		if (map.get("categoryAttributeIdxs") != null && map.get("categoryAttributeValueIdxs") != null) {
			List<Integer> categoryAttributeIdxs = new ArrayList<>();
			List<Integer> categoryAttributeValueIdxs = new ArrayList<>();
			String categoryAttributeIdx = String.valueOf(map.get("categoryAttributeIdxs"));
			String[] idxsArray = categoryAttributeIdx.split(","); // ','로 분리
			// List에 Integer 값 추가
			for (String idx : idxsArray) {
				categoryAttributeIdxs.add(Integer.parseInt(idx.trim())); // 공백 제거 후 Integer로 변환하여 추가
			}

			// categoryAttributeValueIdxs 값 추출
			String categoryAttributeValue = String.valueOf(map.get("categoryAttributeValueIdxs"));
			String[] valuesArray = categoryAttributeValue.split(","); // ','로 분리

			// List에 Integer 값 추가
			for (String value : valuesArray) {
				categoryAttributeValueIdxs.add(Integer.parseInt(value.trim())); // 공백 제거 후 Integer로 변환하여 추가
			}
			map.put("categoryAttributeIdxs", categoryAttributeIdxs);
			map.put("categoryAttributeValueIdxs", categoryAttributeValueIdxs);

		}
		ObjectMapper objectMapper = new ObjectMapper();

		// allValuesString은 JSON 문자열입니다.
		String allValuesString = (String) map.get("allValuesString");

		// JSON 문자열을 Map으로 변환
		Map<String, Object> allValues = null;
		if (allValuesString != null) {

			try {
				allValues = objectMapper.readValue(allValuesString, Map.class);
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 이제 allValues를 사용할 수 있습니다.
		if (allValues != null) {
			// categoryAttributeValueIdxs = (String[])
			// allValues.get("CATEGORY_ATTRIBUTE_VALUE_IDXS");
			// categoryAttributeIdxs = (String[]) allValues.get("CATEGORY_ATTRIBUTE_IDXS");
			List<Integer> categoryAttributeIdxsList = new ArrayList<>();
			List<Integer> categoryAttributeValueIdxsList = new ArrayList<>();
			categoryAttributeIdxsList = (List<Integer>) allValues.get("CATEGORY_ATTRIBUTE_IDXS");
			categoryAttributeValueIdxsList = (List<Integer>) allValues.get("CATEGORY_ATTRIBUTE_VALUE_IDXS");
			if (categoryAttributeIdxsList.size() != 0) {
				map.put("categoryAttributeIdxs", categoryAttributeIdxsList);
			}
			if (categoryAttributeValueIdxsList.size() != 0) {
				map.put("categoryAttributeValueIdxs", categoryAttributeValueIdxsList);
			}
		}
		System.out.println("확인용 : " + map);
		int category = 5;
		if (map.get("category") == null) {
			map.put("category", category);
		}
		if (map.get("category") != null || map.get("category").equals(0)) {
			category = Integer.parseInt(String.valueOf(map.get("category")));
		}
		int nowpage = 1;
		int pageSize = 10;
		if (map.get("nowpage") == null) {
			map.put("nowpage", nowpage);
		}
		if (map.get("nowpage") != null) {
			nowpage = Integer.parseInt(String.valueOf(map.get("nowpage")));
		}
		if (map.get("pageSize") == null) {
			map.put("pageSize", pageSize);
			pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		}
		if (map.get("pageSize") != null) {
			pageSize = Integer.parseInt(String.valueOf(map.get("pageSize")));
		}
		int count = 0;
		count = productMapper.getProductResultListCount(map);
		PagingResponse<HashMap<String, Object>> response = null;
		if (count < 1) { // 현재 Menu_id 조회한 자료가 없다면
			response = new PagingResponse<>(Collections.emptyList(), null);
			// Collections.emptyList() : 자료는 없는 빈 리스트를 채운다
		}

		SearchVo searchVo = new SearchVo();
		searchVo.setPage(nowpage); // 현재 페이지 정보
		searchVo.setRecordSize(pageSize); // 페이지당 10개
		searchVo.setPageSize(10); // paging.jsp 에 출력할 페이지번호수

		Pagination pagination = new Pagination(count, searchVo);
		searchVo.setPagination(pagination);

		int startRow = searchVo.getOffset();
		int endRow = searchVo.getRecordSize();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		List<HashMap<String, Object>> deskTopEstimateProductFilterList = deskTopEstimateService
				.getdeskTopEstimateProductFilterList(map);
		List<HashMap<String, Object>> productResultList = deskTopEstimateService.getProductResultList(map);
		HashMap<String, Object> categoryMap = productMapper.getCategoryMap(map);
		response = new PagingResponse<HashMap<String, Object>>(productResultList, pagination);
		// 객체 추가
		map.put("categoryMap", categoryMap);
		map.put("count", count);
		map.put("deskTopEstimateProductFilterList", deskTopEstimateProductFilterList);
		map.put("productResultList", productResultList);
		map.put("searchVo", searchVo);
		map.put("pagination", pagination);
		map.put("nowpage", nowpage);
		map.put("pageSize", pageSize);
		System.out.println("결과: " + map);
		return map;
	};

	@RequestMapping("/CompauterPartCompatibilityCheck")
	@ResponseBody
	public HashMap<String, Object> compauterPartCompatibilityCheck(@RequestParam HashMap<String, Object> map) {
		System.out.println("호환성 도착");
		System.out.println("map: " + map);
		String productIdxListStr = (String) map.get("productIdxList");
		// 문자열을 Integer 리스트로 변환
		// 문자열을 Integer 리스트로 변환 (빈 문자열 필터링)
		List<Integer> productIdxList = Arrays.stream(productIdxListStr.split(",")).filter(s -> !s.isEmpty()) // 빈 문자열
																												// 필터링
				.map(Integer::parseInt) // 문자열을 Integer로 변환
				.collect(Collectors.toList()); // 리스트로 수집
		map.put("productIdxList", productIdxList);

		map = deskTopEstimateService.compauterPartCompatibilityCheck(map);
		return map;
	};

	@RequestMapping("/DeskTopCapture")
	@ResponseBody
	public HashMap<String, Object> DeskTopCapture(@RequestParam HashMap<String, Object> map) {
		String productIdxListStr = (String) map.get("productIdxList");
		// 문자열을 Integer 리스트로 변환
		// 문자열을 Integer 리스트로 변환 (빈 문자열 필터링)
		List<Integer> productIdxList = Arrays.stream(productIdxListStr.split(",")).filter(s -> !s.isEmpty()) // 빈 문자열
																												// 필터링
				.map(Integer::parseInt) // 문자열을 Integer로 변환
				.collect(Collectors.toList()); // 리스트로 수집
		map.put("productIdxList", productIdxList);
		List<HashMap<String, Object>> deskTopPartProductList = deskTopEstimateService.getDeskTopPartProductList(map);
		map.put("deskTopPartProductList", deskTopPartProductList);
		System.out.println(map);
		return map;
	}

}
