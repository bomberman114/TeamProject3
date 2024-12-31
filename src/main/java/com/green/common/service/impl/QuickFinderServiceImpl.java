package com.green.common.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.common.mapper.QuickFinderMapper;
import com.green.common.service.QuickFinderService;

@Service
public class QuickFinderServiceImpl implements QuickFinderService{

	@Autowired
	private QuickFinderMapper quickFinderMapper;
	
	@Override
	public List<HashMap<String, Object>> findPurposeList(String purposeIdx) {
		List<HashMap<String, Object>> purposeList = quickFinderMapper.findPurposeList(purposeIdx);
		return purposeList;
	}

}
