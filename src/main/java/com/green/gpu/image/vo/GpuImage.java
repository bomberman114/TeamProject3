package com.green.gpu.image.vo;

public class GpuImage {
	
	private int gpu_image_idx; // 파일고유번호
	private int gpu_idx; // 게시글 번호
	private String gpu_image_name; // 파일이름
	private String gpu_image_ext; // 파일확장자
	private String gpu_sfile_name; // 저장된 실제 파일명

	public GpuImage() {
	}

	public GpuImage(int gpu_image_idx, int gpu_idx, String gpu_image_name, String gpu_image_ext,
			String gpu_sfile_name) {
		super();
		this.gpu_image_idx = gpu_image_idx;
		this.gpu_idx = gpu_idx;
		this.gpu_image_name = gpu_image_name;
		this.gpu_image_ext = gpu_image_ext;
		this.gpu_sfile_name = gpu_sfile_name;
	}

	public int getgpu_image_idx() {
		return gpu_image_idx;
	}

	public void setgpu_image_idx(int gpu_image_idx) {
		this.gpu_image_idx = gpu_image_idx;
	}

	public int getgpu_idx() {
		return gpu_idx;
	}

	public void setgpu_idx(int gpu_idx) {
		this.gpu_idx = gpu_idx;
	}

	public String getgpu_image_name() {
		return gpu_image_name;
	}

	public void setgpu_image_name(String gpu_image_name) {
		this.gpu_image_name = gpu_image_name;
	}

	public String getgpu_image_ext() {
		return gpu_image_ext;
	}

	public void setgpu_image_ext(String gpu_image_ext) {
		this.gpu_image_ext = gpu_image_ext;
	}

	public String getgpu_sfile_name() {
		return gpu_sfile_name;
	}

	public void setgpu_sfile_name(String gpu_sfile_name) {
		this.gpu_sfile_name = gpu_sfile_name;
	}

	@Override
	public String toString() {
		return "gpuImage [gpu_image_idx=" + gpu_image_idx + ", gpu_idx=" + gpu_idx + ", gpu_image_name="
				+ gpu_image_name + ", gpu_image_ext=" + gpu_image_ext + ", gpu_sfile_name=" + gpu_sfile_name + "]";
	};

}
