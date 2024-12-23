package com.green.cpu.vo;

public class CpuVo {

	private int cpu_idx; // private int cpu 고유 id
	private String cpu_name; // private int cpu 이름 (예: intel core i7-11700k)

	private int cpu_manufacturer_idx; // 제조사 id
	private int cpu_series_idx; // private int cpu 시리즈 id
	private int cpu_type_idx; // private int cpu 종류 id
	private int cpu_core_idx; // 코어 id
	private int cpu_thread_idx; // 스레드 id
	private int cpu_base_clock_idx; // 기본 클럭 id
	private int cpu_boost_clock_idx; // 부스트 클럭 id
	private int cpu_tdp_idx; // tdp id
	private int cpu_architecture_idx; // 아키텍처 id
	private int cpu_process_technology_idx; // 공정 기술 id
	private int cpu_socket_type_idx; // 소켓 타입 id
	private int cpu_integrated_graphics_idx; // 내장 그래픽 id
	private int cpu_l2_cache_idx; // l2 캐시 id
	private int cpu_l3_cache_idx; // l3 캐시 id

	private String cpu_release_date; // 출시일
	private int cpu_origin_price; // 출고가격
	private int cpu_now_price; // 현재가격
	private int computer_part_filter_idx; // 외래 키를 위한 컬럼

	public CpuVo() {
	}

	public CpuVo(int cpu_idx, String cpu_name, int cpu_manufacturer_idx, int cpu_series_idx, int cpu_type_idx,
			int cpu_core_idx, int cpu_thread_idx, int cpu_base_clock_idx, int cpu_boost_clock_idx, int cpu_tdp_idx,
			int cpu_architecture_idx, int cpu_process_technology_idx, int cpu_socket_type_idx,
			int cpu_integrated_graphics_idx, int cpu_l2_cache_idx, int cpu_l3_cache_idx, String cpu_release_date,
			int cpu_origin_price, int cpu_now_price, int computer_part_filter_idx) {
		super();
		this.cpu_idx = cpu_idx;
		this.cpu_name = cpu_name;
		this.cpu_manufacturer_idx = cpu_manufacturer_idx;
		this.cpu_series_idx = cpu_series_idx;
		this.cpu_type_idx = cpu_type_idx;
		this.cpu_core_idx = cpu_core_idx;
		this.cpu_thread_idx = cpu_thread_idx;
		this.cpu_base_clock_idx = cpu_base_clock_idx;
		this.cpu_boost_clock_idx = cpu_boost_clock_idx;
		this.cpu_tdp_idx = cpu_tdp_idx;
		this.cpu_architecture_idx = cpu_architecture_idx;
		this.cpu_process_technology_idx = cpu_process_technology_idx;
		this.cpu_socket_type_idx = cpu_socket_type_idx;
		this.cpu_integrated_graphics_idx = cpu_integrated_graphics_idx;
		this.cpu_l2_cache_idx = cpu_l2_cache_idx;
		this.cpu_l3_cache_idx = cpu_l3_cache_idx;
		this.cpu_release_date = cpu_release_date;
		this.cpu_origin_price = cpu_origin_price;
		this.cpu_now_price = cpu_now_price;
		this.computer_part_filter_idx = computer_part_filter_idx;
	}

	public int getCpu_idx() {
		return cpu_idx;
	}

	public void setCpu_idx(int cpu_idx) {
		this.cpu_idx = cpu_idx;
	}

	public String getCpu_name() {
		return cpu_name;
	}

	public void setCpu_name(String cpu_name) {
		this.cpu_name = cpu_name;
	}

	public int getCpu_manufacturer_idx() {
		return cpu_manufacturer_idx;
	}

	public void setCpu_manufacturer_idx(int cpu_manufacturer_idx) {
		this.cpu_manufacturer_idx = cpu_manufacturer_idx;
	}

	public int getCpu_series_idx() {
		return cpu_series_idx;
	}

	public void setCpu_series_idx(int cpu_series_idx) {
		this.cpu_series_idx = cpu_series_idx;
	}

	public int getCpu_type_idx() {
		return cpu_type_idx;
	}

	public void setCpu_type_idx(int cpu_type_idx) {
		this.cpu_type_idx = cpu_type_idx;
	}

	public int getCpu_core_idx() {
		return cpu_core_idx;
	}

	public void setCpu_core_idx(int cpu_core_idx) {
		this.cpu_core_idx = cpu_core_idx;
	}

	public int getCpu_thread_idx() {
		return cpu_thread_idx;
	}

