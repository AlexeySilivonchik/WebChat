package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.saleksei.webchat.dao.UserDAOImpl;
import com.saleksei.webchat.model.User;
import com.saleksei.webchat.model.UserType;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 262167633020464701L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("user");
		String password = request.getParameter("pwd");		
		
		if(name == null || password == null){
			try {
				response.sendRedirect(request.getContextPath() + "/");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		UserDAOImpl userDAO = new UserDAOImpl();
		User user = userDAO.getUserByUniqueName(name);
		
		if(user != null ? BCrypt.checkpw(password, user.getPassword()) : false){			
			HttpSession session = request.getSession();
			session.setAttribute("user", name);
			session.setAttribute("userType", UserType.USER);
			session.setMaxInactiveInterval(30*60);

			try {
				response.sendRedirect(request.getContextPath() + "/");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			try {
				response.sendRedirect(request.getContextPath() + "/");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
