package com.green.common.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.mapper.QuickFinderMapper;
import com.green.common.service.QuickFinderService;
import com.green.crolling.vo.CrollingImgVo;
import com.green.files.FileImage;

@Controller
public class QuickFinderController {

	@Autowired
	private QuickFinderService quickFinderService;
	
	@GetMapping("/QuickFinder")
	public ModelAndView quickFinder() {
		
		List<HashMap<String, Object>> manufacturerList = quickFinderService.findManufacturerList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("manufacturerList", manufacturerList);
		mv.setViewName("quickFinder/quickFinderList");
		
		return mv;
	}

	// 프로그램 들고 오는 엔드포인트
	@PostMapping("/QuickFinder/getPurposeList")
	public ResponseEntity<HashMap<String, Object>> getPurposeList(@RequestBody HashMap<String, String> requestBody) {
		String purposeIdx = requestBody.get("purposeIdx"); 
		HashMap<String, Object> res = new HashMap<>();
		List<HashMap<String, Object>> purposeList = quickFinderService.findPurposeList(purposeIdx);
		res.put("purposeList", purposeList);
		return ResponseEntity.ok(res);
	}
	
	// 상품 페이징, 필터링하는 엔드포인트
	@PostMapping("/QuickFinder/getProductPagingFilterList")
	public ResponseEntity<HashMap<String, Object>> getProductList(@RequestBody HashMap<String, Object> requestBody) {	
		HashMap<String, Object> res = quickFinderService.getProductPagingList(requestBody);	
		return ResponseEntity.ok(res);
	}
	
	// 상품 페이징, 필터링하는 엔드포인트
	@GetMapping("/QuickFinder/getBrandByManufactureList")
	public ResponseEntity<HashMap<String, Object>> getBrandByManufactureList(@RequestParam (value = "manufactureIdx") String manufactureIdx) {

		List<HashMap<String, Object>> res = quickFinderService.getBrandByManufactureList(manufactureIdx);
		if(res != null) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("brandList", res);
			return ResponseEntity.ok(map);
		}else {
			return null;
		}
	}
	
	/*
	@PostMapping("/QuickFinder/postTestPurposeImg")
	public ResponseEntity<HashMap<String, Object>> postTestPurposeImg(HashMap<String, Object> requestBody, @RequestParam(value="profileImge")  MultipartFile[]   profileImge) {
		requestBody.put("uploadPath", uploadPath);
		FileImage.oneSave(requestBody, profileImge);
		System.out.println((CrollingImgVo)requestBody.get("imgVo"));
		quickFinderMapper.saveTestPurposeImg((CrollingImgVo)requestBody.get("imgVo"));
		return null;
	}
	*/

	
	
}
