package com.green.desktop.estimate.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

	@GetMapping("/DeskTopEstimateForm")
	public ModelAndView deskTopEstimateForm() {
		ModelAndView mv = new ModelAndView();
		HashMap<String, Object> map = new HashMap<>();
		System.out.println("도착");
		map.put("category", 5);
		List<HashMap<String, Object>> deskTopEstimateProductFilterList = deskTopEstimateService
				.getdeskTopEstimateProductFilterList(map);
		List<HashMap<String, Object>> productResultList = deskTopEstimateService.getProductResultList(map);
		List<HashMap<String, Object>> categoryAttributeList = productMapper.getcategoryAttributeList(map);
		System.out.println("productResultList:" + productResultList);

		
		System.out.println("deskTopEstimateProductFilterList:" + deskTopEstimateProductFilterList);
		System.out.println("productResultList:" + productResultList);
		System.out.println("categoryAttributeList:" + categoryAttributeList);
		
		
		mv.addObject("deskTopEstimateProductFilterList", deskTopEstimateProductFilterList);
		mv.addObject("productResultList", productResultList);

		mv.setViewName("deskTopEstimate/deskTopEstimateForm");
		return mv;

	};

	private static String extractLengthInfo(String input) {
		String[] parts = input.split("/");

		for (String part : parts) {
			if (part.contains("정격출력")) {
				return part.trim();
			}
		}

		return null; // 길이 정보를 찾지 못했을 경우
	}

	private static double extractLength(String lengthInfo) {
		String[] parts = lengthInfo.split(":");
		if (parts.length > 1) {
			String lengthStr = parts[1].trim();
			return Double.parseDouble(lengthStr.replace("W", "").trim());
		}
		return 0; // 길이를 찾지 못했을 경우
	}

	@RequestMapping("deskTopEstimateFiler")
	@ResponseBody
	public List<String> deskTopEstimateFiler(@RequestParam HashMap<String, Object> map) {
		System.out.println(map);
		String name = String.valueOf(map.get("name"));
		List<String> list = new ArrayList<>();
			List<HashMap<String, Object>> deskTopEstimateGpuFilterList = gpuMapper.getdeskTopEstimateGpuFilterList();
			//List<HashMap<String, Object>> gpuResultList = deskTopEstimateService.getGpuResultList();
			list.add(String.valueOf(deskTopEstimateGpuFilterList));
			//list.add(String.valueOf(gpuResultList));
		

		return list;
	};

}
