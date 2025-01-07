package com.green.community.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityVo {
	private int     user_idx;
	private int     community_idx;
	private int     community_answer_idx;

	private String  community_title;
	private String  community_menu;
	private String  community_regdate;
	private String  community_content;
	private String  community_spec_cpu;
	private String  community_spec_mainboard;
	private String  community_spec_memory;
	private String  community_spec_gpu;
	private String  community_spec_ssd;
	private String  community_spec_hdd;
	private String  community_spec_cooler;
	private String  community_spec_case;
	private String  community_spec_power;
	private int     total_answers;
	
	private int     community_views;
	
	private String  user_nickname;
	private String  community_sfile_name;
	
	private String  community_answer_regdate;
	private String  community_answer_content;
	
	private int     customer_service_idx;
	private String  customer_service_title;
	private String  customer_service_type;
	private String  customer_service_regdate;
	private String  customer_service_content;
	private String  customer_service_answer_status;
}
