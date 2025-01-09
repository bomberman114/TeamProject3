package com.green.common.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
		
		List<HashMap<String, Object>> categoryAttribueList = detailSearchService.getAttributeListByCategoryIdx(categoryIdx);
		
		mv.addObject("categoryAttribueList",categoryAttribueList);
		mv.setViewName("detailSearch/detailSearchList");
		
		return mv;
	}
}
