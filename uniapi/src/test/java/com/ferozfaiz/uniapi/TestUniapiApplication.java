package com.ferozfaiz.uniapi;

import org.springframework.boot.SpringApplication;

public class TestUniapiApplication {

	public static void main(String[] args) {
		SpringApplication.from(UniapiApplication::main).with(TestcontainersConfiguration.class).run(args);
	}

}
