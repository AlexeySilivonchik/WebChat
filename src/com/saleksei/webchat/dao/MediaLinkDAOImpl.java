package com.saleksei.webchat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.saleksei.webchat.model.MediaLink;

public class MediaLinkDAOImpl extends DAOConnection implements MediaLinkDAO{

	@Override
	public List<MediaLink> getAllMediaLinksByMessageId(int messageId) {
		PreparedStatement prst = null;
		ArrayList<MediaLink> list = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from medialink where fk_message = ?");
			prst.setInt(1, messageId);			
			ResultSet rs = prst.executeQuery();
			
			list = new ArrayList<MediaLink>();

			while(rs.next()){
				MediaLink mediaLink = new MediaLink();
				mediaLink.setId(rs.getInt("id"));
				mediaLink.setLink(rs.getString("link"));
				
				list.add(mediaLink);
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
	public List<MediaLink> getPreviewMediaLinksByUserId(int userId) {
		PreparedStatement prst = null;
		ArrayList<MediaLink> list = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from medialink where fk_user = ? LIMIT 6");
			prst.setInt(1, userId);			
			ResultSet rs = prst.executeQuery();
			
			list = new ArrayList<MediaLink>();

			while(rs.next()){
				MediaLink mediaLink = new MediaLink();
				mediaLink.setId(rs.getInt("id"));
				mediaLink.setLink(rs.getString("link"));
				
				list.add(mediaLink);
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
	public void addMediaLink(MediaLink mediaLink) {
		
		PreparedStatement prst = null;
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("insert into medialink(link, fk_user, fk_message) values (?, ?, ?)");
			prst.setString(1, mediaLink.getLink());
			prst.setInt(2, mediaLink.getUser().getId());
			prst.setInt(3, mediaLink.getMessage().getId());
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
	public MediaLink getMediaLink(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateMediaLink(MediaLink mediaLink) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMediaLink(MediaLink mediaLink) {
		// TODO Auto-generated method stub
		
	}

}
