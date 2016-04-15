package com.saleksei.webchat.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/image/*")
public class ImageServlet extends HttpServlet{

	private static final long serialVersionUID = -7709727330060066734L;

	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		
		Properties prop = new Properties();
		InputStream input = null;
		input = AddMessage.class.getClassLoader().getResourceAsStream("application.properties");
		try {
			prop.load(input);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
        String file = request.getPathInfo(); 
        file = file.replaceFirst("/", "");
		
		Path path = Paths.get(prop.getProperty("upload.location") + "/" +file);
		
		try {
			response.getOutputStream().write(Files.readAllBytes(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("image/jpeg");
	}
}
