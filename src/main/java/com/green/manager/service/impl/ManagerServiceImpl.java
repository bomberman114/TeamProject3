package com.green.manager.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.green.files.FileImage;
import com.green.manager.mapper.ManagerMapper;
import com.green.manager.service.ManagerService;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerMapper managerMapper;

	@Value("${part4.upload-path}")
	private String uploadPath;

	@Override
	public List<HashMap<String, Object>> getCategoryList() {
		List<HashMap<String, Object>> categoryList = managerMapper.getCategoryList();
		List<HashMap<String, Object>> filteredList = new ArrayList<>();

		for (int i = 0; i < categoryList.size(); i++) {
			HashMap<String, Object> category = categoryList.get(i);
			String categoryName = (String) category.get("CATEGORY_NAME"); // "categoryName"은 실제 키에 맞게 수정하세요.

			if (!"전자제품".equals(categoryName) && !"주요부품".equals(categoryName)) {
				filteredList.add(category);
			}
		}
		// filteredList에는 "전자제품"과 "주요부품"을 제외한 항목들이 포함됩니다.
		return filteredList;
	}

	@Override
	public void saveProduct(HashMap<String, Object> map, MultipartFile[] profileImge) {
		int productIdx = 0;
		System.out.println(map);
		managerMapper.saveProduct(map);
		productIdx = managerMapper.getProductIdx(map);
		FileImage.save(map, profileImge);
		map.put("productIdx", productIdx);
		System.out.println("관리자 48라인" + map);
		managerMapper.saveProductImage(map);
		System.out.println("관리자 50라인" + map);

	}

}
