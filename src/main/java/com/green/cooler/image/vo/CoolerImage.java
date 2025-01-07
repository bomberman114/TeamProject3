package com.green.cooler.image.vo;

public class CoolerImage {

	private int cooler_image_idx; // 파일고유번호
	private int cooler_idx; // 게시글 번호
	private String cooler_image_name; // 파일이름
	private String cooler_image_ext; // 파일확장자
	private String cooler_sfile_name; // 저장된 실제 파일명

	public CoolerImage() {
	}

	public CoolerImage(int cooler_image_idx, int cooler_idx, String cooler_image_name, String cooler_image_ext,
			String cooler_sfile_name) {
		super();
		this.cooler_image_idx = cooler_image_idx;
		this.cooler_idx = cooler_idx;
		this.cooler_image_name = cooler_image_name;
		this.cooler_image_ext = cooler_image_ext;
		this.cooler_sfile_name = cooler_sfile_name;
	}

	public int getcooler_image_idx() {
		return cooler_image_idx;
	}

	public void setcooler_image_idx(int cooler_image_idx) {
		this.cooler_image_idx = cooler_image_idx;
	}

	public int getcooler_idx() {
		return cooler_idx;
	}

	public void setcooler_idx(int cooler_idx) {
		this.cooler_idx = cooler_idx;
	}

	public String getcooler_image_name() {
		return cooler_image_name;
	}

	public void setcooler_image_name(String cooler_image_name) {
		this.cooler_image_name = cooler_image_name;
	}

	public String getcooler_image_ext() {
		return cooler_image_ext;
	}

	public void setcooler_image_ext(String cooler_image_ext) {
		this.cooler_image_ext = cooler_image_ext;
	}

	public String getcooler_sfile_name() {
		return cooler_sfile_name;
	}

	public void setcooler_sfile_name(String cooler_sfile_name) {
		this.cooler_sfile_name = cooler_sfile_name;
	}

	@Override
	public String toString() {
		return "coolerImage [cooler_image_idx=" + cooler_image_idx + ", cooler_idx=" + cooler_idx
				+ ", cooler_image_name=" + cooler_image_name + ", cooler_image_ext=" + cooler_image_ext
				+ ", cooler_sfile_name=" + cooler_sfile_name + "]";
	};

}
