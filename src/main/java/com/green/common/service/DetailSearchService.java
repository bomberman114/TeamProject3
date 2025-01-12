package com.green.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface DetailSearchService {

	List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx);

	HashMap<String, Object> getProductPagingFilterList(HashMap<String, Object> requestBody);

	List<HashMap<String, Object>> getParentCategoryList(String categoryIdx);

	boolean findChildCategoryByCategoryIdx(String categoryIdx);

	HashMap<String, Object> findFirstChildCategoryByCategoryIdx(String categoryIdx);



}
