package com.green.desktop.estimate.service;

import java.util.HashMap;
import java.util.List;

public interface DeskTopEstimateService {

	List<HashMap<String, Object>> getCpuResultList();

	List<HashMap<String, Object>> getGpuResultList();

	List<HashMap<String, Object>> getRamResultList();

	List<HashMap<String, Object>> getCoolerResultList();

	List<HashMap<String, Object>> getDesktopCaseResultList();

	List<HashMap<String, Object>> getSsdResultList();

	List<HashMap<String, Object>> getHddResultList();

	List<HashMap<String, Object>> getPowerResultList();

}
