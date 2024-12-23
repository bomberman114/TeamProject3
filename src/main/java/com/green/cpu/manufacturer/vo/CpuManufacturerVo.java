package com.green.cpu.manufacturer.vo;

public class CpuManufacturerVo {

	// CPU 제조사
	private int cpu_manufacturer_idx;
	private String cpu_manufacturer_name; // 제조사 (예: intel, amd)
	private int computer_part_filter_idx;

	public CpuManufacturerVo() {
	}

	public CpuManufacturerVo(int cpu_manufacturer_idx, String cpu_manufacturer_name, int computer_part_filter_idx) {
		super();
		this.cpu_manufacturer_idx = cpu_manufacturer_idx;
		this.cpu_manufacturer_name = cpu_manufacturer_name;
		this.computer_part_filter_idx = computer_part_filter_idx;
	}

	public int getCpu_manufacturer_idx() {
		return cpu_manufacturer_idx;
	}

	public void setCpu_manufacturer_idx(int cpu_manufacturer_idx) {
		this.cpu_manufacturer_idx = cpu_manufacturer_idx;
	}

	public String getCpu_manufacturer_name() {
		return cpu_manufacturer_name;
	}

	public void setCpu_manufacturer_name(String cpu_manufacturer_name) {
		this.cpu_manufacturer_name = cpu_manufacturer_name;
	}

	public int getComputer_part_filter_idx() {
		return computer_part_filter_idx;
	}

	public void setComputer_part_filter_idx(int computer_part_filter_idx) {
		this.computer_part_filter_idx = computer_part_filter_idx;
	}

	@Override
	public String toString() {
		return "CpuManufacturerVo [cpu_manufacturer_idx=" + cpu_manufacturer_idx + ", cpu_manufacturer_name="
				+ cpu_manufacturer_name + ", computer_part_filter_idx=" + computer_part_filter_idx + "]";
	};

}
