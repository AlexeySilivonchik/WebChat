package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.dao.MessageDAOImpl;
import com.saleksei.webchat.model.Message;
import com.saleksei.webchat.model.User;


@WebServlet("/user/addMessage")
public class AddMessage extends HttpServlet{
	private static final long serialVersionUID = -8849880271415717291L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");		
		
		try {			

			System.out.println(request.getParameter("addMessageInput"));
			System.out.println(request.getParameter("userId"));
			System.out.println(request.getParameter("userUniqueName"));
			
			String text = request.getParameter("addMessageInput");
			int userId = Integer.parseInt(request.getParameter("userId"));
			String  userUniqueName = request.getParameter("userUniqueName");
			
			User user = new User();
			user.setId(userId);			
			
			Message message = new Message();
			message.setUser(user);
			message.setText(text);
			
			MessageDAOImpl messageDAO = new MessageDAOImpl();
			messageDAO.addMessage(message);

			request.setCharacterEncoding("UTF-8");
			response.sendRedirect(request.getContextPath() + "/reguser/" + userUniqueName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
