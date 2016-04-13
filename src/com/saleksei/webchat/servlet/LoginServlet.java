package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saleksei.webchat.model.UserType;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 262167633020464701L;

	private final String userID = "saleksei";
	private final String password = "password";
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		
		System.out.println(request.getRequestURL());
		
		if(userID.equals(user) && password.equals(pwd)){
			HttpSession session = request.getSession();
			session.setAttribute("user", userID);
			session.setAttribute("userType", UserType.USER);
			session.setMaxInactiveInterval(30*60);

			try {
				response.sendRedirect(request.getContextPath() + "/");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			try {
				response.sendRedirect(request.getContextPath() + "/error.html");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
