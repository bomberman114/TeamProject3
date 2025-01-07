package com.green.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("/")
	public ModelAndView home () {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/home");
		return mv;
	}
	
	@RequestMapping("/Login")
	public String login() {
		return "/login";
	}
	
	@GetMapping("/Register")
	public String getRegister() {
		return "/register";
	}
	
}
