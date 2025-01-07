package com.green.desktop.estimate.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.computer.part.compatibility.CompauterPartCompatibilityCheck;
import com.green.cooler.mapper.CoolerMapper;
import com.green.cpu.mapper.CpuMapper;
import com.green.desktop.estimate.service.DeskTopEstimateService;
import com.green.desktopcase.mapper.DesktopCaseMapper;
import com.green.files.FileImage;
import com.green.gpu.mapper.GpuMapper;
import com.green.hdd.mapper.HddMapper;
import com.green.motherboard.mapper.MotherboardMapper;
import com.green.power.mapper.PowerMapper;
import com.green.product.mapper.ProductMapper;
import com.green.ram.mapper.RamMapper;
import com.green.ssd.mapper.SsdMapper;

@Service("DeskTopEstimateService")
public class DeskTopEstimateServiceImpl implements DeskTopEstimateService {

	@Autowired
	private CpuMapper cpuMapper;

	@Autowired
	private GpuMapper gpuMapper;

	@Autowired
	private RamMapper ramMapper;

	@Autowired
	private SsdMapper ssdMapper;

	@Autowired
	private CoolerMapper coolerMapper;

	@Autowired
	private DesktopCaseMapper desktopCaseMapper;

	@Autowired
	private PowerMapper powerMapper;

	@Autowired
	private HddMapper hddMapper;

	@Autowired
	private MotherboardMapper motherboardMapper;

	@Autowired
	private ProductMapper productMapper;

	@Override
	public HashMap<String, Object> compauterPartCompatibilityCheck(HashMap<String, Object> map) {
		map = CompauterPartCompatibilityCheck.compauterPartCompatibilityCheck(map);

		return map;
	}

	@Override
	public List<HashMap<String, Object>> getProductResultList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> productResultList = productMapper.getProductResultList(map);
		for (int i = 0; i < productResultList.size(); i++) {
			String productSfileName = String.valueOf(productResultList.get(i).get("PRODUCT_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			productSfileName = fileImage.fileNemeReplace(productSfileName);
			productResultList.get(i).put("PRODUCT_SFILE_NAME", productSfileName);
		}
		return productResultList;
	}

}
