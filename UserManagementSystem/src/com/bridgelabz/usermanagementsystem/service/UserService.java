package com.bridgelabz.usermanagementsystem.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bridgelabz.usermanagementsystem.dao.PermissionsDao;
import com.bridgelabz.usermanagementsystem.dao.UserDao;
import com.bridgelabz.usermanagementsystem.model.Country;
import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class UserService {

	private static UserDao userDao = new UserDao();
	private static PermissionsDao permissionsDao = new PermissionsDao();

	public long isRegisteredUser(User user) {
		long userId = userDao.checkUserAuthorization(user);
		if (userId != 0) {
			return userId;
		}
		return 0;
	}

	public boolean registerUser(User user) throws IOException, MySQLIntegrityConstraintViolationException {
		return userDao.addUser(user);
	}

	public boolean addUserPermissions(Permissions permissions, String userName, String creatorUser)
			throws ClassNotFoundException, IOException {
		Long userId = userDao.getUserIdByUserName(userName);

		permissionsDao.addPermissions(userId, 1, permissions.getDashboardAdd(), permissions.getDashboardDelete(),
				permissions.getDashboardModify(), permissions.getDashboardRead(), creatorUser);

		permissionsDao.addPermissions(userId, 2, permissions.getSettingsAdd(), permissions.getSettingsDelete(),
				permissions.getSettingsModify(), permissions.getSettingsRead(), creatorUser);

		permissionsDao.addPermissions(userId, 3, permissions.getUsersInformationAdd(),
				permissions.getUsersInformationDelete(), permissions.getUsersInformationModify(),
				permissions.getUsersInformationRead(), creatorUser);

		permissionsDao.addPermissions(userId, 4, permissions.getWebPage1Add(), permissions.getWebPage1Delete(),
				permissions.getWebPage1Modify(), permissions.getWebPage1Read(), creatorUser);

		permissionsDao.addPermissions(userId, 5, permissions.getWebPage2Add(), permissions.getWebPage2Delete(),
				permissions.getWebPage2Modify(), permissions.getWebPage2Read(), creatorUser);

		return permissionsDao.addPermissions(userId, 6, permissions.getWebPage3Add(), permissions.getWebPage3Delete(),
				permissions.getWebPage3Modify(), permissions.getWebPage3Read(), creatorUser);
	}

	public List<User> getUsers() throws IOException {
		return userDao.getUsersList();
	}

	public boolean deleteUser(Long userId) {
		return userDao.deleteUser(userId);
	}

	public User getUserGeneralDetails(Long userId) {
		return userDao.getUserDetails(userId);
	}

	public Permissions getUserPermissions(Long userId) {
		Permissions permissions = new Permissions();

		List<Boolean> dashboardPermissions = permissionsDao.getUserPermissions(userId, 1);
		permissions.setDashboardAdd(dashboardPermissions.get(0));
		permissions.setDashboardDelete(dashboardPermissions.get(1));
		permissions.setDashboardModify(dashboardPermissions.get(2));
		permissions.setDashboardRead(dashboardPermissions.get(3));

		List<Boolean> settingsPermissions = permissionsDao.getUserPermissions(userId, 2);
		permissions.setSettingsAdd(settingsPermissions.get(0));
		permissions.setSettingsDelete(settingsPermissions.get(1));
		permissions.setSettingsModify(settingsPermissions.get(2));
		permissions.setSettingsRead(settingsPermissions.get(3));

		List<Boolean> userInformationPermissions = permissionsDao.getUserPermissions(userId, 3);
		permissions.setUsersInformationAdd(userInformationPermissions.get(0));
		permissions.setUsersInformationDelete(userInformationPermissions.get(1));
		permissions.setUsersInformationModify(userInformationPermissions.get(2));
		permissions.setUsersInformationRead(userInformationPermissions.get(3));

		List<Boolean> webPage1Permissions = permissionsDao.getUserPermissions(userId, 4);
		permissions.setWebPage1Add(webPage1Permissions.get(0));
		permissions.setWebPage1Delete(webPage1Permissions.get(1));
		permissions.setWebPage1Modify(webPage1Permissions.get(2));
		permissions.setWebPage1Read(webPage1Permissions.get(3));

		List<Boolean> webPage2Permissions = permissionsDao.getUserPermissions(userId, 5);
		permissions.setWebPage2Add(webPage2Permissions.get(0));
		permissions.setWebPage2Delete(webPage2Permissions.get(1));
		permissions.setWebPage2Modify(webPage2Permissions.get(2));
		permissions.setWebPage2Read(webPage2Permissions.get(3));

		List<Boolean> webPage3Permissions = permissionsDao.getUserPermissions(userId, 6);
		permissions.setWebPage3Add(webPage3Permissions.get(0));
		permissions.setWebPage3Delete(webPage3Permissions.get(1));
		permissions.setWebPage3Modify(webPage3Permissions.get(2));
		permissions.setWebPage3Read(webPage3Permissions.get(3));
		return permissions;
	}

	public boolean updateUserDetails(Long userId, User user, Permissions permissions) {
		try {
			userDao.updateUserGeneralDetails(userId, user);
			permissionsDao.updatePermissions(userId, 1, permissions.getDashboardAdd(), permissions.getDashboardDelete(),
					permissions.getDashboardModify(), permissions.getDashboardRead(), user.getCreatorUser());

			permissionsDao.updatePermissions(userId, 2, permissions.getSettingsAdd(), permissions.getSettingsDelete(),
					permissions.getSettingsModify(), permissions.getSettingsRead(), user.getCreatorUser());

			permissionsDao.updatePermissions(userId, 3, permissions.getUsersInformationAdd(),
					permissions.getUsersInformationDelete(), permissions.getUsersInformationModify(),
					permissions.getUsersInformationRead(), user.getCreatorUser());

			permissionsDao.updatePermissions(userId, 4, permissions.getWebPage1Add(), permissions.getWebPage1Delete(),
					permissions.getWebPage1Modify(), permissions.getWebPage1Read(), user.getCreatorUser());

			permissionsDao.updatePermissions(userId, 5, permissions.getWebPage2Add(), permissions.getWebPage2Delete(),
					permissions.getWebPage2Modify(), permissions.getWebPage2Read(), user.getCreatorUser());

			return permissionsDao.updatePermissions(userId, 6, permissions.getWebPage3Add(),
					permissions.getWebPage3Delete(), permissions.getWebPage3Modify(), permissions.getWebPage3Read(),
					user.getCreatorUser());
		} catch (MySQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<String> getUserLoginHistory(long userId) {
		return userDao.getUserLoginHistory(userId);
	}

	public List<Integer> getUserCounts() {
		return userDao.getUsersCount();
	}

	public List<Country> getNumberOfUsersBasedOnCountry() {
		return userDao.numberOfUsersByCountry();
	}

	public List<Double> getNumberOfUsersBasedOnGender() {
		List<Double> percentegeOfUsersBasedOnGender = new ArrayList<Double>();
		percentegeOfUsersBasedOnGender.add(userDao.getUsersPercentageBasedOnGender("male"));
		percentegeOfUsersBasedOnGender.add(userDao.getUsersPercentageBasedOnGender("female"));
		return percentegeOfUsersBasedOnGender;
	}

	public List<Integer> getNumberOfUsersBasedOnAgeGroup() {
		List<Integer> numberOfUsersBasedOnAgeGroup = new ArrayList<Integer>();
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(18, 22));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(23, 27));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(28, 32));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(33, 37));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(38, 42));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(42));
		numberOfUsersBasedOnAgeGroup.add(userDao.getNumberOfUsersBasedOnAgeGroup(18));
		return numberOfUsersBasedOnAgeGroup;
	}

	public Map<Integer, String> getNumberOfUsersByALLTimeRegistrations() {
		return userDao.getNumberOfUsersByAllTimeRegistrations();
	}

	public void updateFailedAttempts(String userName) {
		if(userDao.updateFailedAttempts(userName))
			userDao.updateStatus(userName);
	}

	public boolean removeInactiveStatus(long userId) {
		return userDao.removeInactiveStatus(userId);		
	}

	public boolean setLogoutTime(Long userId) {
		return userDao.setUserLogoutTime(userId);
	}

	public void setLoginTime(long userId) {
		userDao.setUserLogoutTime(userId);
		userDao.storeUserLoginTime(userId);
	}

	public Map<Integer, String> getNumberOfUsersBasedOnCurrentYearRegistrations() {
		return userDao.getNumberOfUsersBasedOnCurrentYearRegistrations();
	}

	public Map<Integer, String> getNumberOfUsersBasedOnCurrentMonthRegistrations() {
		return userDao.getNumberOfUsersBasedOnCurrentMonthRegistrations();
	}

	public List<String> getCountryData() {
		return userDao.getCountryData();
	}
}
