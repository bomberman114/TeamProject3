package com.green.laptop.lineup.image.vo;

public class LaptopLineupImage {
	// laptop_lineup   
	private int laptop_lineup_image_idx; // 파일고유번호
	private int laptop_lineup_idx; // 게시글 번호
	private String laptop_lineup_image_name; // 파일이름
	private String laptop_lineup_image_ext; // 파일확장자
	private String laptop_lineup_sfile_name; // 저장된 실제 파일명

	public LaptopLineupImage() {
	}

	public LaptopLineupImage(int laptop_lineup_image_idx, int laptop_lineup_idx, String laptop_lineup_image_name,
			String laptop_lineup_image_ext, String laptop_lineup_sfile_name) {
		super();
		this.laptop_lineup_image_idx = laptop_lineup_image_idx;
		this.laptop_lineup_idx = laptop_lineup_idx;
		this.laptop_lineup_image_name = laptop_lineup_image_name;
		this.laptop_lineup_image_ext = laptop_lineup_image_ext;
		this.laptop_lineup_sfile_name = laptop_lineup_sfile_name;
	}

	public int getlaptop_lineup_image_idx() {
		return laptop_lineup_image_idx;
	}

	public void setlaptop_lineup_image_idx(int laptop_lineup_image_idx) {
		this.laptop_lineup_image_idx = laptop_lineup_image_idx;
	}

	public int getlaptop_lineup_idx() {
		return laptop_lineup_idx;
	}

	public void setlaptop_lineup_idx(int laptop_lineup_idx) {
		this.laptop_lineup_idx = laptop_lineup_idx;
	}

	public String getlaptop_lineup_image_name() {
		return laptop_lineup_image_name;
	}

	public void setlaptop_lineup_image_name(String laptop_lineup_image_name) {
		this.laptop_lineup_image_name = laptop_lineup_image_name;
	}

	public String getlaptop_lineup_image_ext() {
		return laptop_lineup_image_ext;
	}

	public void setlaptop_lineup_image_ext(String laptop_lineup_image_ext) {
		this.laptop_lineup_image_ext = laptop_lineup_image_ext;
	}

	public String getlaptop_lineup_sfile_name() {
		return laptop_lineup_sfile_name;
	}

	public void setlaptop_lineup_sfile_name(String laptop_lineup_sfile_name) {
		this.laptop_lineup_sfile_name = laptop_lineup_sfile_name;
	}

	@Override
	public String toString() {
		return "laptop_lineupImage [laptop_lineup_image_idx=" + laptop_lineup_image_idx + ", laptop_lineup_idx="
				+ laptop_lineup_idx + ", laptop_lineup_image_name=" + laptop_lineup_image_name
				+ ", laptop_lineup_image_ext=" + laptop_lineup_image_ext + ", laptop_lineup_sfile_name="
				+ laptop_lineup_sfile_name + "]";
	};

}
