package com.green.cs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.cs.mapper.CsMapper;
import com.green.cs.vo.CsVo;

@Controller
@RequestMapping("/Cs")
public class CsController {
	
	@Autowired
	private CsMapper csMapper;

	//------------------------고객센터 메인화면-----------------------------//
	// Cs/Cslist (메인화면)
	@RequestMapping("/Cslist")
	public ModelAndView cslist() {
		System.out.println("csList=" + " 해");
		List<CsVo> csList = csMapper.getcsList();
		System.out.println("csList=" + csList);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("csList", csList);
		mv.setViewName("cs/cslist");
		return mv;
	}
}
