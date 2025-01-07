package com.green.laptop.image.vo;

public class LaptopImage {
	// laptop
	private int laptop_image_idx; // 파일고유번호
	private int laptop_idx; // 게시글 번호
	private String laptop_image_name; // 파일이름
	private String laptop_image_ext; // 파일확장자
	private String laptop_sfile_name; // 저장된 실제 파일명

	public LaptopImage() {
	}

	public LaptopImage(int laptop_image_idx, int laptop_idx, String laptop_image_name, String laptop_image_ext,
			String laptop_sfile_name) {
		super();
		this.laptop_image_idx = laptop_image_idx;
		this.laptop_idx = laptop_idx;
		this.laptop_image_name = laptop_image_name;
		this.laptop_image_ext = laptop_image_ext;
		this.laptop_sfile_name = laptop_sfile_name;
	}

	public int getlaptop_image_idx() {
		return laptop_image_idx;
	}

	public void setlaptop_image_idx(int laptop_image_idx) {
		this.laptop_image_idx = laptop_image_idx;
	}

	public int getlaptop_idx() {
		return laptop_idx;
	}

	public void setlaptop_idx(int laptop_idx) {
		this.laptop_idx = laptop_idx;
	}

	public String getlaptop_image_name() {
		return laptop_image_name;
	}

	public void setlaptop_image_name(String laptop_image_name) {
		this.laptop_image_name = laptop_image_name;
	}

	public String getlaptop_image_ext() {
		return laptop_image_ext;
	}

	public void setlaptop_image_ext(String laptop_image_ext) {
		this.laptop_image_ext = laptop_image_ext;
	}

	public String getlaptop_sfile_name() {
		return laptop_sfile_name;
	}

	public void setlaptop_sfile_name(String laptop_sfile_name) {
		this.laptop_sfile_name = laptop_sfile_name;
	}

	@Override
	public String toString() {
		return "laptopImage [laptop_image_idx=" + laptop_image_idx + ", laptop_idx=" + laptop_idx
				+ ", laptop_image_name=" + laptop_image_name + ", laptop_image_ext=" + laptop_image_ext
				+ ", laptop_sfile_name=" + laptop_sfile_name + "]";
	};

}
