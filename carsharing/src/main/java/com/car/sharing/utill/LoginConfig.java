package com.car.sharing.utill;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootConfiguration
public class LoginConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/*")
		.excludePathPatterns("/test", "/login", "/logincheck", "/policy", "/idcheck", "/phonecheck", "/licensecheck", "/joinuser", 
				"/signup", "/css/**", "/js/**");
	}
}
