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
		boolean isChildCategory = detailSearchService.findChildCategoryByCategoryIdx(categoryIdx);
		if(isChildCategory) {
			HashMap<String, Object> firstChild = detailSearchService.findFirstChildCategoryByCategoryIdx(categoryIdx);
			cateIdx =  String.valueOf(firstChild.get("CATEGORY_IDX"));
		}
		List<HashMap<String, Object>> categoryAttribueList = detailSearchService.getAttributeListByCategoryIdx(cateIdx);
		System.out.println(categoryAttribueList);
		List<HashMap<String, Object>> parentCategoryList = detailSearchService.getParentCategoryList(cateIdx);
		mv.addObject("categoryAttribueList",categoryAttribueList);
		mv.addObject("parentCategoryList",parentCategoryList);
		mv.addObject("categoryIdx",cateIdx);
		mv.setViewName("detailSearch/detailSearchList");
		
		return mv;
	}
	
	@PostMapping("/DetailSearch/getProductPagingFilterList")
	public ResponseEntity<HashMap<String, Object>> getProductPagingFilterList(@RequestBody HashMap<String, Object> requestBody){
		HashMap<String, Object> res = detailSearchService.getProductPagingFilterList(requestBody);	
		return ResponseEntity.ok(res);
	}
	
	@GetMapping("/dSearch")
	public ModelAndView dSearch(@RequestParam (value = "keyword" , required=false)String keyword) {
		ModelAndView mv = new ModelAndView();
		detailSearchService.getSearchedProductList(keyword, mv);
		mv.setViewName("detailSearch/detailSearch");
		return mv;
	}
}
