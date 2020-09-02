package com.bridgelabz.usermanagementsystem.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.Part;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.model.User;

public class UserDao {

	private static Connection connection = DBConnection.getConnection();

	public long checkUserAuthorization(User user) {
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection
					.prepareStatement("SELECT id FROM user_info WHERE user_name=? and password=?");

			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getLong(1);
			}
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return 0;
	}

	public boolean addUser(User user) throws IOException {
		String registerQuery = "INSERT INTO user_info (first_name,middle_name,last_name,dob,gender, email, country,phone_number,alternate_number,address,user_name,password,user_image,role,creator_user) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		InputStream inputStream = null;

		Part filePart = user.getUserImage();
		if (filePart != null) {
			inputStream = filePart.getInputStream();
		}

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

			if (inputStream != null) {
				preparedStatement.setBlob(13, inputStream);
			}

			preparedStatement.setString(14, user.getRole());
			preparedStatement.setString(15, user.getCreatorUser());

			return preparedStatement.executeUpdate() == 1;
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	public Long getUserIdByUserName(String userName) {
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection
					.prepareStatement("SELECT id FROM user_info WHERE user_name ='" + userName + "'");
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return Long.valueOf(resultSet.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addPermissions(Long userId, int pageId, boolean add, boolean delete, boolean modify, boolean read,
			String creatorUser) {
		String addPermissionQuery = "INSERT INTO `permissions` (`user_id`, `page_id`, `add`, `delete`, `modify`, `read`,"
				+ " `creator_user`) VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(addPermissionQuery);
			preparedStatement.setLong(1, userId);
			preparedStatement.setInt(2, pageId);
			preparedStatement.setBoolean(3, add);
			preparedStatement.setBoolean(4, delete);
			preparedStatement.setBoolean(5, modify);
			preparedStatement.setBoolean(6, read);
			preparedStatement.setString(7, creatorUser);
			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean storeUserLoginTime(long userId) {
		String addLoginTime = "INSERT INTO `user_login_history` (`user_id`) VALUES (?)";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(addLoginTime);
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}