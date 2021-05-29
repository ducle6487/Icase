package edu.hutech.Icase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import edu.hutech.Icase.Model.Case;
import edu.hutech.Icase.Model.Device;

@SpringBootApplication
public class IcaseApplication implements CommandLineRunner {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public static void main(String[] args) {
		SpringApplication.run(IcaseApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
	}

}
