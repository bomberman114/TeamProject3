package com.green.desktop.estimate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.desktop.estimate.service.DeskTopEstimateService;

@Controller
@RequestMapping("/DeskTopEstimate")
public class DeskTopEstimateController {
// PC 견적
	
	@Autowired
	private DeskTopEstimateService deskTopEstimateService;
	
	@RequestMapping("/DeskTopEstimateForm")
	public ModelAndView deskTopEstimateForm() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/deskTopEstimate/deskTopEstimateForm");
		return mv;
		
	};
	
	
}
