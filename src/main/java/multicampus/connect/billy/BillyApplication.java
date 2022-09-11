package multicampus.connect.billy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@MapperScan(basePackages = "member")
@ComponentScan(basePackages = "member")
@ComponentScan
@SpringBootApplication
public class BillyApplication {

	public static void main(String[] args) {
		SpringApplication.run(BillyApplication.class, args);
	}

}
