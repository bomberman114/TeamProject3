package com.green.ram.image.vo;

public class RamImage {

	private int ram_image_idx; // 파일고유번호
	private int ram_idx; // 게시글 번호
	private String ram_image_name; // 파일이름
	private String ram_image_ext; // 파일확장자
	private String ram_sfile_name; // 저장된 실제 파일명

	public RamImage() {
	}

	public RamImage(int ram_image_idx, int ram_idx, String ram_image_name, String ram_image_ext,
			String ram_sfile_name) {
		super();
		this.ram_image_idx = ram_image_idx;
		this.ram_idx = ram_idx;
		this.ram_image_name = ram_image_name;
		this.ram_image_ext = ram_image_ext;
		this.ram_sfile_name = ram_sfile_name;
	}

	public int getram_image_idx() {
		return ram_image_idx;
	}

	public void setram_image_idx(int ram_image_idx) {
		this.ram_image_idx = ram_image_idx;
	}

	public int getram_idx() {
		return ram_idx;
	}

	public void setram_idx(int ram_idx) {
		this.ram_idx = ram_idx;
	}

	public String getram_image_name() {
		return ram_image_name;
	}

	public void setram_image_name(String ram_image_name) {
		this.ram_image_name = ram_image_name;
	}

	public String getram_image_ext() {
		return ram_image_ext;
	}

	public void setram_image_ext(String ram_image_ext) {
		this.ram_image_ext = ram_image_ext;
	}

	public String getram_sfile_name() {
		return ram_sfile_name;
	}

	public void setram_sfile_name(String ram_sfile_name) {
		this.ram_sfile_name = ram_sfile_name;
	}

	@Override
	public String toString() {
		return "ramImage [ram_image_idx=" + ram_image_idx + ", ram_idx=" + ram_idx + ", ram_image_name="
				+ ram_image_name + ", ram_image_ext=" + ram_image_ext + ", ram_sfile_name=" + ram_sfile_name + "]";
	};

}
