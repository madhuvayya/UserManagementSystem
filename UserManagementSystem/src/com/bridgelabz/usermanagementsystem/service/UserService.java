package com.bridgelabz.usermanagementsystem.service;

import java.io.IOException;
import java.util.List;

import com.bridgelabz.usermanagementsystem.dao.UserDao;
import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class UserService {

	private static UserDao userDao = new UserDao();

	public String isRegisteredUser(User user) {
		long userId = userDao.checkUserAuthorization(user);
		if (userId != 0) {
			String lastLogin = userDao.getUserLastLoginTime(userId);
			userDao.storeUserLoginTime(userId);
			return lastLogin;
		}	
		return null;
	}

	public boolean registerUser(User user) throws IOException, MySQLIntegrityConstraintViolationException {
		return userDao.addUser(user);
	}

	public boolean addUserPermissions(Permissions permissions, String userName, String creatorUser)
			throws ClassNotFoundException, IOException {
		Long userId = userDao.getUserIdByUserName(userName);

		userDao.addPermissions(userId, 1, permissions.getDashboardAdd(), permissions.getDashboardDelete(),
				permissions.getDashboardModify(), permissions.getDashboardRead(), creatorUser);

		userDao.addPermissions(userId, 2, permissions.getSettingsAdd(), permissions.getSettingsDelete(),
				permissions.getSettingsModify(), permissions.getSettingsRead(), creatorUser);

		userDao.addPermissions(userId, 3, permissions.getUsersInformationAdd(), permissions.getUsersInformationDelete(),
				permissions.getUsersInformationModify(), permissions.getUsersInformationRead(), creatorUser);

		userDao.addPermissions(userId, 4, permissions.getWebPage1Add(), permissions.getWebPage1Delete(),
				permissions.getWebPage1Modify(), permissions.getWebPage1Read(), creatorUser);

		userDao.addPermissions(userId, 5, permissions.getWebPage2Add(), permissions.getWebPage2Delete(),
				permissions.getWebPage2Modify(), permissions.getWebPage2Read(), creatorUser);

		return userDao.addPermissions(userId, 6, permissions.getWebPage3Add(), permissions.getWebPage3Delete(),
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
		
		List<Boolean> dashboardPermissions = userDao.getUserPermissions(userId, 1);
		permissions.setDashboardAdd(dashboardPermissions.get(0));
		permissions.setDashboardDelete(dashboardPermissions.get(1));
		permissions.setDashboardModify(dashboardPermissions.get(2));
		permissions.setDashboardRead(dashboardPermissions.get(3));		
		 
		List<Boolean> settingsPermissions = userDao.getUserPermissions(userId, 2);
		permissions.setSettingsAdd(settingsPermissions.get(0));
		permissions.setSettingsDelete(settingsPermissions.get(1));
		permissions.setSettingsModify(settingsPermissions.get(2));
		permissions.setSettingsRead(settingsPermissions.get(3));
		
		List<Boolean> userInformationPermissions = userDao.getUserPermissions(userId, 3);
		permissions.setUsersInformationAdd(userInformationPermissions.get(0));
		permissions.setUsersInformationDelete(userInformationPermissions.get(1));
		permissions.setUsersInformationModify(userInformationPermissions.get(2));
		permissions.setUsersInformationRead(userInformationPermissions.get(3));		
		
		List<Boolean> webPage1Permissions = userDao.getUserPermissions(userId, 4);
		permissions.setWebPage1Add(webPage1Permissions.get(0));
		permissions.setWebPage1Delete(webPage1Permissions.get(1));
		permissions.setWebPage1Modify(webPage1Permissions.get(2));
		permissions.setWebPage1Read(webPage1Permissions.get(3));		
		
		List<Boolean> webPage2Permissions = userDao.getUserPermissions(userId, 5);
		permissions.setWebPage2Add(webPage2Permissions.get(0));
		permissions.setWebPage2Delete(webPage2Permissions.get(1));
		permissions.setWebPage2Modify(webPage2Permissions.get(2));
		permissions.setWebPage2Read(webPage2Permissions.get(3));		
		
		List<Boolean> webPage3Permissions = userDao.getUserPermissions(userId, 6);
		permissions.setWebPage3Add(webPage3Permissions.get(0));
		permissions.setWebPage3Delete(webPage3Permissions.get(1));
		permissions.setWebPage3Modify(webPage3Permissions.get(2));
		permissions.setWebPage3Read(webPage3Permissions.get(3));		
		return permissions;
	}

	public boolean updateUserDetails(Long userId, User user, Permissions permissions) {
		try {
			userDao.updateUserGeneralDetails(userId,user);
			userDao.updatePermissions(userId, 1, permissions.getDashboardAdd(), permissions.getDashboardDelete(),
					permissions.getDashboardModify(), permissions.getDashboardRead(), user.getCreatorUser());

			userDao.updatePermissions(userId, 2, permissions.getSettingsAdd(), permissions.getSettingsDelete(),
					permissions.getSettingsModify(), permissions.getSettingsRead(), user.getCreatorUser());

			userDao.updatePermissions(userId, 3, permissions.getUsersInformationAdd(), permissions.getUsersInformationDelete(),
					permissions.getUsersInformationModify(), permissions.getUsersInformationRead(),user.getCreatorUser());

			userDao.updatePermissions(userId, 4, permissions.getWebPage1Add(), permissions.getWebPage1Delete(),
					permissions.getWebPage1Modify(), permissions.getWebPage1Read(), user.getCreatorUser());

			userDao.updatePermissions(userId, 5, permissions.getWebPage2Add(), permissions.getWebPage2Delete(),
					permissions.getWebPage2Modify(), permissions.getWebPage2Read(), user.getCreatorUser());

			return userDao.updatePermissions(userId, 6, permissions.getWebPage3Add(), permissions.getWebPage3Delete(),
					permissions.getWebPage3Modify(), permissions.getWebPage3Read(), user.getCreatorUser());
		} catch (MySQLIntegrityConstraintViolationException e) {
			e.printStackTrace();
		}	
		return false;		
	}
}
