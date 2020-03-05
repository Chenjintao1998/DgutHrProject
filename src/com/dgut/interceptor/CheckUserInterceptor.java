package com.dgut.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CheckUserInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
        if(session.getAttribute("reuser")!=null) {
			if("1".equals(session.getAttribute("reuser"))) {
				return true;
			}
		}
		if(session.getAttribute("user")!=null) {
			session.setAttribute("reuser", "1");
			System.out.println("合法登录");
			return true;
		}else {
			System.out.println("拦截一个非法登录");
			response.sendRedirect(request.getContextPath()+"/index");
			return false;
		}
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mv)
			throws Exception {
		// TODO Auto-generated method stub

	}

	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	
	
}