	public void setCpu_thread_idx(int cpu_thread_idx) {
		this.cpu_thread_idx = cpu_thread_idx;
	}

	public int getCpu_base_clock_idx() {
		return cpu_base_clock_idx;
	}

	public void setCpu_base_clock_idx(int cpu_base_clock_idx) {
		this.cpu_base_clock_idx = cpu_base_clock_idx;
	}

	public int getCpu_boost_clock_idx() {
		return cpu_boost_clock_idx;
	}

	public void setCpu_boost_clock_idx(int cpu_boost_clock_idx) {
		this.cpu_boost_clock_idx = cpu_boost_clock_idx;
	}

	public int getCpu_tdp_idx() {
		return cpu_tdp_idx;
	}

	public void setCpu_tdp_idx(int cpu_tdp_idx) {
		this.cpu_tdp_idx = cpu_tdp_idx;
	}

	public int getCpu_architecture_idx() {
		return cpu_architecture_idx;
	}

	public void setCpu_architecture_idx(int cpu_architecture_idx) {
		this.cpu_architecture_idx = cpu_architecture_idx;
	}

	public int getCpu_process_technology_idx() {
		return cpu_process_technology_idx;
	}

	public void setCpu_process_technology_idx(int cpu_process_technology_idx) {
		this.cpu_process_technology_idx = cpu_process_technology_idx;
	}

	public int getCpu_socket_type_idx() {
		return cpu_socket_type_idx;
	}

	public void setCpu_socket_type_idx(int cpu_socket_type_idx) {
		this.cpu_socket_type_idx = cpu_socket_type_idx;
	}

	public int getCpu_integrated_graphics_idx() {
		return cpu_integrated_graphics_idx;
	}

	public void setCpu_integrated_graphics_idx(int cpu_integrated_graphics_idx) {
		this.cpu_integrated_graphics_idx = cpu_integrated_graphics_idx;
	}

	public int getCpu_l2_cache_idx() {
		return cpu_l2_cache_idx;
	}

	public void setCpu_l2_cache_idx(int cpu_l2_cache_idx) {
		this.cpu_l2_cache_idx = cpu_l2_cache_idx;
	}

	public int getCpu_l3_cache_idx() {
		return cpu_l3_cache_idx;
	}

	public void setCpu_l3_cache_idx(int cpu_l3_cache_idx) {
		this.cpu_l3_cache_idx = cpu_l3_cache_idx;
	}

	public String getCpu_release_date() {
		return cpu_release_date;
	}

	public void setCpu_release_date(String cpu_release_date) {
		this.cpu_release_date = cpu_release_date;
	}

	public int getCpu_origin_price() {
		return cpu_origin_price;
	}

	public void setCpu_origin_price(int cpu_origin_price) {
		this.cpu_origin_price = cpu_origin_price;
	}

	public int getCpu_now_price() {
		return cpu_now_price;
	}

	public void setCpu_now_price(int cpu_now_price) {
		this.cpu_now_price = cpu_now_price;
	}

	public int getComputer_part_filter_idx() {
		return computer_part_filter_idx;
	}

	public void setComputer_part_filter_idx(int computer_part_filter_idx) {
		this.computer_part_filter_idx = computer_part_filter_idx;
	}

	@Override
	public String toString() {
		return "CpuVo [cpu_idx=" + cpu_idx + ", cpu_name=" + cpu_name + ", cpu_manufacturer_idx=" + cpu_manufacturer_idx
				+ ", cpu_series_idx=" + cpu_series_idx + ", cpu_type_idx=" + cpu_type_idx + ", cpu_core_idx="
				+ cpu_core_idx + ", cpu_thread_idx=" + cpu_thread_idx + ", cpu_base_clock_idx=" + cpu_base_clock_idx
				+ ", cpu_boost_clock_idx=" + cpu_boost_clock_idx + ", cpu_tdp_idx=" + cpu_tdp_idx
				+ ", cpu_architecture_idx=" + cpu_architecture_idx + ", cpu_process_technology_idx="
				+ cpu_process_technology_idx + ", cpu_socket_type_idx=" + cpu_socket_type_idx
				+ ", cpu_integrated_graphics_idx=" + cpu_integrated_graphics_idx + ", cpu_l2_cache_idx="
				+ cpu_l2_cache_idx + ", cpu_l3_cache_idx=" + cpu_l3_cache_idx + ", cpu_release_date=" + cpu_release_date
				+ ", cpu_origin_price=" + cpu_origin_price + ", cpu_now_price=" + cpu_now_price
				+ ", computer_part_filter_idx=" + computer_part_filter_idx + "]";
	};

}
