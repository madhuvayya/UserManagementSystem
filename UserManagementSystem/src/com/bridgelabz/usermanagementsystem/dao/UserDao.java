package com.bridgelabz.usermanagementsystem.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.model.User;

public class UserDao {

	private static Connection connection = DBConnection.getConnection();
	private static PreparedStatement preparedStatement = null;

	public long checkUserAuthorization(User user) {
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

	public boolean storeUserLoginTime(long userId) {
		String addLoginTime = "INSERT INTO `user_login_history` (`user_id`) VALUES (?)";
		try {
			preparedStatement = connection.prepareStatement(addLoginTime);
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public String getUserLastLoginTime(long userId) {
		String getLastLogin = "SELECT MAX(login_timestamp) FROM user_login_history WHERE user_id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getLastLogin);
			preparedStatement.setLong(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return resultSet.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addUser(User user) throws IOException, MySQLIntegrityConstraintViolationException {
		String registerQuery = "INSERT INTO user_info (first_name,middle_name,last_name,dob,gender, email, country,phone_number,alternate_number,address,user_name,password,user_image,role,creator_user) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

		try {
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
			preparedStatement.setBlob(13, user.getUserUploadingImage());
			preparedStatement.setString(14, user.getRole());
			preparedStatement.setString(15, user.getCreatorUser());

			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException ex) {
			throw new MySQLIntegrityConstraintViolationException(ex.getMessage());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	public Long getUserIdByUserName(String userName) {
		try {
			preparedStatement = connection.prepareStatement("SELECT id FROM user_info WHERE user_name = ? ");
			preparedStatement.setString(1, userName);
			ResultSet resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return Long.valueOf(resultSet.getString(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<User> getUsersList() throws IOException {
		try {
			preparedStatement = connection.prepareStatement(
					"SELECT user_image,first_name,last_name,email,dob,status,role,id FROM ums.user_info;");
			ResultSet resultSet = preparedStatement.executeQuery();
			List<User> usersList = new ArrayList<User>();
			while (resultSet.next()) {
				User user = new User();

				Blob blob = resultSet.getBlob(1);
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String image = Base64.getEncoder().encodeToString(imageBytes);
				inputStream.close();
				outputStream.close();

				user.setUserDiplayingImage(image);
				user.setFirstName(resultSet.getString(2));
				user.setLastName(resultSet.getString(3));
				user.setEmail(resultSet.getString(4));
				user.setDob(resultSet.getString(5));
				user.setStatus(resultSet.getString(6));
				user.setRole(resultSet.getString(7));
				user.setUserId(resultSet.getLong(8));
				usersList.add(user);
			}
			return usersList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean deleteUser(Long userId) {
		String deleteUserQuery = "DELETE FROM user_info WHERE id = ?";
		try {
			preparedStatement = connection.prepareStatement(deleteUserQuery);
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public User getUserDetails(Long userId) {
		String userGeneralDetailsQuery = "SELECT * FROM `ums`.`user_info` WHERE id = ?";
		try {
			preparedStatement = connection.prepareStatement(userGeneralDetailsQuery);
			preparedStatement.setLong(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setUserId(userId);
				user.setFirstName(resultSet.getString(2));
				user.setMiddleName(resultSet.getString(3));
				user.setLastName(resultSet.getString(4));
				user.setDob(resultSet.getString(5));
				user.setGender(resultSet.getString(6));
				user.setEmail(resultSet.getString(7));
				user.setCountry(resultSet.getString(8));
				user.setPhoneNumber(resultSet.getString(9));
				user.setAlternateNumber(resultSet.getString(10));
				user.setAddress(resultSet.getString(11));
				user.setUserName(resultSet.getString(12));
				user.setPassword(resultSet.getString(13));

				Blob blob = resultSet.getBlob(14);
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				String image = null;

				try {
					while ((bytesRead = inputStream.read(buffer)) != -1) {
						outputStream.write(buffer, 0, bytesRead);
					}
					byte[] imageBytes = outputStream.toByteArray();
					image = Base64.getEncoder().encodeToString(imageBytes);
					inputStream.close();
					outputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

				user.setUserDiplayingImage(image);
				user.setRole(resultSet.getString(15));
				user.setStatus(resultSet.getString(16));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateUserGeneralDetails(long userId, User user) throws MySQLIntegrityConstraintViolationException {
		String updateQuery = "UPDATE user_info SET `first_name` = ?, `middle_name` = ?, `last_name` = ?,`dob` = ?, `gender` = ?, `email` = ?, "
				+ "`country` = ?,`phone_number` = ?, `alternate_number` = ?, `address` = ?, `user_name` = ?, `password` = ?, `user_image` = ?, `role` = ?, `status` = ?,`creator_user` = ? WHERE `id` = ?";
		try {
			preparedStatement = connection.prepareStatement(updateQuery);
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
			preparedStatement.setBlob(13, user.getUserUploadingImage());
			preparedStatement.setString(14, user.getRole());
			preparedStatement.setString(15, user.getStatus());
			preparedStatement.setString(16, user.getCreatorUser());
			preparedStatement.setLong(17, userId);

			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException ex) {
			throw new MySQLIntegrityConstraintViolationException(ex.getMessage());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	public List<String> getUserLoginHistory(long userId) {
		String updatePermissionQuery = "SELECT login_timestamp FROM ums.user_login_history WHERE user_id = ?";		
		List<String> loginHistory = new  ArrayList<String>(); 
		try {
			preparedStatement = connection.prepareStatement(updatePermissionQuery);
			preparedStatement.setLong(1, userId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				loginHistory.add(resultSet.getString(1));
			}
			return loginHistory;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}