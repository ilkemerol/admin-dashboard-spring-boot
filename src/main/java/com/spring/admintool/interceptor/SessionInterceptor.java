package com.spring.admintool.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.admintool.annotation.CheckAuthorized;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	private static Logger LOG = LoggerFactory.getLogger(SessionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		Method method =((HandlerMethod) handler).getMethod();
		CheckAuthorized isAuth = AnnotationUtils.findAnnotation(method.getDeclaringClass(), CheckAuthorized.class);
		
		if(isAuth != null) {
			boolean isAdmin = request.isUserInRole("ROLE_ADMIN");
			if(!isAdmin) {
				response.sendRedirect(request.getContextPath() + "/public/login");
				return false;
			}
		}
		return true;
	}
}
