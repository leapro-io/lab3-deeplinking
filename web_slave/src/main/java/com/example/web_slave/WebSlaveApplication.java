package com.example.web_slave;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.context.annotation.ComponentScan;
@SpringBootApplication
@ComponentScan(basePackages = "com.example.web_slave")
public class WebSlaveApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebSlaveApplication.class, args);
	}

}
