package com.green.common.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.service.DetailSearchService;

@Controller
public class DetailSearchController {

	@Autowired
	private DetailSearchService detailSearchService;

	@GetMapping("/DetailSearch")
	public ModelAndView detailSearch(@RequestParam (value = "category")String categoryIdx) {
		ModelAndView mv = new ModelAndView();
		String cateIdx = categoryIdx;
		List<HashMap<String, Object>> categoryAttribueList = detailSearchService.getAttributeListByCategoryIdx(categoryIdx);
		mv.addObject("categoryAttribueList",categoryAttribueList);
		mv.addObject("categoryIdx",cateIdx);
		mv.setViewName("detailSearch/detailSearchList");
		
		return mv;
	}
	
	@PostMapping("/DetailSearch/getProductPagingFilterList")
	public ResponseEntity<HashMap<String, Object>> getProductPagingFilterList(@RequestBody HashMap<String, Object> requestBody){
		System.out.println(requestBody);

		HashMap<String, Object> res = detailSearchService.getProductPagingFilterList(requestBody);	
		return ResponseEntity.ok(res);
	}
}
