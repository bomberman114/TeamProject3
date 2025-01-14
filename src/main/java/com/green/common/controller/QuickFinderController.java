package com.green.common.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.common.service.QuickFinderService;

@Controller
public class QuickFinderController {

	@Autowired
	private QuickFinderService quickFinderService;
	
	@GetMapping("/QuickFinder")
	public String quickFinder() {
		return "quickFinder/quickFinderList";
	}

	// 프로그램 들고 오는 엔드포인트
	@PostMapping("/QuickFinder/getPurposeList")
	public ResponseEntity<HashMap<String, Object>> getPurposeList(@RequestBody HashMap<String, String> requestBody) {
		String purposeIdx = requestBody.get("purposeIdx"); 
		HashMap<String, Object> res = new HashMap<>();
		List<HashMap<String, Object>> purposeList = quickFinderService.findPurposeList(purposeIdx);
		res.put("purposeList", purposeList);
		return ResponseEntity.ok(res);
	}
	
	// 상품 페이징, 필터링하는 엔드포인트
	@PostMapping("/QuickFinder/getProductPagingFilterList")
	public ResponseEntity<HashMap<String, Object>> getProductList(@RequestBody HashMap<String, Object> requestBody) {	
		HashMap<String, Object> res = quickFinderService.getProductPagingList(requestBody);	
		return ResponseEntity.ok(res);
	}
	
	
}
