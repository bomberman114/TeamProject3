package com.green.peripheral.vo;

public class PeripheralVo {
	
	

	// 주변기기
	private int peripheral_idx;
	private String peripheral_name;
	private int category_idx;

	public PeripheralVo() {
	}

	public PeripheralVo(int peripheral_idx, String peripheral_name, int category_idx) {
		super();
		this.peripheral_idx = peripheral_idx;
		this.peripheral_name = peripheral_name;
		this.category_idx = category_idx;
	}

	public int getPeripheral_idx() {
		return peripheral_idx;
	}

	public void setPeripheral_idx(int peripheral_idx) {
		this.peripheral_idx = peripheral_idx;
	}

	public String getPeripheral_name() {
		return peripheral_name;
	}

	public void setPeripheral_name(String peripheral_name) {
		this.peripheral_name = peripheral_name;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	@Override
	public String toString() {
		return "PeripheralVo [peripheral_idx=" + peripheral_idx + ", peripheral_name=" + peripheral_name
				+ ", category_idx=" + category_idx + "]";
	};

}
