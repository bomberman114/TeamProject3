package com.green.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuickFinderMapper {

	List<HashMap<String, Object>> findPurposeList(String purposeIdx);

	int getProductCount(HashMap<String, Object> requestBody);
	
	List<HashMap<String, Object>> getProductPagingList(int offset, int recordSize, HashMap<String, Object> requestBody);



}
