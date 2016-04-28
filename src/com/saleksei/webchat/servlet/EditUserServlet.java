package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.dao.UserDAOImpl;
import com.saleksei.webchat.model.User;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet{

	private static final long serialVersionUID = 6841584122636782414L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		String userId = request.getParameter("userId");
		String userUniqueName = request.getParameter("userUniqueName");
		String userName = request.getParameter("userEditName");
		String userDescription = request.getParameter("userEditDescription");
		String userAddress = request.getParameter("userEditAddress");
		String userSite = request.getParameter("userEditSite");
		
		
		System.out.println(userId + "," + userName + "," + userDescription + "," + userAddress + "," + userSite + "," + userUniqueName);
		
		int iuserId = Integer.parseInt(userId);
		
		UserDAOImpl userDAO = new UserDAOImpl();
		User user = userDAO.getUser(iuserId);
		
		user.setName(userName);
		user.setDescription(userDescription);
		user.setAddress(userAddress);
		user.setSite(userSite);
		
		userDAO.updateUser(user);
		
		try {
			response.sendRedirect(request.getContextPath() + "/user/" + userUniqueName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
