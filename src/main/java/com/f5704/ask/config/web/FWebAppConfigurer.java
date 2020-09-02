package com.f5704.ask.config.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.f5704.ask.web.handler.converter.StringToProjects;
import com.f5704.ask.web.handler.converter.StringToUsers;
import com.f5704.ask.web.interceptor.UserInterceptorHandler;

@Configuration
public class FWebAppConfigurer 
        extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 多个拦截器组成一个拦截器链
        // addPathPatterns 用于添加拦截规则
        // excludePathPatterns 用户排除拦截
        registry.addInterceptor(new UserInterceptorHandler()).addPathPatterns("/**").excludePathPatterns("/login").excludePathPatterns("/im/**");
        super.addInterceptors(registry);
    }
    
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(new StringToUsers());
        registry.addConverter(new StringToProjects());
        super.addFormatters(registry);
    }
}