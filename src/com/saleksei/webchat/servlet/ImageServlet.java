package com.saleksei.webchat.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/image/*")
public class ImageServlet extends HttpServlet{

	private static final long serialVersionUID = -7709727330060066734L;

	@Override 
	protected void doGet(HttpServletRequest request, HttpServletResponse response){
		
        String file = request.getPathInfo(); 
        file = file.replaceFirst("/", "");
        System.out.println(file);
		
		System.out.println("imageServlet: " + request.getContextPath());
		
		Path path = Paths.get(file);
		
		try {
			response.getOutputStream().write(Files.readAllBytes(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		response.setContentType("image/jpeg");
	}
}
