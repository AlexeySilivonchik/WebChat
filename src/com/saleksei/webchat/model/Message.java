package com.saleksei.webchat.model;

import java.util.Date;
import java.util.List;

public class Message {	
	private int id;
	private String text;
	private User user;
	private int likes;
	private int retweets;
	private Date createDate;
	private List<MediaLink> mediaLinks;
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setText(String text){
		this.text = text;
	}
	
	public String getText(){
		return text;
	}
	
	public void setUser(User user){
		this.user = user;
	}
	
	public User getUser(){
		return user;
	}
	
	public void setLikes(int likes){
		this.likes = likes;
	}
	
	public int getLikes(){
		return likes;
	}
	
	public void setRetweets(int retweets){
		this.retweets = retweets;
	}
	
	public int getRetweets(){
		return retweets;
	}
	
	public void setCreateDate(Date createDate){
		this.createDate = createDate;
	}
	
	public Date getCreateDate(){
		return createDate;
	}
	
	public void setMediaLinks(List<MediaLink> mediaLinks){
		this.mediaLinks = mediaLinks;
	}
	
	public List<MediaLink> getMediaLinks(){
		return mediaLinks;
	}
}
