package com.bridgelabz.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.model.User;

public class UserDao {
	public boolean registerUser(User user) {
		String registerQuery = "INSERT INTO user_info (first_name,middle_name,last_name,dob,gender, email, country,phone_number,alternate_number,address,user_name,password,role) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection connection = null;
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = null;

			preparedStatement = connection.prepareStatement(registerQuery);
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

			return preparedStatement.executeUpdate() != 0;
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return false;
	}
}
