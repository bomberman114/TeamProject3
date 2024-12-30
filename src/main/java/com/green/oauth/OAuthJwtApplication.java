package com.green.oauth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.green.oauth", "com.green.userDetails","com.green.user"})
public class OAuthJwtApplication {

	public static void main(String[] args) {
		SpringApplication.run(OAuthJwtApplication.class, args);
	}

}
