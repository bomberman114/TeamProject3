package com.green;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
@EnableCaching
@SpringBootApplication
public class TeamProject3Application {

	public static void main(String[] args) {
		SpringApplication.run(TeamProject3Application.class, args);
	}

}