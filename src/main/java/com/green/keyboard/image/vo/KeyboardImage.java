package com.green.keyboard.image.vo;

public class KeyboardImage {

	private int keyboard_image_idx; // 파일고유번호
	private int keyboard_idx; // 게시글 번호
	private String keyboard_image_name; // 파일이름
	private String keyboard_image_ext; // 파일확장자
	private String keyboard_sfile_name; // 저장된 실제 파일명

	public KeyboardImage() {
	}

	public KeyboardImage(int keyboard_image_idx, int keyboard_idx, String keyboard_image_name,
			String keyboard_image_ext, String keyboard_sfile_name) {
		super();
		this.keyboard_image_idx = keyboard_image_idx;
		this.keyboard_idx = keyboard_idx;
		this.keyboard_image_name = keyboard_image_name;
		this.keyboard_image_ext = keyboard_image_ext;
		this.keyboard_sfile_name = keyboard_sfile_name;
	}

	public int getkeyboard_image_idx() {
		return keyboard_image_idx;
	}

	public void setkeyboard_image_idx(int keyboard_image_idx) {
		this.keyboard_image_idx = keyboard_image_idx;
	}

	public int getkeyboard_idx() {
		return keyboard_idx;
	}

	public void setkeyboard_idx(int keyboard_idx) {
		this.keyboard_idx = keyboard_idx;
	}

	public String getkeyboard_image_name() {
		return keyboard_image_name;
	}

	public void setkeyboard_image_name(String keyboard_image_name) {
		this.keyboard_image_name = keyboard_image_name;
	}

	public String getkeyboard_image_ext() {
		return keyboard_image_ext;
	}

	public void setkeyboard_image_ext(String keyboard_image_ext) {
		this.keyboard_image_ext = keyboard_image_ext;
	}

	public String getkeyboard_sfile_name() {
		return keyboard_sfile_name;
	}

	public void setkeyboard_sfile_name(String keyboard_sfile_name) {
		this.keyboard_sfile_name = keyboard_sfile_name;
	}

	@Override
	public String toString() {
		return "keyboardImage [keyboard_image_idx=" + keyboard_image_idx + ", keyboard_idx=" + keyboard_idx
				+ ", keyboard_image_name=" + keyboard_image_name + ", keyboard_image_ext=" + keyboard_image_ext
				+ ", keyboard_sfile_name=" + keyboard_sfile_name + "]";
	};

}
