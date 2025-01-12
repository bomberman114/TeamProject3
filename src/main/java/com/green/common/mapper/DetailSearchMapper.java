package com.green.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DetailSearchMapper {

	List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx);

	List<HashMap<String, Object>> getProductListByCategoryIdx(String categoryIdx);

	List<HashMap<String, Object>> getProductPagingFilterList(@Param("offset") int offset, 
            @Param("recordSize") int recordSize, @Param("requestBody")  HashMap<String, Object> requestBody);

	int getProductCount(@Param("requestBody") HashMap<String, Object> requestBody);

	int getFilteredProductCount(@Param("requestBody") HashMap<String, Object> requestBody, List<String> userFilter);

	List<HashMap<String, Object>> getFilteredProductList(int offset, int recordSize,
			@Param("requestBody") HashMap<String, Object> requestBody, List<String> userFilter);


	List<HashMap<String, Object>> findCategoryListByParentIdxAndDepth(String findedParentIdx, Integer findedDepth);

	HashMap<String, Object> findParentIdxAndDepthByCategoryIdx(Integer cateIdx);

	List<HashMap<String, Object>> findChildCategoryByCategoryIdx(String categoryIdx);

	
	}
