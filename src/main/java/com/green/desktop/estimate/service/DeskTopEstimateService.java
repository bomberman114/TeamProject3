package com.green.desktop.estimate.service;

import java.util.HashMap;
import java.util.List;

public interface DeskTopEstimateService {

	HashMap<String, Object> compauterPartCompatibilityCheck(HashMap<String, Object> map);

	List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map);

}
