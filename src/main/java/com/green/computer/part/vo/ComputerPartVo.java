package com.green.computer.part.vo;

public class ComputerPartVo {
	// 컴퓨터 부품
	private int computer_part_idx;
	private String computer_part_name; //
	private int category_idx;

	public ComputerPartVo() {
	}

	public ComputerPartVo(int computer_part_idx, String computer_part_name, int category_idx) {
		super();
		this.computer_part_idx = computer_part_idx;
		this.computer_part_name = computer_part_name;
		this.category_idx = category_idx;
	}

	public int getComputer_part_idx() {
		return computer_part_idx;
	}

	public void setComputer_part_idx(int computer_part_idx) {
		this.computer_part_idx = computer_part_idx;
	}

	public String getComputer_part_name() {
		return computer_part_name;
	}

	public void setComputer_part_name(String computer_part_name) {
		this.computer_part_name = computer_part_name;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	@Override
	public String toString() {
		return "ComputerPartVo [computer_part_idx=" + computer_part_idx + ", computer_part_name=" + computer_part_name
				+ ", category_idx=" + category_idx + "]";
	};

}
