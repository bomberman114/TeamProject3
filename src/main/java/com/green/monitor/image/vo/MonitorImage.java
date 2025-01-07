package com.green.monitor.image.vo;

public class MonitorImage {

	private int monitor_image_idx; // 파일고유번호
	private int monitor_idx; // 게시글 번호
	private String monitor_image_name; // 파일이름
	private String monitor_image_ext; // 파일확장자
	private String monitor_sfile_name; // 저장된 실제 파일명

	public MonitorImage() {
	}

	public MonitorImage(int monitor_image_idx, int monitor_idx, String monitor_image_name, String monitor_image_ext,
			String monitor_sfile_name) {
		super();
		this.monitor_image_idx = monitor_image_idx;
		this.monitor_idx = monitor_idx;
		this.monitor_image_name = monitor_image_name;
		this.monitor_image_ext = monitor_image_ext;
		this.monitor_sfile_name = monitor_sfile_name;
	}

	public int getmonitor_image_idx() {
		return monitor_image_idx;
	}

	public void setmonitor_image_idx(int monitor_image_idx) {
		this.monitor_image_idx = monitor_image_idx;
	}

	public int getmonitor_idx() {
		return monitor_idx;
	}

	public void setmonitor_idx(int monitor_idx) {
		this.monitor_idx = monitor_idx;
	}

	public String getmonitor_image_name() {
		return monitor_image_name;
	}

	public void setmonitor_image_name(String monitor_image_name) {
		this.monitor_image_name = monitor_image_name;
	}

	public String getmonitor_image_ext() {
		return monitor_image_ext;
	}

	public void setmonitor_image_ext(String monitor_image_ext) {
		this.monitor_image_ext = monitor_image_ext;
	}

	public String getmonitor_sfile_name() {
		return monitor_sfile_name;
	}

	public void setmonitor_sfile_name(String monitor_sfile_name) {
		this.monitor_sfile_name = monitor_sfile_name;
	}

	@Override
	public String toString() {
		return "monitorImage [monitor_image_idx=" + monitor_image_idx + ", monitor_idx=" + monitor_idx
				+ ", monitor_image_name=" + monitor_image_name + ", monitor_image_ext=" + monitor_image_ext
				+ ", monitor_sfile_name=" + monitor_sfile_name + "]";
	};

}
