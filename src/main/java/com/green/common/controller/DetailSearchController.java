package com.green.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailSearchController {


	@GetMapping("/DetailSearch")
	public String quickFinder() {
		return "detailSearch/detailSearchList";
	}
}
