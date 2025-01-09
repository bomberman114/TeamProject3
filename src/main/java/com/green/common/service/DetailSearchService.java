package com.green.common.service;

import java.util.HashMap;
import java.util.List;

public interface DetailSearchService {

	List<HashMap<String, Object>> getAttributeListByCategoryIdx(String categoryIdx);

}
