package com.bridgelabz.usermanagementsystem.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.model.User;

public class UserDao {
	
    private static Connection connection = DBConnection.getConnection(); 
	
	public boolean checkUserAuthorization(User user) {
		String userName = user.getUserName();
		String password = user.getPassword();
		
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(
					"select * from user_info where user_name ='" + userName + "' and password='" + password + "'");

			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet.next();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;		
	}
		
	public boolean addUser(User user) {
		String registerQuery = "INSERT INTO user_info (first_name,middle_name,last_name,dob,gender, email, country,phone_number,alternate_number,address,user_name,password,role,creator_user) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(registerQuery);
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getMiddleName());
			preparedStatement.setString(3, user.getLastName());
			preparedStatement.setString(4, user.getDob());
			preparedStatement.setString(5, user.getGender());
			preparedStatement.setString(6, user.getEmail());
			preparedStatement.setString(7, user.getCountry());
			preparedStatement.setString(8, user.getPhoneNumber());
			preparedStatement.setString(9, user.getAlternateNumber());
			preparedStatement.setString(10, user.getAddress());
			preparedStatement.setString(11, user.getUserName());
			preparedStatement.setString(12, user.getPassword());
			preparedStatement.setString(13, user.getRole());
			preparedStatement.setString(14, user.getCreatorUser());
						
			if (preparedStatement.executeUpdate() == 1) {
				
			}			
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	public Long getUserIdByUserName(String userName) {
		System.out.println("getUserId");
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(
					"select id from user_info where user_name ='" + userName + "'");
			ResultSet resultSet = preparedStatement.executeQuery();
			System.out.println(resultSet.getString(1));
			System.out.println(Long.valueOf(resultSet.getString(1)));
			return Long.valueOf(resultSet.getString(1));
		} catch (Exception e)  {
			e.printStackTrace();
		}
		return null;		
	}

	public boolean addPermissions(Long userId, int pageId, boolean add, boolean delete,
			boolean modify, boolean read, String creatorUser) throws ClassNotFoundException, IOException {
		String addPermissionQuery = "insert into `permissions` (`user_id`, `page_id`, `add`, `delete`, `modify`, `read`, `creator_user`) values (?,?,?,?,?,?,?)";
		System.out.println("dao");
        try {
        	PreparedStatement preparedStatement = connection.prepareStatement(addPermissionQuery);
            preparedStatement.setString(1, String.valueOf(userId));
            preparedStatement.setString(2, String.valueOf(pageId));
            preparedStatement.setString(3, String.valueOf(add));
            preparedStatement.setString(4, String.valueOf(delete));
            preparedStatement.setString(5, String.valueOf(modify));
            preparedStatement.setString(6, String.valueOf(read));
            preparedStatement.setString(7, creatorUser);
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;		
	}
}