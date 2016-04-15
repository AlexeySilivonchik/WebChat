package com.saleksei.webchat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saleksei.webchat.action.Action;
import com.saleksei.webchat.action.ActionFactory;

@WebServlet("")
public class MainServlet extends HttpServlet{

	private static final long serialVersionUID = 1285880570691421227L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		
		System.out.println(request.getServletPath());		
		
		try {
			
			Action action = ActionFactory.getAction(request);
		    String view = action.execute(request, response); 
		     
		    System.out.println("action: " + action);  
		    System.out.println("view: " + view);

		    if (request.getMethod().equals("GET")) {
		       request.getRequestDispatcher(view).forward(request, response); 
		    }
		    else {
		       response.sendRedirect(view);  
		    }
			
			/*HttpSession session = request.getSession();			
			System.out.println(session);
			
			UserType userType = (UserType) session.getAttribute("userType");

			if(userType == UserType.USER){
				String userName = (String) session.getAttribute("user");
				request.getRequestDispatcher("/reguser/" + userName).forward(request, response);
			} else{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}*/
			
		}  catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
}
