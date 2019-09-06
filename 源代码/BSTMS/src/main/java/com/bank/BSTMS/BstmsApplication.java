package com.bank.BSTMS;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan(basePackages = {"com.bank.BSTMS"})
@SpringBootApplication
public class BstmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BstmsApplication.class, args);
	}

}
