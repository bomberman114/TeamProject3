package com.green.laptop.manaufacturer.image.vo;

public class LaptopManufacturerImage {
	// laptop_manufacturer
	private int laptop_manufacturer_image_idx; // 파일고유번호
	private int laptop_manufacturer_idx; // 게시글 번호
	private String laptop_manufacturer_image_name; // 파일이름
	private String laptop_manufacturer_image_ext; // 파일확장자
	private String laptop_manufacturer_sfile_name; // 저장된 실제 파일명
	

	public LaptopManufacturerImage() {
	}

	public LaptopManufacturerImage(int laptop_manufacturer_image_idx, int laptop_manufacturer_idx,
			String laptop_manufacturer_image_name, String laptop_manufacturer_image_ext,
			String laptop_manufacturer_sfile_name) {
		super();
		this.laptop_manufacturer_image_idx = laptop_manufacturer_image_idx;
		this.laptop_manufacturer_idx = laptop_manufacturer_idx;
		this.laptop_manufacturer_image_name = laptop_manufacturer_image_name;
		this.laptop_manufacturer_image_ext = laptop_manufacturer_image_ext;
		this.laptop_manufacturer_sfile_name = laptop_manufacturer_sfile_name;
	}

	public int getlaptop_manufacturer_image_idx() {
		return laptop_manufacturer_image_idx;
	}

	public void setlaptop_manufacturer_image_idx(int laptop_manufacturer_image_idx) {
		this.laptop_manufacturer_image_idx = laptop_manufacturer_image_idx;
	}

	public int getlaptop_manufacturer_idx() {
		return laptop_manufacturer_idx;
	}

	public void setlaptop_manufacturer_idx(int laptop_manufacturer_idx) {
		this.laptop_manufacturer_idx = laptop_manufacturer_idx;
	}

	public String getlaptop_manufacturer_image_name() {
		return laptop_manufacturer_image_name;
	}

	public void setlaptop_manufacturer_image_name(String laptop_manufacturer_image_name) {
		this.laptop_manufacturer_image_name = laptop_manufacturer_image_name;
	}

	public String getlaptop_manufacturer_image_ext() {
		return laptop_manufacturer_image_ext;
	}

	public void setlaptop_manufacturer_image_ext(String laptop_manufacturer_image_ext) {
		this.laptop_manufacturer_image_ext = laptop_manufacturer_image_ext;
	}

	public String getlaptop_manufacturer_sfile_name() {
		return laptop_manufacturer_sfile_name;
	}

	public void setlaptop_manufacturer_sfile_name(String laptop_manufacturer_sfile_name) {
		this.laptop_manufacturer_sfile_name = laptop_manufacturer_sfile_name;
	}

	@Override
	public String toString() {
		return "laptop_manufacturerImage [laptop_manufacturer_image_idx=" + laptop_manufacturer_image_idx
				+ ", laptop_manufacturer_idx=" + laptop_manufacturer_idx + ", laptop_manufacturer_image_name="
				+ laptop_manufacturer_image_name + ", laptop_manufacturer_image_ext=" + laptop_manufacturer_image_ext
				+ ", laptop_manufacturer_sfile_name=" + laptop_manufacturer_sfile_name + "]";
	};

}
