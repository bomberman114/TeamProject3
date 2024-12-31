package com.green.oauth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class QuickFinderController {

    @GetMapping("/QuickFinder")
    public ModelAndView quickFinder() {   
    	ModelAndView mv = new ModelAndView();
    	
    	
    	mv.setViewName("quickFinder");
        return mv;
    }
}

