package com.saleksei.webchat.dao;

import java.util.List;

import com.saleksei.webchat.model.User;

public interface UserDAO{
	
	public List<User> getAllUsers();
	public List<User> getPreviewFollowingUsers(int userId);
	public User getUser(int id);
	public User getUserByUniqueName(String name);
	public void updateUser(User user);
	public void deleteUser(User user);
}
