package com.green.cpu.image.vo;

public class CpuImage {

	private int cpu_image_idx; // 파일고유번호
	private int cpu_idx; // 게시글 번호
	private String cpu_image_name; // 파일이름
	private String cpu_image_ext; // 파일확장자
	private String cpu_sfile_name; // 저장된 실제 파일명

	public CpuImage() {
	}

	public CpuImage(int cpu_image_idx, int cpu_idx, String cpu_image_name, String cpu_image_ext,
			String cpu_sfile_name) {
		super();
		this.cpu_image_idx = cpu_image_idx;
		this.cpu_idx = cpu_idx;
		this.cpu_image_name = cpu_image_name;
		this.cpu_image_ext = cpu_image_ext;
		this.cpu_sfile_name = cpu_sfile_name;
	}

	public int getCpu_image_idx() {
		return cpu_image_idx;
	}

	public void setCpu_image_idx(int cpu_image_idx) {
		this.cpu_image_idx = cpu_image_idx;
	}

	public int getCpu_idx() {
		return cpu_idx;
	}

	public void setCpu_idx(int cpu_idx) {
		this.cpu_idx = cpu_idx;
	}

	public String getCpu_image_name() {
		return cpu_image_name;
	}

	public void setCpu_image_name(String cpu_image_name) {
		this.cpu_image_name = cpu_image_name;
	}

	public String getCpu_image_ext() {
		return cpu_image_ext;
	}

	public void setCpu_image_ext(String cpu_image_ext) {
		this.cpu_image_ext = cpu_image_ext;
	}

	public String getCpu_sfile_name() {
		return cpu_sfile_name;
	}

	public void setCpu_sfile_name(String cpu_sfile_name) {
		this.cpu_sfile_name = cpu_sfile_name;
	}

	@Override
	public String toString() {
		return "CpuImage [cpu_image_idx=" + cpu_image_idx + ", cpu_idx=" + cpu_idx + ", cpu_image_name="
				+ cpu_image_name + ", cpu_image_ext=" + cpu_image_ext + ", cpu_sfile_name=" + cpu_sfile_name + "]";
	};

}
