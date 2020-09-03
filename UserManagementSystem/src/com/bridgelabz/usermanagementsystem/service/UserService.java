package com.bridgelabz.usermanagementsystem.service;

import java.io.IOException;

import com.bridgelabz.usermanagementsystem.dao.UserDao;
import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class UserService {

	UserDao userDao = new UserDao();

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

	public void addUserPermissions(Permissions permissions, String userName, String creatorUser)
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

		userDao.addPermissions(userId, 6, permissions.getWebPage3Add(), permissions.getWebPage3Delete(),
				permissions.getWebPage3Modify(), permissions.getWebPage3Read(), creatorUser);
	}
}
