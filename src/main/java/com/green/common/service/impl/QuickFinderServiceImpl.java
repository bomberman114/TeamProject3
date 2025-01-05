package com.green.common.service.impl;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.common.mapper.QuickFinderMapper;
import com.green.common.service.QuickFinderService;
import com.green.paging.vo.Pagination;
import com.green.paging.vo.PagingResponse;
import com.green.paging.vo.SearchVo;

@Service
public class QuickFinderServiceImpl implements QuickFinderService{

	@Autowired
	private QuickFinderMapper quickFinderMapper;
	
	@Override
	public List<HashMap<String, Object>> findPurposeList(String purposeIdx) {
		List<HashMap<String, Object>> purposeList = quickFinderMapper.findPurposeList(purposeIdx);
		return purposeList;
	}

	@Override
	public HashMap<String, Object> getProductPagingList(HashMap<String, Object> requestBody) {
		
		HashMap<String, Object> res = new HashMap<>();
		
		int  productCount  = quickFinderMapper.getProductCount(requestBody);
		
	    PagingResponse<HashMap<String, Object>> response = null;
	    if( productCount < 1 ) { // 현재 조회한 자료가 없다면
	    	response = new PagingResponse<>(
	    		Collections.emptyList(), null);}
	    
	    int nowpage = 1; // 기본값 설정
	    if (requestBody.get("nowpage") != null) {
	        try {
	            nowpage = Integer.parseInt(String.valueOf(requestBody.get("nowpage")));
	        } catch (NumberFormatException e) {
	            // 로그 기록 또는 에러 처리
	            // 기본값 1을 유지
	        }
	    }

	    // 페이징을 위한 초기 설정
	    SearchVo searchVo = new SearchVo();
	    searchVo.setPage(nowpage);      // 현재 페이지 정보
	    searchVo.setRecordSize(5);      // 페이지당 5개
	    searchVo.setPageSize(5);        // paging.jsp에 출력할 페이지번호수
	    
	    // Pagination 설정
	    Pagination pagination = new Pagination(productCount, searchVo);
	    int 	offset		= searchVo.getOffset();
	    int		recordSize	= searchVo.getRecordSize();

    	List<HashMap<String, Object>> list = quickFinderMapper.getProductPagingList(offset,recordSize,requestBody);;
	    response = new PagingResponse<>(list, pagination);
	    
		res.put("response", response);
		res.put("nowpage", nowpage);
		res.put("searchVo", searchVo);
		return res;
	}



}
