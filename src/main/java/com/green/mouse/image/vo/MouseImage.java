package com.green.mouse.image.vo;

public class MouseImage {

	private int mouse_image_idx; // 파일고유번호
	private int mouse_idx; // 게시글 번호
	private String mouse_image_name; // 파일이름
	private String mouse_image_ext; // 파일확장자
	private String mouse_sfile_name; // 저장된 실제 파일명

	public MouseImage() {
	}

	public MouseImage(int mouse_image_idx, int mouse_idx, String mouse_image_name, String mouse_image_ext,
			String mouse_sfile_name) {
		super();
		this.mouse_image_idx = mouse_image_idx;
		this.mouse_idx = mouse_idx;
		this.mouse_image_name = mouse_image_name;
		this.mouse_image_ext = mouse_image_ext;
		this.mouse_sfile_name = mouse_sfile_name;
	}

	public int getmouse_image_idx() {
		return mouse_image_idx;
	}

	public void setmouse_image_idx(int mouse_image_idx) {
		this.mouse_image_idx = mouse_image_idx;
	}

	public int getmouse_idx() {
		return mouse_idx;
	}

	public void setmouse_idx(int mouse_idx) {
		this.mouse_idx = mouse_idx;
	}

	public String getmouse_image_name() {
		return mouse_image_name;
	}

	public void setmouse_image_name(String mouse_image_name) {
		this.mouse_image_name = mouse_image_name;
	}

	public String getmouse_image_ext() {
		return mouse_image_ext;
	}

	public void setmouse_image_ext(String mouse_image_ext) {
		this.mouse_image_ext = mouse_image_ext;
	}

	public String getmouse_sfile_name() {
		return mouse_sfile_name;
	}

	public void setmouse_sfile_name(String mouse_sfile_name) {
		this.mouse_sfile_name = mouse_sfile_name;
	}

	@Override
	public String toString() {
		return "mouseImage [mouse_image_idx=" + mouse_image_idx + ", mouse_idx=" + mouse_idx + ", mouse_image_name="
				+ mouse_image_name + ", mouse_image_ext=" + mouse_image_ext + ", mouse_sfile_name=" + mouse_sfile_name
				+ "]";
	};

}
