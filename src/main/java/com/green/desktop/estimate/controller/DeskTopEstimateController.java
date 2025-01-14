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
		System.out.println("도착");
		System.out.println(map);
		int category = 6;
		map.put("category", category);
		/*
		List<HashMap<String, Object>> productResultList = productMapper.getProductResultMapList(map);
		for (int i = 6; i <= 29; i++) {
			String productDescription = String.valueOf(productResultList.get(i).get("PRODUCT_DESCRIPTION"));
			String productName = String.valueOf(productResultList.get(i).get("PRODUCT_NAME"));
			productResultList.get(i).put("CATEGORY_ATTRIBUTE_IDX", i);
			// "인텔"이 포함되어 있는지 체크
			
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(6)) {
				if (productName != null && productName.contains("인텔")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 1);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productName != null && productName.matches("AMD")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 2);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}

			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(2)) {
				if (productName != null && productName.contains("애로우레이크")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 3);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productName != null && productName.matches("버미어(2020)")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 4);
					productMapper.setProductCpu(productResultList.get(i));
				}
			}

			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(3)) {
				if (productDescription != null && productDescription.contains("DDR4")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 5);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("DDR5")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 6);
					productMapper.setProductCpu(productResultList.get(i));
				}
			}

			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(4)) {
				if (productName != null && productName.contains("14세대")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 7);
					productMapper.setProductCpu(productResultList.get(i));
				}
				// if (productName != null && productName.contains("라이젠 7000시리즈")) {
				if (productName != null && productName.matches(".*7\\d{3}.*")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 8);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}

			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(5)) {
				if (productName != null && productName.contains("울트라7")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 9);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productName != null && productName.matches("i7")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 10);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productName != null && productName.matches("i9")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 11);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			 
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(6)) {
				if (productDescription != null && productDescription.contains("24코어")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 12);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("16코어")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 13);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("10코어")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 14);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("8코어")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 15);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("6코어")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 16);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(7)) {
				if (productDescription != null && productDescription.contains("32스레드")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 17);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("24스레드")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 18);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("16스레드")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 19);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("12스레드")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 20);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("8스레드")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 21);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(11)) {
				if (productDescription != null && productDescription.contains("3nm")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 37);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("5nm")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 38);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("7nm")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 39);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("10nm")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 40);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("22nm")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 41);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(12)) {
				if (productDescription != null && productDescription.contains("LGA 1200")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 42);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("AM4")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 43);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(13)) {
				if (productDescription != null && productDescription.contains("내장그래픽: 미탑재")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 44);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("내장그래픽: 탑재")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 45);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(14)) {
				if (productDescription != null && productDescription.contains("96MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 46);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("64MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 47);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("40MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 48);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("36MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 49);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("32MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 50);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}
			if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(15)) {
				if (productDescription != null && productDescription.contains("384MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 51);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("300MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 52);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("256MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 53);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("128MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 54);
					productMapper.setProductCpu(productResultList.get(i));
				}
				if (productDescription != null && productDescription.matches("96MB")) {
					productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 55);
					productMapper.setProductCpu(productResultList.get(i));
				}

			}


		}

		 */
		mv.setViewName("deskTopEstimate/deskTopEstimateForm");
		return mv;
	};

	private static String extractLengthInfo(String input) {
		String[] parts = input.split("/");

		for (String part : parts) {
			if (part.contains("정격출력")) {
				return part.trim();
			}
		}

		return null; // 길이 정보를 찾지 못했을 경우
	}

	private static double extractLength(String lengthInfo) {
		String[] parts = lengthInfo.split(":");
		if (parts.length > 1) {
			String lengthStr = parts[1].trim();
			return Double.parseDouble(lengthStr.replace("W", "").trim());
		}
		return 0; // 길이를 찾지 못했을 경우
	}

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
