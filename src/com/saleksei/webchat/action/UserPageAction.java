package com.saleksei.webchat.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.dao.MediaLinkDAOImpl;
import com.saleksei.webchat.dao.UserDAOImpl;
import com.saleksei.webchat.model.MediaLink;
import com.saleksei.webchat.model.User;

public class UserPageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html");		

		String[] pathInfo = request.getPathInfo().split("/");
        String uniqueName = pathInfo[1]; 
		
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
						
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		String view = "/user.jsp";
		return view;
	}

}
