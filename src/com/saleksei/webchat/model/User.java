package com.saleksei.webchat.model;

import java.util.List;

public class User {
	private int id;
	private String name;
	private String uniqueName;
	private String role;
	private String email;
	private String password;
	private String description;
	private String address;
	private String site;
	private String logoURL;
	private String headerURL;
	private int mediaFilesAmount;
	private int followingAmount;
	private int followersAmount;
	private int likesAmount;
	private int messagesAmount;
	private List<Message> messages;
	private List<MediaLink> mediaLinks;
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
	
	public void setUniqueName(String uniqueName){
		this.uniqueName = uniqueName;
	}
	
	public String getUniqueName(){
		return uniqueName;
	}
	
	public void setRole(String role){
		this.role = role;
	}
	
	public String getRole(){
		return role;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getPassword(){
		return password;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public String getAddress(){
		return address;
	}
	
	public void setSite(String site){
		this.site = site;
	}
	
	public String getSite(){
		return site;
	}
	
	public void setLogoURL(String logoURL){
		this.logoURL = logoURL;
	}
	
	public String getLogoURL(){
		return logoURL;
	}
	
	public void setHeaderURL(String headerURL){
		this.headerURL = headerURL;
	}
	
	public String getHeaderURL(){
		return headerURL;
	}
	
	public void setMediaFilesAmount(int mediaFilesAmount){
		this.mediaFilesAmount = mediaFilesAmount;
	}
	
	public int getMediaFilesAmount(){
		return mediaFilesAmount;
	}
	
	public void setFollowingAmount(int followingAmount){
		this.followingAmount = followingAmount;
	}
	
	public int getFollowingAmount(){
		return followingAmount;
	}
	
	public void setFollowersAmount(int followersAmount){
		this.followersAmount = followersAmount;
	}
	
	public int getFollowersAmount(){
		return followersAmount;
	}
	
	public void setLikesAmount(int likesAmount){
		this.likesAmount = likesAmount;
	}
	
	public int getLikesAmount(){
		return likesAmount;
	}
	
	public void setMessagesAmount(int messagesAmount){
		this.messagesAmount = messagesAmount;
	}
	
	public int getMessagesAmount(){
		return messagesAmount;
	}
	
	public void setMessages(List<Message> messages){
		this.messages = messages;
	}
	
	public List<Message> getMessages(){
		return messages;
	}
	
	public void setMediaLinks(List<MediaLink> mediaLinks){
		this.mediaLinks = mediaLinks;
	}
	
	public List<MediaLink> getMediaLinks(){
		return mediaLinks;
	}
}
