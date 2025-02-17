package com.green.common.service;

import java.util.HashMap;
import java.util.List;

public interface QuickFinderService {

	List<HashMap<String, Object>> findPurposeList(String purposeIdx);

	HashMap<String, Object> getProductPagingList(HashMap<String, Object> requestBody);

	List<HashMap<String, Object>> findManufacturerList();

	List<HashMap<String, Object>> getBrandByManufactureList(String manufactureIdx);

	
}
