package com.saleksei.webchat.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.saleksei.webchat.model.UserType;

public class SecurityRoleFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest paramServletRequest, ServletResponse paramServletResponse, FilterChain paramFilterChain) throws IOException,
			ServletException {
		HttpServletRequest request = (HttpServletRequest) paramServletRequest;
		HttpSession session = request.getSession();
		
		if(session != null){			
			UserType type = (UserType) session.getAttribute("userType");
			if(type == null){
				type = UserType.GUEST;
				session.setAttribute("userType", type);
			}
		}
		
		
		paramFilterChain.doFilter(paramServletRequest, paramServletResponse);
	}

	@Override
	public void init(FilterConfig paramFilterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
