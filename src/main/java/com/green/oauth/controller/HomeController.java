package com.green.oauth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {


    @GetMapping("/")
    public String main(Model model, HttpServletRequest request, HttpSession session) {
    	// 403 에러시에 리다이렉트 되고 세션에 담긴 에러메시지 처리
    	String errorMessage = (String) session.getAttribute("errorMessage");
        if(errorMessage != null) {
            model.addAttribute("error", errorMessage);
            session.removeAttribute("errorMessage");
        }
        return "home";
    }
}

