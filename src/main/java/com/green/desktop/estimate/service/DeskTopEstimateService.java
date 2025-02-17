package com.green.desktop.estimate.service;

import java.util.HashMap;
import java.util.List;

public interface DeskTopEstimateService {

   

   List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map);

   List<HashMap<String, Object>> getdeskTopEstimateProductFilterList(HashMap<String, Object> map);

   HashMap<String, Object> compauterPartCompatibilityCheck(HashMap<String, Object> map);

   List<HashMap<String, Object>> getDeskTopPartProductList(HashMap<String, Object> map);

	List<HashMap<String, Object>> getCommunityDeskTop(HashMap<String, Object> map);


}
 