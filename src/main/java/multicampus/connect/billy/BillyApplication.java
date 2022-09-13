package multicampus.connect.billy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@MapperScan(basePackages = "multicampus/connect/billy/member")
@ComponentScan(basePackages = "multicampus/connect/billy/member")
@ComponentScan
@SpringBootApplication
public class BillyApplication {

	public static void main(String[] args) {
		SpringApplication.run(BillyApplication.class, args);
	}

}
