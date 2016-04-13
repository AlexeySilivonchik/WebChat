package com.saleksei.webchat.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class ActionFactory {
	
	private static final HashMap<String, Action> actions;
	
	static{
		actions = new HashMap<String, Action>();
		
		actions.put("GET", new HomePageAction());
		actions.put("GET/user", new UserPageAction());
		actions.put("GET/about", new AboutPageAction());
	}	
	
	public static Action getAction(HttpServletRequest request){		
		
		System.out.println("ActionFactory: " + request.getMethod() + request.getServletPath());
		System.out.println("actions.get: " + actions.get(request.getMethod() + request.getServletPath()));
		return actions.get(request.getMethod() + request.getServletPath());
	}

}
