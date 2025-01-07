package com.green.computer.part.filter.vo;

public class ComputerPartFilter {

	// 부품마다의 필터및 설명
	private int computer_part_filter_idx;
	private String computer_part_filter_name;
	private String computer_part_filter_terms_explain;
	private int computer_part_idx;

	public ComputerPartFilter() {
	}

	public ComputerPartFilter(int computer_part_filter_idx, String computer_part_filter_name,
			String computer_part_filter_terms_explain, int computer_part_idx) {
		super();
		this.computer_part_filter_idx = computer_part_filter_idx;
		this.computer_part_filter_name = computer_part_filter_name;
		this.computer_part_filter_terms_explain = computer_part_filter_terms_explain;
		this.computer_part_idx = computer_part_idx;
	}

	public int getComputer_part_filter_idx() {
		return computer_part_filter_idx;
	}

	public void setComputer_part_filter_idx(int computer_part_filter_idx) {
		this.computer_part_filter_idx = computer_part_filter_idx;
	}

	public String getComputer_part_filter_name() {
		return computer_part_filter_name;
	}

	public void setComputer_part_filter_name(String computer_part_filter_name) {
		this.computer_part_filter_name = computer_part_filter_name;
	}

	public String getComputer_part_filter_terms_explain() {
		return computer_part_filter_terms_explain;
	}

	public void setComputer_part_filter_terms_explain(String computer_part_filter_terms_explain) {
		this.computer_part_filter_terms_explain = computer_part_filter_terms_explain;
	}

	public int getComputer_part_idx() {
		return computer_part_idx;
	}

	public void setComputer_part_idx(int computer_part_idx) {
		this.computer_part_idx = computer_part_idx;
	}

	@Override
	public String toString() {
		return "ComputerPartFilter [computer_part_filter_idx=" + computer_part_filter_idx
				+ ", computer_part_filter_name=" + computer_part_filter_name + ", computer_part_filter_terms_explain="
				+ computer_part_filter_terms_explain + ", computer_part_idx=" + computer_part_idx + "]";
	}

}
