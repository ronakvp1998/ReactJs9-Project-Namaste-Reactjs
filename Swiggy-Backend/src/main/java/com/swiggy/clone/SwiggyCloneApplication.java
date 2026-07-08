package com.swiggy.clone;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

@SpringBootApplication
public class SwiggyCloneApplication {

    public static void main(String[] args) {
        SpringApplication.run(SwiggyCloneApplication.class, args);
    }

}