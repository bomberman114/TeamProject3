package com.green.power.image.vo;

public class PowerImage {

	private int power_image_idx; // 파일고유번호
	private int power_idx; // 게시글 번호
	private String power_image_name; // 파일이름
	private String power_image_ext; // 파일확장자
	private String power_sfile_name; // 저장된 실제 파일명

	public PowerImage() {
	}

	public PowerImage(int power_image_idx, int power_idx, String power_image_name, String power_image_ext,
			String power_sfile_name) {
		super();
		this.power_image_idx = power_image_idx;
		this.power_idx = power_idx;
		this.power_image_name = power_image_name;
		this.power_image_ext = power_image_ext;
		this.power_sfile_name = power_sfile_name;
	}

	public int getpower_image_idx() {
		return power_image_idx;
	}

	public void setpower_image_idx(int power_image_idx) {
		this.power_image_idx = power_image_idx;
	}

	public int getpower_idx() {
		return power_idx;
	}

	public void setpower_idx(int power_idx) {
		this.power_idx = power_idx;
	}

	public String getpower_image_name() {
		return power_image_name;
	}

	public void setpower_image_name(String power_image_name) {
		this.power_image_name = power_image_name;
	}

	public String getpower_image_ext() {
		return power_image_ext;
	}

	public void setpower_image_ext(String power_image_ext) {
		this.power_image_ext = power_image_ext;
	}

	public String getpower_sfile_name() {
		return power_sfile_name;
	}

	public void setpower_sfile_name(String power_sfile_name) {
		this.power_sfile_name = power_sfile_name;
	}

	@Override
	public String toString() {
		return "powerImage [power_image_idx=" + power_image_idx + ", power_idx=" + power_idx + ", power_image_name="
				+ power_image_name + ", power_image_ext=" + power_image_ext + ", power_sfile_name="
				+ power_sfile_name + "]";
	};

}
