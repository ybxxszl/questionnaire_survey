package com.tool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.biz.UserBiz;
import com.vo.User;

public class HandlerControl implements HandlerInterceptor {

	@Autowired
	private UserBiz userBiz;
	
	/**
	 * Controller已执行，视图已返回
	 * 记录日志
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * Controller已执行，视图未返回
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object object, ModelAndView mv) throws Exception {
		// TODO Auto-generated method stub
		
	}

	/**
	 * Controller未执行，视图未返回
	 * 自动登录
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("迟来的自动登录preHandle。。。");
		
		String account = null;
		String password = null;
		if(request.getRequestURI().indexOf("login.jsp") > 0){//判断路径：若为登录路径，则不执行自动登录
			return true;
		} else if(request.getSession().getAttribute("user_session") != null) {//判断session中是否有user
			return true;
		} else {
			Cookie [] cookies = request.getCookies();//判断cookie中是否有account和password
			if(cookies != null) {
				for (Cookie cookie : cookies) {
					String name = cookie.getName();
					if(name.equals("account")) {
						account = cookie.getValue();
					}
					if(name.equals("password")) {
						password = cookie.getValue();
					}
				}
			}
			if(account != null && password != null) {//若有account和password
				User u = userBiz.loginUser(new User(account, password));//执行登录
				request.getSession().setAttribute("user_session", u);//存入session
				return true;
			}
		}
		return false;
	}

}
