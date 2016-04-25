package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.saleksei.webchat.dao.UserDAOImpl;
import com.saleksei.webchat.model.User;
import com.saleksei.webchat.model.UserType;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			request.getRequestDispatcher("/jsp/signup.jsp").forward(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("registerInputName");
		String email = request.getParameter("registerInputEmail");
		String password = request.getParameter("registerInputPassword");
		
		System.out.println(name + ", " + email + ", " + password);
		
		if(name.equals("") || email.equals("") || password.equals("")){
			
			HttpSession session = request.getSession();
			session.setAttribute("signupName", name);
			session.setAttribute("signupEmail", email);
			session.setAttribute("signupPassword", password);
			
			try {
				response.sendRedirect(request.getContextPath() + "/signup");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			UserDAOImpl userDAO = new UserDAOImpl();
			User user = userDAO.getUserByUniqueName(name);
			
			String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
			if(user == null){
				user = new User();
				user.setUniqueName(name);
				user.setEmail(email);
				user.setPassword(hashedPassword);
				user.setRole(UserType.USER.toString());		
				
				userDAO.addUser(user);
				
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

}
