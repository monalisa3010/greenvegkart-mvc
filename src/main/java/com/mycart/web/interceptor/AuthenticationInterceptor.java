package com.mycart.web.interceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mycart.web.model.UserDetails;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	String[] allowedURLArray = new String[] { "/mykart-web/", "/mykart-web/login","/mykart-web/logout", "/mykart-web/registerCustomer",
			"/mykart-web/unauth","/mykart-web/static/**","/mykart-web/userregistration/**"};

	List<String> allowedURIList = Arrays.asList(allowedURLArray);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println(" Pre handle :  " + request.getRequestURI());

		// Avoid a redirect loop for some urls
		if (!allowedURIList.contains(request.getRequestURI())) {
			UserDetails userData = (UserDetails) request.getSession().getAttribute("userDetails");
			if (userData == null) {
				System.out.println(" redirect to:-- "+ request.getContextPath() + "/unauth");
				response.sendRedirect(request.getContextPath() + "/unauth");
				return false;
			}
		}
		return true;
	}

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		if(null!=request.getHeader("Referer") && request.getHeader("Referer").contains(request.getContextPath()+"/checkout")) {
//			//response.sendRedirect(request.getContextPath() + "/checkout");
//			RequestDispatcher dd = request.getRequestDispatcher(request.getContextPath()+"/checkout");
//			dd.forward(request, response);
//		}
//		super.postHandle(request, response, handler, modelAndView);
//	}
	
	
}
