package com.green.desktop.estimate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.cooler.mapper.CoolerMapper;
import com.green.cpu.mapper.CpuMapper;
import com.green.desktop.estimate.service.DeskTopEstimateService;
import com.green.desktopcase.mapper.DesktopCaseMapper;
import com.green.gpu.mapper.GpuMapper;
import com.green.hdd.mapper.HddMapper;
import com.green.motherboard.mapper.MotherboardMapper;
import com.green.power.mapper.PowerMapper;
import com.green.product.mapper.ProductMapper;
import com.green.ram.mapper.RamMapper;
import com.green.ssd.mapper.SsdMapper;

@Controller
@RequestMapping("/DeskTopEstimate")
public class DeskTopEstimateController {
// PC 견적

	@Autowired
	private DeskTopEstimateService deskTopEstimateService;

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

	@RequestMapping("/DeskTopEstimateForm")
	public ModelAndView deskTopEstimateForm() {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("도착");
		map.put("category", 8);
		List<HashMap<String, Object>> deskTopEstimateProductFilterList = productMapper
				.getdeskTopEstimateProductFilterList(map);
		List<HashMap<String, Object>> productResultList = deskTopEstimateService.getProductResultList(map);
		List<HashMap<String, Object>> categoryAttributeList = productMapper.getcategoryAttributeList(map);
		System.out.println("productResultList:" + productResultList);
		for (int i = 0; i < productResultList.size(); i++) {
			String productName = (String) productResultList.get(i).get("PRODUCT_NAME");
			String productDescription = (String) productResultList.get(i).get("PRODUCT_DESCRIPTION");

			for (int j = 0; j < categoryAttributeList.size(); j++) {
				int categoryAttributeIdx = Integer
						.parseInt(String.valueOf(categoryAttributeList.get(j).get("CATEGORY_ATTRIBUTE_IDX")));
				int categoryAttributeValueIdx = Integer
						.parseInt(String.valueOf(categoryAttributeList.get(j).get("CATEGORY_ATTRIBUTE_VALUE_IDX")));
				String categoryAttributeValueName = String
						.valueOf(categoryAttributeList.get(j).get("CATEGORY_ATTRIBUTE_VALUE_NAME"));

			}
			for (int z = 43; z <= 59; z++) {
				productResultList.get(i).put("CATEGORY_ATTRIBUTE_IDX", z);

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(43)) {
					if (productName != null && productName.contains("이엠텍")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 161);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("MSI")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 162);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("GIGABYTE")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 163);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("NVDIA")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 164);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("AMD")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 165);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(44)) {
					if (productName != null && productName.contains("RTX4060")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 166);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("RTX4060 Ti")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 167);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("RX 7600")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 168);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productName != null && productName.matches("RX 6600")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 169);
						productMapper.setProductCpu(productResultList.get(i));
					}
					
				}

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(32)) {
					if (productDescription != null && productDescription.contains("DDR5")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 119);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("DDR4")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 120);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("DDR3")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 121);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("DDR2")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 122);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(33)) {
					if (productDescription != null && productDescription.contains("1600MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 123);
						productMapper.setProductCpu(productResultList.get(i));
					}
					// if (productName != null && productName.contains("라이젠 7000시리즈")) {
					if (productDescription != null && productDescription.matches("3200MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 124);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("5600MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 125);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("6000MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 126);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(34)) {
					if (productDescription != null && productDescription.contains("CL14")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 127);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("CL15")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 128);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("CL16")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 129);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("CL17")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 130);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("CL18")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 131);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}

				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(35)) {
					if (productDescription != null && productDescription.contains("1.10V")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 132);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("1.20V")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 133);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("1.25V")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 134);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("1.35V")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 135);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("1.40V")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 136);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(36)) {
					if (productDescription != null && productDescription.contains("UDIMM")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 137);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("SO-DIMM")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 138);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("RDIMM")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 139);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("FB-DIMM")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 140);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(37)) {
					if (productDescription != null && productDescription.contains("RGB")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 141);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("화이트")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 142);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(39)) {
					if (productDescription != null && productDescription.contains("블랙")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 145);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("화이트")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 146);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("실버/그레이")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 147);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("골드")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 148);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("레드")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 149);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(40)) {
					if (productDescription != null && productDescription.contains("데스크탑용")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 150);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("노트북용")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 151);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("서버용")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 152);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(41)) {
					if (productDescription != null && productDescription.contains("1600MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 153);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("3200MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 154);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("5600MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 155);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("6000MHz")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 156);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}
				if (productResultList.get(i).get("CATEGORY_ATTRIBUTE_IDX").equals(42)) {
					if (productDescription != null && productDescription.contains("LED 라이트")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 157);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("XMP")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 158);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("ECC")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 159);
						productMapper.setProductCpu(productResultList.get(i));
					}
					if (productDescription != null && productDescription.matches("REG")) {
						productResultList.get(i).put("CATEGORY_ATTRIBUTE_VALUE_IDX", 160);
						productMapper.setProductCpu(productResultList.get(i));
					}

				}

			}
		}

		System.out.println("deskTopEstimateProductFilterList:" + deskTopEstimateProductFilterList);
		System.out.println("productResultList:" + productResultList);
		System.out.println("categoryAttributeList:" + categoryAttributeList);
		mv.addObject("deskTopEstimateProductFilterList", deskTopEstimateProductFilterList);
		mv.addObject("productResultList", productResultList);
		mv.setViewName("/deskTopEstimate/deskTopEstimateForm");
		return mv;

	};

	@RequestMapping("deskTopEstimateFiler")
	@ResponseBody
	public List<String> deskTopEstimateFiler(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		String name = String.valueOf(map.get("name"));
		List<String> list = new ArrayList<>();
		List<HashMap<String, Object>> deskTopEstimateProductFilterList = productMapper
				.getdeskTopEstimateProductFilterList(map);
		List<HashMap<String, Object>> productResultList = deskTopEstimateService.getProductResultList(map);
		list.add(String.valueOf(deskTopEstimateProductFilterList));
		list.add(String.valueOf(productResultList));

		return list;
	};

	@RequestMapping("/CompauterPartCompatibilityCheck")
	@ResponseBody
	public String compauterPartCompatibilityCheck(@RequestParam HashMap<String, Object> map) {
		map = deskTopEstimateService.compauterPartCompatibilityCheck(map);

		return null;

	};

}
