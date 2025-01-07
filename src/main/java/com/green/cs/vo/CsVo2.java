package com.green.cs.vo;

public class CsVo2 {
	private int     user_idx;
	private int     admin_user_idx;
	private int     customer_service_idx;
	private String  customer_service_title;
	private String  customer_service_type;
	private String  customer_service_regdate;
	private String  customer_service_content;
	
	private int     customer_service_answer_idx;
	private String  customer_service_answer_regdate;
	private String  customer_service_answer_content;
	
	private int     customer_service_image_idx;
	private String  customer_service_image_name;  // MultipartFile ?
	private String  customer_service_image_ext;
	private String  customer_service_sfile_name;  // MultipartFile ?
	
	private Integer notice_idx;
	private String  notice_title;
	private String  notice_type;
	private String  notice_regdate;
	private String  notice_content;

	private int     notice_image_idx;
	private String  notice_image_name;  // MultipartFile ?
	private String  notice_image_ext;
	private String  notice_sfile_name;  // MultipartFile ?
	
	// Getter/Setter
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getAdmin_user_idx() {
		return admin_user_idx;
	}
	public void setAdmin_user_idx(int admin_user_idx) {
		this.admin_user_idx = admin_user_idx;
	}
	public int getCustomer_service_idx() {
		return customer_service_idx;
	}
	public void setCustomer_service_idx(int customer_service_idx) {
		this.customer_service_idx = customer_service_idx;
	}
	public String getCustomer_service_title() {
		return customer_service_title;
	}
	public void setCustomer_service_title(String customer_service_title) {
		this.customer_service_title = customer_service_title;
	}
	public String getCustomer_service_type() {
		return customer_service_type;
	}
	public void setCustomer_service_type(String customer_service_type) {
		this.customer_service_type = customer_service_type;
	}
	public String getCustomer_service_regdate() {
		return customer_service_regdate;
	}
	public void setCustomer_service_regdate(String customer_service_regdate) {
		this.customer_service_regdate = customer_service_regdate;
	}
	public String getCustomer_service_content() {
		return customer_service_content;
	}
	public void setCustomer_service_content(String customer_service_content) {
		this.customer_service_content = customer_service_content;
	}
	public int getCustomer_service_answer_idx() {
		return customer_service_answer_idx;
	}
	public void setCustomer_service_answer_idx(int customer_service_answer_idx) {
		this.customer_service_answer_idx = customer_service_answer_idx;
	}
	public String getCustomer_service_answer_regdate() {
		return customer_service_answer_regdate;
	}
	public void setCustomer_service_answer_regdate(String customer_service_answer_regdate) {
		this.customer_service_answer_regdate = customer_service_answer_regdate;
	}
	public String getCustomer_service_answer_content() {
		return customer_service_answer_content;
	}
	public void setCustomer_service_answer_content(String customer_service_answer_content) {
		this.customer_service_answer_content = customer_service_answer_content;
	}
	public int getCustomer_service_image_idx() {
		return customer_service_image_idx;
	}
	public void setCustomer_service_image_idx(int customer_service_image_idx) {
		this.customer_service_image_idx = customer_service_image_idx;
	}
	public String getCustomer_service_image_name() {
		return customer_service_image_name;
	}
	public void setCustomer_service_image_name(String customer_service_image_name) {
		this.customer_service_image_name = customer_service_image_name;
	}
	public String getCustomer_service_image_ext() {
		return customer_service_image_ext;
	}
	public void setCustomer_service_image_ext(String customer_service_image_ext) {
		this.customer_service_image_ext = customer_service_image_ext;
	}
	public String getCustomer_service_sfile_name() {
		return customer_service_sfile_name;
	}
	public void setCustomer_service_sfile_name(String customer_service_sfile_name) {
		this.customer_service_sfile_name = customer_service_sfile_name;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
    public void setNotice_idx(Integer notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(String notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_image_idx() {
		return notice_image_idx;
	}
	public void setNotice_image_idx(int notice_image_idx) {
		this.notice_image_idx = notice_image_idx;
	}
	public String getNotice_image_name() {
		return notice_image_name;
	}
	public void setNotice_image_name(String notice_image_name) {
		this.notice_image_name = notice_image_name;
	}
	public String getNotice_image_ext() {
		return notice_image_ext;
	}
	public void setNotice_image_ext(String notice_image_ext) {
		this.notice_image_ext = notice_image_ext;
	}
	public String getNotice_sfile_name() {
		return notice_sfile_name;
	}
	public void setNotice_sfile_name(String notice_sfile_name) {
		this.notice_sfile_name = notice_sfile_name;
	}
	
	// toString
	@Override
	public String toString() {
		return "CsVo [user_idx=" + user_idx + ", admin_user_idx=" + admin_user_idx + ", customer_service_idx="
				+ customer_service_idx + ", customer_service_title=" + customer_service_title
				+ ", customer_service_type=" + customer_service_type + ", customer_service_regdate="
				+ customer_service_regdate + ", customer_service_content=" + customer_service_content
				+ ", customer_service_answer_idx=" + customer_service_answer_idx + ", customer_service_answer_regdate="
				+ customer_service_answer_regdate + ", customer_service_answer_content="
				+ customer_service_answer_content + ", customer_service_image_idx=" + customer_service_image_idx
				+ ", customer_service_image_name=" + customer_service_image_name + ", customer_service_image_ext="
				+ customer_service_image_ext + ", customer_service_sfile_name=" + customer_service_sfile_name
				+ ", notice_idx=" + notice_idx + ", notice_title=" + notice_title + ", notice_type=" + notice_type
				+ ", notice_regdate=" + notice_regdate + ", notice_content=" + notice_content + ", notice_image_idx="
				+ notice_image_idx + ", notice_image_name=" + notice_image_name + ", notice_image_ext="
				+ notice_image_ext + ", notice_sfile_name=" + notice_sfile_name + "]";
	}
	
	// Constructor
	public CsVo2(int user_idx, int admin_user_idx, int customer_service_idx, String customer_service_title,
			String customer_service_type, String customer_service_regdate, String customer_service_content,
			int customer_service_answer_idx, String customer_service_answer_regdate,
			String customer_service_answer_content, int customer_service_image_idx, String customer_service_image_name,
			String customer_service_image_ext, String customer_service_sfile_name, Integer notice_idx, String notice_title,
			String notice_type, String notice_regdate, String notice_content, int notice_image_idx,
			String notice_image_name, String notice_image_ext, String notice_sfile_name) {
		this.user_idx = user_idx;
		this.admin_user_idx = admin_user_idx;
		this.customer_service_idx = customer_service_idx;
		this.customer_service_title = customer_service_title;
		this.customer_service_type = customer_service_type;
		this.customer_service_regdate = customer_service_regdate;
		this.customer_service_content = customer_service_content;
		this.customer_service_answer_idx = customer_service_answer_idx;
		this.customer_service_answer_regdate = customer_service_answer_regdate;
		this.customer_service_answer_content = customer_service_answer_content;
		this.customer_service_image_idx = customer_service_image_idx;
		this.customer_service_image_name = customer_service_image_name;
		this.customer_service_image_ext = customer_service_image_ext;
		this.customer_service_sfile_name = customer_service_sfile_name;
		this.notice_idx = notice_idx;
		this.notice_title = notice_title;
		this.notice_type = notice_type;
		this.notice_regdate = notice_regdate;
		this.notice_content = notice_content;
		this.notice_image_idx = notice_image_idx;
		this.notice_image_name = notice_image_name;
		this.notice_image_ext = notice_image_ext;
		this.notice_sfile_name = notice_sfile_name;
	}
	
	// 빈 constructor
	public CsVo2() {	}

}
