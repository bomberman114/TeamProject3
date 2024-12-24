package com.green.hdd.image.vo;

public class HddImage {

	private int hdd_image_idx; // 파일고유번호
	private int hdd_idx; // 게시글 번호
	private String hdd_image_name; // 파일이름
	private String hdd_image_ext; // 파일확장자
	private String hdd_sfile_name; // 저장된 실제 파일명

	public HddImage() {
	}

	public HddImage(int hdd_image_idx, int hdd_idx, String hdd_image_name, String hdd_image_ext,
			String hdd_sfile_name) {
		super();
		this.hdd_image_idx = hdd_image_idx;
		this.hdd_idx = hdd_idx;
		this.hdd_image_name = hdd_image_name;
		this.hdd_image_ext = hdd_image_ext;
		this.hdd_sfile_name = hdd_sfile_name;
	}

	public int gethdd_image_idx() {
		return hdd_image_idx;
	}

	public void sethdd_image_idx(int hdd_image_idx) {
		this.hdd_image_idx = hdd_image_idx;
	}

	public int gethdd_idx() {
		return hdd_idx;
	}

	public void sethdd_idx(int hdd_idx) {
		this.hdd_idx = hdd_idx;
	}

	public String gethdd_image_name() {
		return hdd_image_name;
	}

	public void sethdd_image_name(String hdd_image_name) {
		this.hdd_image_name = hdd_image_name;
	}

	public String gethdd_image_ext() {
		return hdd_image_ext;
	}

	public void sethdd_image_ext(String hdd_image_ext) {
		this.hdd_image_ext = hdd_image_ext;
	}

	public String gethdd_sfile_name() {
		return hdd_sfile_name;
	}

	public void sethdd_sfile_name(String hdd_sfile_name) {
		this.hdd_sfile_name = hdd_sfile_name;
	}

	@Override
	public String toString() {
		return "hddImage [hdd_image_idx=" + hdd_image_idx + ", hdd_idx=" + hdd_idx + ", hdd_image_name="
				+ hdd_image_name + ", hdd_image_ext=" + hdd_image_ext + ", hdd_sfile_name=" + hdd_sfile_name + "]";
	};

}
