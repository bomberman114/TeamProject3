package com.green.desktop.estimate.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	@RequestMapping("/DeskTopEstimateForm")
	public ModelAndView deskTopEstimateForm() {
		ModelAndView mv = new ModelAndView();
//		List<HashMap<String, Object>> deskTopEstimateCpuFilterList = cpuMapper.getdeskTopEstimateCpuFilterList();
//		List<HashMap<String, Object>> cpuResultList = deskTopEstimateService.getCpuResultList(); 
		mv.setViewName("deskTopEstimate/deskTopEstimateForm");
		return mv;
		
	};
	
	@RequestMapping("/deskTopEstimateFiler")
	@ResponseBody
	public List<String> deskTopEstimateFiler (@RequestParam HashMap<String, Object> map){
		System.out.println(map);
		String name = String.valueOf(map.get("name"));
		List<String> list = new ArrayList<>();
		if(name.equals("GPU")) {
			List<HashMap<String, Object>> deskTopEstimateGpuFilterList = gpuMapper.getdeskTopEstimateGpuFilterList();
			List<HashMap<String, Object>> gpuResultList = deskTopEstimateService.getGpuResultList(); 
			list.add(String.valueOf(deskTopEstimateGpuFilterList));
			list.add(String.valueOf(gpuResultList));
		};
		if(name.equals("RAM")) {
			List<HashMap<String, Object>> deskTopEstimateRamFilterList = ramMapper.getdeskTopEstimateRamFilterList();
			List<HashMap<String, Object>> ramResultList = deskTopEstimateService.getRamResultList(); 
			list.add(String.valueOf(deskTopEstimateRamFilterList));
			list.add(String.valueOf(ramResultList));
		};
		if(name.equals("COOLER")) {
			List<HashMap<String, Object>> deskTopEstimateCoolerFilterList = coolerMapper.getdeskTopEstimateCoolerFilterList();
			List<HashMap<String, Object>> coolerResultList = deskTopEstimateService.getCoolerResultList(); 
			list.add(String.valueOf(deskTopEstimateCoolerFilterList));
			list.add(String.valueOf(coolerResultList));
		};
		if(name.equals("DESKTOP_CASE")) {
			List<HashMap<String, Object>> deskTopEstimateDesktopCaseFilterList = desktopCaseMapper.getdeskTopEstimateDesktopCaseFilterList();
			List<HashMap<String, Object>> desktopCaseResultList = deskTopEstimateService.getDesktopCaseResultList(); 
			list.add(String.valueOf(deskTopEstimateDesktopCaseFilterList));
			list.add(String.valueOf(desktopCaseResultList));
		};
		if(name.equals("SSD")) {
			List<HashMap<String, Object>> deskTopEstimateSsdFilterList = ssdMapper.getdeskTopEstimateSsdFilterList();
			List<HashMap<String, Object>> ssdResultList = deskTopEstimateService.getSsdResultList(); 
			list.add(String.valueOf(deskTopEstimateSsdFilterList));
			list.add(String.valueOf(ssdResultList));
		};
		if(name.equals("HDD")) {
			List<HashMap<String, Object>> deskTopEstimateHddFilterList = hddMapper.getdeskTopEstimateHddFilterList();
			List<HashMap<String, Object>> hddResultList = deskTopEstimateService.getHddResultList(); 
			list.add(String.valueOf(deskTopEstimateHddFilterList));
			list.add(String.valueOf(hddResultList));
		};
		if(name.equals("POWER")) {
			List<HashMap<String, Object>> deskTopEstimatePowerFilterList = powerMapper.getdeskTopEstimatePowerFilterList();
			List<HashMap<String, Object>> powerResultList = deskTopEstimateService.getPowerResultList(); 
			list.add(String.valueOf(deskTopEstimatePowerFilterList));
			list.add(String.valueOf(powerResultList));
		};
		if(name.equals("MOTHERBOARD")) {
			List<HashMap<String, Object>> deskTopEstimateDesktopCaseFilterList = desktopCaseMapper.getdeskTopEstimateDesktopCaseFilterList();
			List<HashMap<String, Object>> desktopCaseResultList = deskTopEstimateService.getDesktopCaseResultList(); 
			list.add(String.valueOf(deskTopEstimateDesktopCaseFilterList));
			list.add(String.valueOf(desktopCaseResultList));
		};
		
		return list;
	};
	
}
