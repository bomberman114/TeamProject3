package com.green.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface DetailSearchService {

	List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx);

	HashMap<String, Object> getProductPagingFilterList(HashMap<String, Object> requestBody);



}
