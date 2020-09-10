package com.bridgelabz.usermanagementsystem.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bridgelabz.usermanagementsystem.config.DBConnection;

public class PermissionsDao {
	
	private static Connection connection = DBConnection.getConnection();
	private static PreparedStatement preparedStatement = null;
	
	public boolean addPermissions(Long userId, int pageId, boolean add, boolean delete, boolean modify, boolean read,
			String creatorUser) {
		String addPermissionQuery = "INSERT INTO `permissions` (`user_id`, `page_id`, `add`, `delete`, `modify`, `read`,"
				+ " `creator_user`) VALUES (?,?,?,?,?,?,?)";
		try {
			preparedStatement = connection.prepareStatement(addPermissionQuery);
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
	
	public List<Boolean> getUserPermissions(Long userId, int pageId) {
		String userPermissionsQuery = "SELECT * FROM permissions WHERE user_id = ? AND page_id = ?";
		List<Boolean> permissionArray = new ArrayList<>();
		try {
			preparedStatement = connection.prepareStatement(userPermissionsQuery);
			preparedStatement.setLong(1, userId);
			preparedStatement.setInt(2, pageId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				permissionArray.add(resultSet.getBoolean(4));
				permissionArray.add(resultSet.getBoolean(5));
				permissionArray.add(resultSet.getBoolean(6));
				permissionArray.add(resultSet.getBoolean(7));
			}
			return permissionArray;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean updatePermissions(Long userId, int pageId, boolean add, boolean delete, boolean modify, boolean read,
			String creatorUser) {
		String updatePermissionQuery = " UPDATE `ums`.`permissions` SET `add` = ?, `delete` = ?, `modify` = ?, `read` = ?, "
				+ "`creator_user` = ? WHERE `user_id` = ? AND `page_id` = ? ";

		try {
			preparedStatement = connection.prepareStatement(updatePermissionQuery);
			preparedStatement.setBoolean(1, add);
			preparedStatement.setBoolean(2, delete);
			preparedStatement.setBoolean(3, modify);
			preparedStatement.setBoolean(4, read);
			preparedStatement.setString(5, creatorUser);
			preparedStatement.setLong(6, userId);
			preparedStatement.setInt(7, pageId);
			return preparedStatement.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
