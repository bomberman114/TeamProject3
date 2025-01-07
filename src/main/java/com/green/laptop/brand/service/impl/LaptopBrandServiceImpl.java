package com.green.laptop.brand.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.laptop.brand.mapper.LaptopBrandMapper;
import com.green.laptop.brand.service.LaptopBrandService;

@Service("LaptopBrandService")

public class LaptopBrandServiceImpl implements LaptopBrandService {
	@Autowired
	private LaptopBrandMapper laptopBrandMapper;
	
	@Override
	public List<HashMap<String, Object>> brandExplainList(HashMap<String, Object> map) {
		 List<HashMap<String, Object>> brandExplainList = laptopBrandMapper.brandExplainList(map);
		return brandExplainList;
	}
	
}