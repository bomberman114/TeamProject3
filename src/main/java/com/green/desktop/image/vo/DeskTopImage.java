package com.green.desktop.image.vo;

public class DeskTopImage {

	private int desktop_image_idx; // 파일고유번호
	private int desktop_idx; // 게시글 번호
	private String desktop_image_name; // 파일이름
	private String desktop_image_ext; // 파일확장자
	private String desktop_sfile_name; // 저장된 실제 파일명

	public DeskTopImage() {
	}

	public DeskTopImage(int desktop_image_idx, int desktop_idx, String desktop_image_name, String desktop_image_ext,
			String desktop_sfile_name) {
		super();
		this.desktop_image_idx = desktop_image_idx;
		this.desktop_idx = desktop_idx;
		this.desktop_image_name = desktop_image_name;
		this.desktop_image_ext = desktop_image_ext;
		this.desktop_sfile_name = desktop_sfile_name;
	}

	public int getdesktop_image_idx() {
		return desktop_image_idx;
	}

	public void setdesktop_image_idx(int desktop_image_idx) {
		this.desktop_image_idx = desktop_image_idx;
	}

	public int getdesktop_idx() {
		return desktop_idx;
	}

	public void setdesktop_idx(int desktop_idx) {
		this.desktop_idx = desktop_idx;
	}

	public String getdesktop_image_name() {
		return desktop_image_name;
	}

	public void setdesktop_image_name(String desktop_image_name) {
		this.desktop_image_name = desktop_image_name;
	}

	public String getdesktop_image_ext() {
		return desktop_image_ext;
	}

	public void setdesktop_image_ext(String desktop_image_ext) {
		this.desktop_image_ext = desktop_image_ext;
	}

	public String getdesktop_sfile_name() {
		return desktop_sfile_name;
	}

	public void setdesktop_sfile_name(String desktop_sfile_name) {
		this.desktop_sfile_name = desktop_sfile_name;
	}

	@Override
	public String toString() {
		return "desktopImage [desktop_image_idx=" + desktop_image_idx + ", desktop_idx=" + desktop_idx
				+ ", desktop_image_name=" + desktop_image_name + ", desktop_image_ext=" + desktop_image_ext
				+ ", desktop_sfile_name=" + desktop_sfile_name + "]";
	};

}
