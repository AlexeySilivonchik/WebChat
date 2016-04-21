package com.saleksei.webchat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.saleksei.webchat.model.User;

public class UserDAOImpl extends DAOConnection implements UserDAO{
	
	private MessageDAOImpl messageDAO;
	
	public UserDAOImpl(){
		messageDAO = new MessageDAOImpl();
	}

	@Override
	public List<User> getAllUsers() {		
		Statement st = null;
		ArrayList<User> list = null;	
		Connection connection = null;
		
		try {			
			connection = establishConnection(connection);
			st = connection.createStatement();
			ResultSet rs = st.executeQuery("Select * from user");
			
			list = new ArrayList<User>();
			while(rs.next()){
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setUniqueName(rs.getString("uniqueName"));
				user.setDescription(rs.getString("description"));
				user.setAddress(rs.getString("address"));
				user.setSite(rs.getString("site"));
				
				list.add(user);
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
	public List<User> getPreviewFollowingUsers(int userId) {
		PreparedStatement prst = null;
		ArrayList<User> list = null;
		Connection connection = null;
		
		User user = null;
		
		try {			
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from following where fkUser = ?");
			prst.setInt(1, userId);			
			ResultSet rs = prst.executeQuery();
			
			list = new ArrayList<User>();

			while(rs.next()){				
				user = getUser(rs.getInt("fkFollowingUser"));				
				list.add(user);
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
	public User getUser(int id) {
		PreparedStatement prst = null;		
		User user = null;
		Connection connection = null;
		
		try {
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from user where id = ?");
			prst.setInt(1, id);
			
			ResultSet rs = prst.executeQuery();

			if(rs.next()){
				user = new User();		
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));		
				user.setUniqueName(rs.getString("uniqueName"));
				user.setRole(rs.getString("role"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				
				user.setDescription(rs.getString("description"));
				user.setAddress(rs.getString("address"));
				user.setSite(rs.getString("site"));
				user.setMediaFilesAmount(rs.getInt("mediaFilesAmount"));
				user.setLogoURL(rs.getString("logoURL"));
				user.setHeaderURL(rs.getString("headerURL"));
				user.setFollowingAmount(rs.getInt("followingAmount"));
				user.setFollowersAmount(rs.getInt("followersAmount"));
				user.setLikesAmount(rs.getInt("likesAmount"));
				user.setMessagesAmount(rs.getInt("messagesAmount"));
				
				user.setMessages(messageDAO.getAllMessagesByUserId(user.getId()));				
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
		
		return user;
	}
	

	@Override
	public void addUser(User user) {
		PreparedStatement prst = null;		
		Connection connection = null;
		
		try {
			connection = establishConnection(connection);
			prst = connection.prepareStatement("insert into user(uniqueName, role, password, email) "
					+ "values (?, ?, ?, ?)");
			prst.setString(1, user.getUniqueName());
			prst.setString(2, user.getRole());
			prst.setString(3, user.getPassword());
			prst.setString(4, user.getEmail());
			
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
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User getUserByUniqueName(String name) {
		PreparedStatement prst = null;
		Connection connection = null;
		
		User user = null;
		
		try {
			connection = establishConnection(connection);
			prst = connection.prepareStatement("Select * from user where uniqueName = ?");
			prst.setString(1, name);
			
			ResultSet rs = prst.executeQuery();

			if(rs.next()){
				user = new User();		
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));		
				user.setUniqueName(rs.getString("uniqueName"));
				user.setRole(rs.getString("role"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				
				user.setDescription(rs.getString("description"));
				user.setAddress(rs.getString("address"));
				user.setSite(rs.getString("site"));
				user.setMediaFilesAmount(rs.getInt("mediaFilesAmount"));
				user.setLogoURL(rs.getString("logoURL"));
				user.setHeaderURL(rs.getString("headerURL"));
				user.setFollowingAmount(rs.getInt("followingAmount"));
				user.setFollowersAmount(rs.getInt("followersAmount"));
				user.setLikesAmount(rs.getInt("likesAmount"));
				user.setMessagesAmount(rs.getInt("messagesAmount"));
				
				user.setMessages(messageDAO.getAllMessagesByUserId(user.getId()));
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
		
		return user;
	}

}
