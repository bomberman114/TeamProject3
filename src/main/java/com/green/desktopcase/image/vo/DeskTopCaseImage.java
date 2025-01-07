package com.green.desktopcase.image.vo;

public class DeskTopCaseImage {

	private int desktop_case_image_idx; // 파일고유번호
	private int desktop_case_idx; // 게시글 번호
	private String desktop_case_image_name; // 파일이름
	private String desktop_case_image_ext; // 파일확장자
	private String desktop_case_sfile_name; // 저장된 실제 파일명
	
	public DeskTopCaseImage() {
	}

	public DeskTopCaseImage(int desktop_case_image_idx, int desktop_case_idx, String desktop_case_image_name,
			String desktop_case_image_ext, String desktop_case_sfile_name) {
		super();
		this.desktop_case_image_idx = desktop_case_image_idx;
		this.desktop_case_idx = desktop_case_idx;
		this.desktop_case_image_name = desktop_case_image_name;
		this.desktop_case_image_ext = desktop_case_image_ext;
		this.desktop_case_sfile_name = desktop_case_sfile_name;
	}

	public int getdesktop_case_image_idx() {
		return desktop_case_image_idx;
	}

	public void setdesktop_case_image_idx(int desktop_case_image_idx) {
		this.desktop_case_image_idx = desktop_case_image_idx;
	}

	public int getdesktop_case_idx() {
		return desktop_case_idx;
	}

	public void setdesktop_case_idx(int desktop_case_idx) {
		this.desktop_case_idx = desktop_case_idx;
	}

	public String getdesktop_case_image_name() {
		return desktop_case_image_name;
	}

	public void setdesktop_case_image_name(String desktop_case_image_name) {
		this.desktop_case_image_name = desktop_case_image_name;
	}

	public String getdesktop_case_image_ext() {
		return desktop_case_image_ext;
	}

	public void setdesktop_case_image_ext(String desktop_case_image_ext) {
		this.desktop_case_image_ext = desktop_case_image_ext;
	}

	public String getdesktop_case_sfile_name() {
		return desktop_case_sfile_name;
	}

	public void setdesktop_case_sfile_name(String desktop_case_sfile_name) {
		this.desktop_case_sfile_name = desktop_case_sfile_name;
	}

	@Override
	public String toString() {
		return "desktop_caseImage [desktop_case_image_idx=" + desktop_case_image_idx + ", desktop_case_idx="
				+ desktop_case_idx + ", desktop_case_image_name=" + desktop_case_image_name
				+ ", desktop_case_image_ext=" + desktop_case_image_ext + ", desktop_case_sfile_name="
				+ desktop_case_sfile_name + "]";
	};

}
