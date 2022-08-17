package com.younsw.OutStargram.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.younsw.OutStargram.common.FileManagerService;

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	
	// 특정 경로의 파일을 외부에서 접근 가능하도록
	// 그 파일의 접근 경오를 잡아준다
	
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/images/**").addResourceLocations("file://" + FileManagerService.FILE_UPLODE_PATH);
	}

}
