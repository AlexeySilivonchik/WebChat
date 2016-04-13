package com.saleksei.webchat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.saleksei.webchat.model.Message;

public class MessageDAOImpl extends DAOConnection implements MessageDAO{
	
	private MediaLinkDAOImpl mediaLinkDAO;
	
	public MessageDAOImpl(){
		mediaLinkDAO = new MediaLinkDAOImpl();
	}

	@Override
	public List<Message> getAllMessagesByUserId(int userId) {
		PreparedStatement prst = null;
		ArrayList<Message> list = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from message where fk_user = ?");
			prst.setInt(1, userId);			
			ResultSet rs = prst.executeQuery();
			
			list = new ArrayList<Message>();

			while(rs.next()){
				Message message = new Message();
				message.setId(rs.getInt("id"));
				message.setText(rs.getString("text"));
				message.setLikes(rs.getInt("likes"));
				message.setRetweets(rs.getInt("retweets"));
				
				Timestamp createTimestamp = rs.getTimestamp("createDate");
				Date createDate = createTimestamp;
				
				message.setCreateDate(createDate);				
				message.setMediaLinks(mediaLinkDAO.getAllMediaLinksByMessageId(message.getId()));
				
				list.add(message);
			}						
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
		return list;
	}

	@Override
	public Message getMessage(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void addMessage(Message message) {
		PreparedStatement prst = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("insert into message(text, fk_user, likes, retweets, createDate) values (?, ?, 0, 0, ?);");
			
			TimeZone.setDefault(TimeZone.getTimeZone("UTC+3:00"));
			TimeZone timezone = TimeZone.getTimeZone("UTC+3:00");
			Calendar calendar = Calendar.getInstance(timezone);
			Date date = calendar.getTime();
			Timestamp currentTimestamp = new Timestamp(date.getTime());
			
			prst.setString(1, message.getText());
			prst.setInt(2, message.getUser().getId());
			prst.setTimestamp(3, currentTimestamp);
			prst.executeUpdate();					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
		
	}

	@Override
	public void updateMessage(Message message) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMessage(int id) {

		PreparedStatement prst = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("delete from message where message.id = ?");

			prst.setInt(1, id);
			prst.executeUpdate();					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}	
		
	}

}
