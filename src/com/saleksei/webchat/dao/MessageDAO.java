package com.saleksei.webchat.dao;

import java.util.List;

import com.saleksei.webchat.model.Message;

public interface MessageDAO {
	public List<Message> getAllMessagesByUserId(int userId);
	public Message getMessage(int id);
	public Message addMessage(Message message);
	public void updateMessage(Message message);
	public void deleteMessage(int id);
}
