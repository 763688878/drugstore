package com.java;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class DrugstoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(DrugstoreApplication.class, args);
    }

}