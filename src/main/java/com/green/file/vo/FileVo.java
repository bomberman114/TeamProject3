package com.green.file.vo;

public class FileVo {

	private int product_image_idx;
	private int product_idx;
	private String product_image_name;
	private String product_image_ext;
	private String product_sfile_name;

	public FileVo() {
	}

	public FileVo(int product_image_idx, int product_idx, String product_image_name, String product_image_ext,
			String product_sfile_name) {
		super();
		this.product_image_idx = product_image_idx;
		this.product_idx = product_idx;
		this.product_image_name = product_image_name;
		this.product_image_ext = product_image_ext;
		this.product_sfile_name = product_sfile_name;
	}

	public int getProduct_image_idx() {
		return product_image_idx;
	}

	public void setProduct_image_idx(int product_image_idx) {
		this.product_image_idx = product_image_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public String getProduct_image_name() {
		return product_image_name;
	}

	public void setProduct_image_name(String product_image_name) {
		this.product_image_name = product_image_name;
	}

	public String getProduct_image_ext() {
		return product_image_ext;
	}

	public void setProduct_image_ext(String product_image_ext) {
		this.product_image_ext = product_image_ext;
	}

	public String getProduct_sfile_name() {
		return product_sfile_name;
	}

	public void setProduct_sfile_name(String product_sfile_name) {
		this.product_sfile_name = product_sfile_name;
	}

	@Override
	public String toString() {
		return "FileVo [product_image_idx=" + product_image_idx + ", product_idx=" + product_idx
				+ ", product_image_name=" + product_image_name + ", product_image_ext=" + product_image_ext
				+ ", product_sfile_name=" + product_sfile_name + "]";
	}

}
