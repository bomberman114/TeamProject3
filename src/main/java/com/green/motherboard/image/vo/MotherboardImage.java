package com.green.motherboard.image.vo;

public class MotherboardImage {

	private int motherboard_image_idx; // 파일고유번호
	private int motherboard_idx; // 게시글 번호
	private String motherboard_image_name; // 파일이름
	private String motherboard_image_ext; // 파일확장자
	private String motherboard_sfile_name; // 저장된 실제 파일명

	public MotherboardImage() {
	}

	public MotherboardImage(int motherboard_image_idx, int motherboard_idx, String motherboard_image_name,
			String motherboard_image_ext, String motherboard_sfile_name) {
		super();
		this.motherboard_image_idx = motherboard_image_idx;
		this.motherboard_idx = motherboard_idx;
		this.motherboard_image_name = motherboard_image_name;
		this.motherboard_image_ext = motherboard_image_ext;
		this.motherboard_sfile_name = motherboard_sfile_name;
	}

	public int getmotherboard_image_idx() {
		return motherboard_image_idx;
	}

	public void setmotherboard_image_idx(int motherboard_image_idx) {
		this.motherboard_image_idx = motherboard_image_idx;
	}

	public int getmotherboard_idx() {
		return motherboard_idx;
	}

	public void setmotherboard_idx(int motherboard_idx) {
		this.motherboard_idx = motherboard_idx;
	}

	public String getmotherboard_image_name() {
		return motherboard_image_name;
	}

	public void setmotherboard_image_name(String motherboard_image_name) {
		this.motherboard_image_name = motherboard_image_name;
	}

	public String getmotherboard_image_ext() {
		return motherboard_image_ext;
	}

	public void setmotherboard_image_ext(String motherboard_image_ext) {
		this.motherboard_image_ext = motherboard_image_ext;
	}

	public String getmotherboard_sfile_name() {
		return motherboard_sfile_name;
	}

	public void setmotherboard_sfile_name(String motherboard_sfile_name) {
		this.motherboard_sfile_name = motherboard_sfile_name;
	}

	@Override
	public String toString() {
		return "motherboardImage [motherboard_image_idx=" + motherboard_image_idx + ", motherboard_idx="
				+ motherboard_idx + ", motherboard_image_name=" + motherboard_image_name + ", motherboard_image_ext="
				+ motherboard_image_ext + ", motherboard_sfile_name=" + motherboard_sfile_name + "]";
	};

}
