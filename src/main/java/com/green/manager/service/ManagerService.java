package com.green.manager.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface ManagerService {

	List<HashMap<String, Object>> getCategoryList();

	void saveProduct(HashMap<String, Object> map, MultipartFile[] profileImge);

}
