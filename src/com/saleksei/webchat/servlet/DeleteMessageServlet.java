package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.dao.MessageDAOImpl;

@WebServlet("/user/deleteMessage")
public class DeleteMessageServlet extends HttpServlet{

	private static final long serialVersionUID = 7385180757035400494L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");		
		
		try {			

			System.out.println(request.getParameter("messageId"));
			System.out.println(request.getParameter("uniqueName"));

			int messageId = Integer.parseInt(request.getParameter("messageId"));
			
			MessageDAOImpl messageDAO = new MessageDAOImpl();
			messageDAO.deleteMessage(messageId);
			
			String userUniqueName = request.getParameter("user");

			request.setCharacterEncoding("UTF-8");
			response.sendRedirect(request.getContextPath() + "/reguser/" + userUniqueName);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
