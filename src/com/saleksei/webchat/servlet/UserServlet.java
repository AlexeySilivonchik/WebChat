package com.saleksei.webchat.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.dao.MediaLinkDAOImpl;
import com.saleksei.webchat.dao.UserDAOImpl;
import com.saleksei.webchat.model.MediaLink;
import com.saleksei.webchat.model.User;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet{

	private static final long serialVersionUID = -8849880271415717291L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");		
		
		System.out.println(request.getServletPath());
		
		System.out.println(request.getPathInfo());
		String[] pathInfo = request.getPathInfo().split("/");
        String uniqueName = pathInfo[1]; 
        System.out.println(uniqueName);
		
		try {			
			UserDAOImpl dao = new UserDAOImpl();
			User user = dao.getUserByUniqueName(uniqueName);
			

			System.out.println(user.getHeaderURL());
			
			MediaLinkDAOImpl mediaDAO = new MediaLinkDAOImpl();			
			List<MediaLink> mediaList = mediaDAO.getPreviewMediaLinksByUserId(user.getId());
			
			List<User> followingUsers = dao.getPreviewFollowingUsers(user.getId());
			
			request.setAttribute("user", user);
			request.setAttribute("mediaList", mediaList);
			request.setAttribute("followingUsers", followingUsers);
			request.setCharacterEncoding("UTF-8");
			request.getRequestDispatcher("/jsp/user.jsp").forward(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

}
