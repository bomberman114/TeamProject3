package com.green.oauth.vo;

import lombok.Data;

@Data
public class SocialUserVo {
	private Long   social_user_idx;
	private Long   user_idx;
	private String social_user_socialid;
	private String social_user_name;
	private String social_user_provider;
	private String social_user_email;
	private String social_user_role;
	private String social_user_nickname;
}

