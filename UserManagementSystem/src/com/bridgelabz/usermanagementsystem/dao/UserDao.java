package com.bridgelabz.usermanagementsystem.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.model.Country;
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
		String addLoginTime = "INSERT INTO `user_log_history` (`user_id`) VALUES (?)";
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
		String getLastLogin = "SELECT MAX(login_timestamp) FROM user_log_history WHERE user_id = ?";
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

	public boolean addUser(User user) throws IOException, SQLIntegrityConstraintViolationException {
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
			ex.printStackTrace();
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
					"SELECT user_image,first_name,last_name,email,dob,status,role,id,DATE_FORMAT(creator_stamp, \"%b %e %Y %r\") FROM ums.user_info;");
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
				user.setCreatorStamp(resultSet.getString(9));
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

	public boolean updateUserGeneralDetails(long userId, User user) {
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
			ex.printStackTrace();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return false;
	}

	public List<String> getUserLoginHistory(long userId) {
		String updatePermissionQuery = "SELECT DATE_FORMAT(login_timestamp, \"%b %e %Y %r\") FROM ums.user_log_history WHERE user_id = ?";
		List<String> loginHistory = new ArrayList<String>();
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

	public List<Integer> getUsersCount() {
		String totalUsersQuery = "SELECT count(*) FROM ums.user_info";
		String numberOfActiveUsersQuery = "SELECT count(*) FROM ums.user_info WHERE status = 'active'";
		String numberOfInActiveUsersQuery = "SELECT count(*) FROM ums.user_info WHERE status = 'inactive'";
		String numberOfUsersOnline = "SELECT count(*) FROM ums.user_log_history WHERE logout_timestamp is NULL";
		List<Integer> usersCounter = new ArrayList<Integer>();
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(totalUsersQuery);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				usersCounter.add(Integer.parseInt(resultSet.getString(1)));
				resultSet = null;
			}
			preparedStatement = connection.prepareStatement(numberOfActiveUsersQuery);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				usersCounter.add(Integer.parseInt(resultSet.getString(1)));
				resultSet = null;
			}
			preparedStatement = connection.prepareStatement(numberOfInActiveUsersQuery);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				usersCounter.add(Integer.parseInt(resultSet.getString(1)));
				resultSet = null;
			}
			preparedStatement = connection.prepareStatement(numberOfUsersOnline);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				usersCounter.add(Integer.parseInt(resultSet.getString(1)));
				resultSet = null;
			}
			return usersCounter;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Country> numberOfUsersByCountry() {
		String numberOfUsersByCountryQuery = "select count(*), country from ums.user_info group by country order by count(*) desc;";
		List<Country> numberOfUsersByCountryList = new ArrayList<Country>();
		try {
			preparedStatement = connection.prepareStatement(numberOfUsersByCountryQuery);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Country country = new Country();
				country.setNumberOfUsers(resultSet.getInt(1));
				country.setCountryName(resultSet.getString(2));
				numberOfUsersByCountryList.add(country);
			}
			return numberOfUsersByCountryList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Double getUsersPercentageBasedOnGender(String gender) {
		String percentageOfUsersBasedOnGenderQuery = " select 100 * count(*) / (select count(*) from ums.user_info) from ums.user_info where gender = ?;";
		try {
			preparedStatement = connection.prepareStatement(percentageOfUsersBasedOnGenderQuery);
			preparedStatement.setString(1, gender);
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Integer getNumberOfUsersBasedOnAgeGroup(int... age) {
		if (age.length == 2) {
			String numberOfUsersByGroup = "Select count(*) from ums.user_info where year(now())-year(dob) between ? and ?;";
			try {
				preparedStatement = connection.prepareStatement(numberOfUsersByGroup);
				preparedStatement.setInt(1, age[0]);
				preparedStatement.setInt(2, age[1]);

				ResultSet resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					return resultSet.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (age[0] == 42) {
			String numberOfUsersByGreaterAge = "Select count(*) from ums.user_info where year(now())-year(dob) > ? ;";
			try {
				preparedStatement = connection.prepareStatement(numberOfUsersByGreaterAge);
				preparedStatement.setInt(1, age[0]);
				ResultSet resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					return resultSet.getInt(1);
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (age[0] == 18) {
			String numberOfUsersByGreaterAge = "Select count(*) from ums.user_info where year(now())-year(dob) < ? ;";
			try {
				preparedStatement = connection.prepareStatement(numberOfUsersByGreaterAge);
				preparedStatement.setInt(1, age[0]);
				ResultSet resultSet = preparedStatement.executeQuery();
				if (resultSet.next()) {
					return resultSet.getInt(1);
				}				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public Map<Integer, String> getNumberOfUsersByAllTimeRegistrations() {
		String numberOfUsersBasedOnRegistrations = "SELECT count(*) as users , date_format(creator_stamp,\"%b %Y\") as monthYear "
				+ "FROM user_info GROUP BY date_format(creator_stamp,\"%b %Y\")";
		Map<Integer, String> numberOfRegistrationsByMonth = new HashMap<Integer, String>();
		try {
			preparedStatement = connection.prepareStatement(numberOfUsersBasedOnRegistrations);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				numberOfRegistrationsByMonth.put(resultSet.getInt(1), resultSet.getString(2));
			}
			return numberOfRegistrationsByMonth;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateFailedAttempts(String userName) {
		String failedLoginUpdateQuery = "UPDATE ums.user_info SET failed_login_attempts = failed_login_attempts + 1 WHERE user_name = ?;";
		try {
			preparedStatement = connection.prepareStatement(failedLoginUpdateQuery);
			preparedStatement.setString(1, userName);
			return preparedStatement.executeUpdate() == 1;				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;		
	}

	public boolean updateStatus(String userName) {
		String updateUserStatusQuery = "UPDATE ums.user_info SET status = 'inactive' WHERE user_name = ? AND failed_login_attempts = 3;";
		try {
			preparedStatement = connection.prepareStatement(updateUserStatusQuery);
			preparedStatement.setString(1, userName);
			return preparedStatement.executeUpdate() == 1;				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;				
	}

	public boolean removeInactiveStatus(long userId) {
		String removeInactiveStatusQuery = "UPDATE ums.user_info SET status = 'active',failed_login_attempts = 0 WHERE id = ?";
		try {
			preparedStatement = connection.prepareStatement(removeInactiveStatusQuery);
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate() == 1;				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean setUserLogoutTime(Long userId) {
		String setLogoutTimeQuery = "UPDATE `ums`.`user_log_history` SET `logout_timestamp` = now() WHERE `user_id` = ? AND logout_timestamp is null";
		try {
			preparedStatement = connection.prepareStatement(setLogoutTimeQuery);
			preparedStatement.setLong(1, userId);
			return preparedStatement.executeUpdate() == 1;				
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}

	public Map<Integer, String> getNumberOfUsersBasedOnCurrentYearRegistrations() {
		String numberOfUsersBasedOnCurrentYearRegistrations = "SELECT count(*) as users , date_format(creator_stamp,\"%b\") as month FROM user_info \r\n" + 
				"WHERE YEAR(creator_stamp) = YEAR(now()) GROUP BY date_format(creator_stamp,\"%b\");";
		Map<Integer, String> numberOfRegistrationsByMonth = new HashMap<Integer, String>();
		try {
			preparedStatement = connection.prepareStatement(numberOfUsersBasedOnCurrentYearRegistrations);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				numberOfRegistrationsByMonth.put(resultSet.getInt(1), resultSet.getString(2));
			}
			return numberOfRegistrationsByMonth;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numberOfRegistrationsByMonth;
	}

	public Map<Integer, String> getNumberOfUsersBasedOnCurrentMonthRegistrations() {
		String numberOfUsersBasedOnCurrentMonthRegistrations = "SELECT count(*) as users , date_format(creator_stamp,\"%e\") as day \r\n" + 
				"FROM user_info WHERE YEAR(creator_stamp) = YEAR(now()) \r\n" + 
				"AND MONTH(creator_stamp) = MONTH(now()) GROUP BY date_format(creator_stamp,\"%e\");";
		Map<Integer, String> numberOfRegistrationsByDates = new HashMap<Integer, String>();
		try {
			preparedStatement = connection.prepareStatement(numberOfUsersBasedOnCurrentMonthRegistrations);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				numberOfRegistrationsByDates.put(resultSet.getInt(1), resultSet.getString(2));
			}
			return numberOfRegistrationsByDates;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return numberOfRegistrationsByDates;
	}

	public List<String> getCountryData() {
		String numberOfUsersBasedOnCurrentMonthRegistrations = "SELECT country_name FROM ums.country";
		List<String> countriesList = new ArrayList<String>();
		try {
			preparedStatement = connection.prepareStatement(numberOfUsersBasedOnCurrentMonthRegistrations);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				countriesList.add(resultSet.getString(1));
			}
			return countriesList;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}
}