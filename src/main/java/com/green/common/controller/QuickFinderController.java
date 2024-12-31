package com.green.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.green.common.service.QuickFinderService;

@Controller
public class QuickFinderController {

	@Autowired
	private QuickFinderService quickFinderService;

	@GetMapping("/QuickFinder")
	public String quickFinder() {
		return "quickFinder/quickFinderList";
	}

	@PostMapping("/QuickFinder/getPurposeList")
	public ResponseEntity<HashMap<String, Object>> getPurposeList(@RequestBody Map<String, String> requestBody) {
		String purposeIdx = requestBody.get("purposeIdx"); 
		HashMap<String, Object> res = new HashMap<>();
		List<HashMap<String, Object>> purposeList = quickFinderService.findPurposeList(purposeIdx);
		res.put("purposeList", purposeList);
		return ResponseEntity.ok(res);
	}
}
