package com.green.purpose.content.image.vo;

public class PurposeContentImage {

	private int purpose_content_image_idx; // 파일고유번호
	private int purpose_content_idx; // 게시글 번호
	private String purpose_content_image_name; // 파일이름
	private String purpose_content_image_ext; // 파일확장자
	private String purpose_content_sfile_name; // 저장된 실제 파일명

	public PurposeContentImage() {
	}

	public PurposeContentImage(int purpose_content_image_idx, int purpose_content_idx,
			String purpose_content_image_name, String purpose_content_image_ext, String purpose_content_sfile_name) {
		super();
		this.purpose_content_image_idx = purpose_content_image_idx;
		this.purpose_content_idx = purpose_content_idx;
		this.purpose_content_image_name = purpose_content_image_name;
		this.purpose_content_image_ext = purpose_content_image_ext;
		this.purpose_content_sfile_name = purpose_content_sfile_name;
	}

	public int getpurpose_content_image_idx() {
		return purpose_content_image_idx;
	}

	public void setpurpose_content_image_idx(int purpose_content_image_idx) {
		this.purpose_content_image_idx = purpose_content_image_idx;
	}

	public int getpurpose_content_idx() {
		return purpose_content_idx;
	}

	public void setpurpose_content_idx(int purpose_content_idx) {
		this.purpose_content_idx = purpose_content_idx;
	}

	public String getpurpose_content_image_name() {
		return purpose_content_image_name;
	}

	public void setpurpose_content_image_name(String purpose_content_image_name) {
		this.purpose_content_image_name = purpose_content_image_name;
	}

	public String getpurpose_content_image_ext() {
		return purpose_content_image_ext;
	}

	public void setpurpose_content_image_ext(String purpose_content_image_ext) {
		this.purpose_content_image_ext = purpose_content_image_ext;
	}

	public String getpurpose_content_sfile_name() {
		return purpose_content_sfile_name;
	}

	public void setpurpose_content_sfile_name(String purpose_content_sfile_name) {
		this.purpose_content_sfile_name = purpose_content_sfile_name;
	}

	@Override
	public String toString() {
		return "purpose_contentImage [purpose_content_image_idx=" + purpose_content_image_idx + ", purpose_content_idx="
				+ purpose_content_idx + ", purpose_content_image_name=" + purpose_content_image_name
				+ ", purpose_content_image_ext=" + purpose_content_image_ext + ", purpose_content_sfile_name="
				+ purpose_content_sfile_name + "]";
	};

}
