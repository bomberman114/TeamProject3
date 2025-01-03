package com.green.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.common.mapper.QuickFinderMapper;
import com.green.common.service.QuickFinderService;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;

@Controller
public class QuickFinderController {

	@Autowired
	private QuickFinderService quickFinderService;
	
	@Autowired
	private QuickFinderMapper quickFinderMapper; 

	@GetMapping("/QuickFinder")
	public ModelAndView quickFinder(@RequestParam(value="nowpage", 
		    required = false, defaultValue="1") int nowpage) {
		
		ModelAndView mv = new ModelAndView();
		
		/*
		int  companyCount  = quickFinderMapper.getProductCount();
	    PagingResponse<HashMap<String, Object>> response = null;
	    if( companyCount < 1 ) { // 현재 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);}
	    
	    // 페이징을 위한 초기 설정
	    SearchVo searchVo = new SearchVo();
	    searchVo.setPage(nowpage);      // 현재 페이지 정보
	    searchVo.setRecordSize(5);     // 페이지당 5개
	    searchVo.setPageSize(5);       // paging.jsp에 출력할 페이지번호수
	    
	    // Pagination 설정
	    Pagination pagination = new Pagination(companyCount, searchVo);
	    int 	offset		= searchVo.getOffset();
	    int		recordSize	= searchVo.getRecordSize();

    	List<HashMap<String, Object>> list = quickFinderMapper.getProductPagingList(offset,recordSize);;
	    response = new PagingResponse<>(list, pagination);
	    System.out.println("response : " + response);
		mv.addObject("response",response);
		mv.addObject("nowpage",nowpage);		
		mv.addObject("searchVo",searchVo);		
		*/
		mv.setViewName("quickFinder/quickFinderList");
		
		return mv;
	}

	// 프로그램 들고 오는 엔드포인트
	@PostMapping("/QuickFinder/getPurposeList")
	public ResponseEntity<HashMap<String, Object>> getPurposeList(@RequestBody Map<String, String> requestBody) {
		String purposeIdx = requestBody.get("purposeIdx"); 
		HashMap<String, Object> res = new HashMap<>();
		List<HashMap<String, Object>> purposeList = quickFinderService.findPurposeList(purposeIdx);
		res.put("purposeList", purposeList);
		return ResponseEntity.ok(res);
	}
}
