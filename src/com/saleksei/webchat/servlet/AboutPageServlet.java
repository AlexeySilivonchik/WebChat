package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/about")
public class AboutPageServlet extends HttpServlet{

	private static final long serialVersionUID = 1055810464044119844L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		
		try {
			request.getRequestDispatcher("/about.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
