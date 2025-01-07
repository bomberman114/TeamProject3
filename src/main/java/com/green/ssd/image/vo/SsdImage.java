package com.green.ssd.image.vo;

public class SsdImage {

	private int ssd_image_idx; // 파일고유번호
	private int ssd_idx; // 게시글 번호
	private String ssd_image_name; // 파일이름
	private String ssd_image_ext; // 파일확장자
	private String ssd_sfile_name; // 저장된 실제 파일명

	public SsdImage() {
	}

	public SsdImage(int ssd_image_idx, int ssd_idx, String ssd_image_name, String ssd_image_ext,
			String ssd_sfile_name) {
		super();
		this.ssd_image_idx = ssd_image_idx;
		this.ssd_idx = ssd_idx;
		this.ssd_image_name = ssd_image_name;
		this.ssd_image_ext = ssd_image_ext;
		this.ssd_sfile_name = ssd_sfile_name;
	}

	public int getssd_image_idx() {
		return ssd_image_idx;
	}

	public void setssd_image_idx(int ssd_image_idx) {
		this.ssd_image_idx = ssd_image_idx;
	}

	public int getssd_idx() {
		return ssd_idx;
	}

	public void setssd_idx(int ssd_idx) {
		this.ssd_idx = ssd_idx;
	}

	public String getssd_image_name() {
		return ssd_image_name;
	}

	public void setssd_image_name(String ssd_image_name) {
		this.ssd_image_name = ssd_image_name;
	}

	public String getssd_image_ext() {
		return ssd_image_ext;
	}

	public void setssd_image_ext(String ssd_image_ext) {
		this.ssd_image_ext = ssd_image_ext;
	}

	public String getssd_sfile_name() {
		return ssd_sfile_name;
	}

	public void setssd_sfile_name(String ssd_sfile_name) {
		this.ssd_sfile_name = ssd_sfile_name;
	}

	@Override
	public String toString() {
		return "ssdImage [ssd_image_idx=" + ssd_image_idx + ", ssd_idx=" + ssd_idx + ", ssd_image_name="
				+ ssd_image_name + ", ssd_image_ext=" + ssd_image_ext + ", ssd_sfile_name=" + ssd_sfile_name + "]";
	};

}
