package com.saleksei.webchat.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.saleksei.webchat.dao.MediaLinkDAOImpl;
import com.saleksei.webchat.dao.MessageDAOImpl;
import com.saleksei.webchat.model.MediaLink;
import com.saleksei.webchat.model.Message;
import com.saleksei.webchat.model.User;


@WebServlet("/user/addMessage")
@MultipartConfig
public class AddMessage extends HttpServlet{
	private static final long serialVersionUID = -8849880271415717291L;
	
	@Override
	public void init(){
		
		try {
			Properties prop = new Properties();
			InputStream input = null;
			input = AddMessage.class.getClassLoader().getResourceAsStream("application.properties");
			prop.load(input);
			
			File rootDir = new File(prop.getProperty("upload.location"));
			if(!rootDir.exists()){
				System.out.println(rootDir.mkdirs());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html");		
		
		try {			
			request.setCharacterEncoding("UTF-8");				
			
			String text = request.getParameter("addMessageInput");
			int userId = Integer.parseInt(request.getParameter("userId"));
			String  userUniqueName = request.getParameter("userUniqueName");
			
			System.out.println(text);
			
			User user = new User();
			user.setId(userId);			
			
			Message message = new Message();
			message.setUser(user);
			message.setText(text);
			
			MessageDAOImpl messageDAO = new MessageDAOImpl();
			message = messageDAO.addMessage(message);	
			

			Part filePart = request.getPart("file");						
					
			if (filePart.getSize() > 0) {
				Properties prop = new Properties();
				InputStream input = null;
				input = AddMessage.class.getClassLoader().getResourceAsStream("application.properties");
				prop.load(input);		
				
				String directory = prop.getProperty("upload.location") + "/" + request.getParameter("userUniqueName");
				File rootDir = new File(directory);
				if (!rootDir.exists()) {
					System.out.println(rootDir.mkdirs());
				}

				String fileName = getSubmittedFileName(filePart);
				File file = new File(rootDir, fileName);

				input = filePart.getInputStream();
				Files.copy(input, file.toPath());
				

				MediaLink mediaLink = new MediaLink();
				mediaLink.setLink(userUniqueName + "/" + fileName);
				mediaLink.setMessage(message);
				mediaLink.setUser(user);
				
				MediaLinkDAOImpl mediaLinkDAO = new MediaLinkDAOImpl();
				mediaLinkDAO.addMediaLink(mediaLink);
			}

			response.sendRedirect(request.getContextPath() + "/reguser/" + userUniqueName);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}
	
	private static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}
}
