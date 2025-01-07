package com.green.oauth.vo;

import lombok.Data;

@Data
public class UserVo {
	private long   user_idx;
	private String user_email;
	private String user_name;
	private String user_nickname;
	private String user_password;
	private int    user_status;
	private String user_login_method;
	private String user_role;	
	private String user_created_at;
	private String user_updated_at;
}
