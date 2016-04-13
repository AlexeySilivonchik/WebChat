package com.saleksei.webchat.model;

public class MediaLink {
	private int id;
	private String link;
	private User user;
	private Message message;
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setLink(String link){
		this.link = link;
	}
	
	public String getLink(){
		return link;
	}
	
	public void setUser(User user){
		this.user = user;
	}
	
	public User getUser(){
		return user;
	}
	
	public void setMessage(Message message){
		this.message = message;
	}
	
	public Message getMessage(){
		return message;
	}

}
