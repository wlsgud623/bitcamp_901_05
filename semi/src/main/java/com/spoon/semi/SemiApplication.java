package com.spoon.semi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.spoon.semi","data.*"})
@MapperScan({"data.*"})
public class SemiApplication {

	public static void main(String[] args) {
		SpringApplication.run(SemiApplication.class, args);
	}

}
