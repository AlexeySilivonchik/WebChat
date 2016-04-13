package com.saleksei.webchat.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saleksei.webchat.model.UserType;

public class HomePageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();			
		System.out.println(session);
			
		UserType userType = (UserType) session.getAttribute("userType");

		String view = null;
		if(userType == UserType.USER){
			String userName = (String) session.getAttribute("user");
			view = "/reguser/" + userName;
		} else{
			view = "/jsp/index.jsp"; 
		}
			
		return view;
	}

}
