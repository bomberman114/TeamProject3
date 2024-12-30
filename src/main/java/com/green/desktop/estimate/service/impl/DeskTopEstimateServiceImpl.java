package com.green.desktop.estimate.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.cooler.mapper.CoolerMapper;
import com.green.cpu.mapper.CpuMapper;
import com.green.desktop.estimate.service.DeskTopEstimateService;
import com.green.desktopcase.mapper.DesktopCaseMapper;
import com.green.files.FileImage;
import com.green.gpu.mapper.GpuMapper;
import com.green.hdd.mapper.HddMapper;
import com.green.motherboard.mapper.MotherboardMapper;
import com.green.power.mapper.PowerMapper;
import com.green.ram.mapper.RamMapper;
import com.green.ssd.mapper.SsdMapper;


@Service("DeskTopEstimateService")
public class DeskTopEstimateServiceImpl implements DeskTopEstimateService{

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
	
	@Override
	public List<HashMap<String, Object>> getCpuResultList() {
		List<HashMap<String, Object>> cpuResultList = cpuMapper.getCpuResultList();
		for (int i = 0; i < cpuResultList.size(); i++) {
		String cpuSfileName =	String.valueOf(cpuResultList.get(i).get("CPU_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			cpuSfileName = fileImage.fileNemeReplace(cpuSfileName);
			cpuResultList.get(i).put("CPU_SFILE_NAME", cpuSfileName);
		}
		
		return cpuResultList;
	}

	@Override
	public List<HashMap<String, Object>> getGpuResultList() {
		List<HashMap<String, Object>> gpuResultList = gpuMapper.getGpuResultList();
		for (int i = 0; i < gpuResultList.size(); i++) {
		String gpuSfileName =	String.valueOf(gpuResultList.get(i).get("GPU_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			gpuSfileName = fileImage.fileNemeReplace(gpuSfileName);
			gpuResultList.get(i).put("GPU_SFILE_NAME", gpuSfileName);
		}
		return gpuResultList;
	}

	@Override
	public List<HashMap<String, Object>> getRamResultList() {
		List<HashMap<String, Object>> ramResultList = ramMapper.getRamResultList();
		for (int i = 0; i < ramResultList.size(); i++) {
		String ramSfileName =	String.valueOf(ramResultList.get(i).get("RAM_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			ramSfileName = fileImage.fileNemeReplace(ramSfileName);
			ramResultList.get(i).put("RAM_SFILE_NAME", ramSfileName);
		}
		return ramResultList;
	}

	@Override
	public List<HashMap<String, Object>> getCoolerResultList() {
		List<HashMap<String, Object>> coolerResultList = coolerMapper.getCoolerResultList();
		for (int i = 0; i < coolerResultList.size(); i++) {
		String coolerSfileName =	String.valueOf(coolerResultList.get(i).get("RAM_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			coolerSfileName = fileImage.fileNemeReplace(coolerSfileName);
			coolerResultList.get(i).put("COOLER_SFILE_NAME", coolerSfileName);
		}
		return coolerResultList;
	}

	@Override
	public List<HashMap<String, Object>> getDesktopCaseResultList() {
		List<HashMap<String, Object>> desktopCaseResultList = desktopCaseMapper.getDesktopCaseResultList();
		for (int i = 0; i < desktopCaseResultList.size(); i++) {
		String desktopCaseSfileName =	String.valueOf(desktopCaseResultList.get(i).get("RAM_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			desktopCaseSfileName = fileImage.fileNemeReplace(desktopCaseSfileName);
			desktopCaseResultList.get(i).put("DESKTOP_CASE_SFILE_NAME", desktopCaseSfileName);
		}
		return desktopCaseResultList;
	}

	@Override
	public List<HashMap<String, Object>> getSsdResultList() {
		List<HashMap<String, Object>> ssdResultList = ssdMapper.getSsdResultList();
		for (int i = 0; i < ssdResultList.size(); i++) {
		String ssdSfileName =	String.valueOf(ssdResultList.get(i).get("SSD_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			ssdSfileName = fileImage.fileNemeReplace(ssdSfileName);
			ssdResultList.get(i).put("SSD_SFILE_NAME", ssdSfileName);
		}
		return ssdResultList;
	}

	@Override
	public List<HashMap<String, Object>> getHddResultList() {
		List<HashMap<String, Object>> hddResultList = hddMapper.getHddResultList();
		for (int i = 0; i < hddResultList.size(); i++) {
		String hddSfileName =	String.valueOf(hddResultList.get(i).get("HDD_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			hddSfileName = fileImage.fileNemeReplace(hddSfileName);
			hddResultList.get(i).put("HDD_SFILE_NAME", hddSfileName);
		}
		return hddResultList;
	}

	@Override
	public List<HashMap<String, Object>> getPowerResultList() {
		List<HashMap<String, Object>> powerResultList = powerMapper.getPowerResultList();
		for (int i = 0; i < powerResultList.size(); i++) {
		String powerSfileName =	String.valueOf(powerResultList.get(i).get("POWER_SFILE_NAME"));
			FileImage fileImage = new FileImage();
			powerSfileName = fileImage.fileNemeReplace(powerSfileName);
			powerResultList.get(i).put("POWER_SFILE_NAME", powerSfileName);
		}
		return null;
	}

	
	
}
