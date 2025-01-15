package com.green.crawling.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.green.crawling.service.CrawlingService;


@Controller
public class CrawlingController {
	
	@Autowired
	private CrawlingService crollingService;
	
	@CrossOrigin
	@PostMapping("/products")
	public ResponseEntity<Void> products(@RequestBody HashMap<String, Object> map) {
	
		crollingService.DownloadAndSaveImg(map);
		
		return new ResponseEntity<>(null, HttpStatus.OK);
		
	}
	
}