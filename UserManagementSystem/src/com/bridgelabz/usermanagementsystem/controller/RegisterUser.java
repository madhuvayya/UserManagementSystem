package com.bridgelabz.usermanagementsystem.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/register")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(RegisterUser.class);

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = request.getSession();

		User user = new User();

		user.setFirstName(request.getParameter("firstName"));
		user.setMiddleName(request.getParameter("middleName"));
		user.setLastName(request.getParameter("lastName"));
		user.setDob(request.getParameter("dob"));
		user.setGender(request.getParameter("gender"));
		user.setCountry(request.getParameter("country"));
		user.setPhoneNumber(request.getParameter("phoneNumber"));
		user.setAlternateNumber(request.getParameter("alternateNumber"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
		user.setCreatorUser((String) httpSession.getAttribute("username"));

		InputStream inputStream = null;
		Part filePart = request.getPart("userImage");
		if (filePart != null) {
			inputStream = filePart.getInputStream();
		} else {
			inputStream = new FileInputStream(getClass().getResource("/resources/image.png").toString());
		}

		user.setUserUploadingImage(inputStream);
		
		UserService userService = new UserService();
		boolean isGeneralInformationStored = false;
			try {
				isGeneralInformationStored = userService.registerUser(user);				
			} catch (SQLIntegrityConstraintViolationException | IOException e1) {
				request.setAttribute("registerMessage", e1.getMessage());
				logger.info("User "+ request.getParameter("firstName") +" failed to store general information because of "+ e1.getMessage() );
			} 
			
			
		if (isGeneralInformationStored) {
			logger.info("User "+ request.getParameter("firstName") +" general information successfully stored in the database.");
			Permissions permissions = new Permissions();
			permissions.setDashboardAdd(request.getParameter("dashboard_add") != null ? true : false);
			permissions.setDashboardDelete(request.getParameter("dashboard_delete") != null ? true : false);
			permissions.setDashboardModify(request.getParameter("dashboard_modify") != null ? true : false);
			permissions.setDashboardRead(request.getParameter("dashboard_read") != null ? true : false);
			permissions.setSettingsAdd(request.getParameter("settings_add") != null ? true : false);
			permissions.setSettingsDelete(request.getParameter("settings_delete") != null ? true : false);
			permissions.setSettingsModify(request.getParameter("settings_modify") != null ? true : false);
			permissions.setSettingsRead(request.getParameter("settings_read") != null ? true : false);
			permissions.setUsersInformationAdd(request.getParameter("user_info_add") != null ? true : false);
			permissions.setUsersInformationDelete(request.getParameter("user_info_delete") != null ? true : false);
			permissions.setUsersInformationModify(request.getParameter("user_info_modify") != null ? true : false);
			permissions.setUsersInformationRead(request.getParameter("user_info_read") != null ? true : false);
			permissions.setWebPage1Add(request.getParameter("w1_add") != null ? true : false);
			permissions.setWebPage1Delete(request.getParameter("w1_delete") != null ? true : false);
			permissions.setWebPage1Modify(request.getParameter("w1_modify") != null ? true : false);
			permissions.setWebPage1Read(request.getParameter("w1_read") != null ? true : false);
			permissions.setWebPage2Add(request.getParameter("w2_add") != null ? true : false);
			permissions.setWebPage2Delete(request.getParameter("w2_delete") != null ? true : false);
			permissions.setWebPage2Modify(request.getParameter("w2_modify") != null ? true : false);
			permissions.setWebPage2Read(request.getParameter("w2_read") != null ? true : false);
			permissions.setWebPage3Add(request.getParameter("w3_add") != null ? true : false);
			permissions.setWebPage3Delete(request.getParameter("w3_delete") != null ? true : false);
			permissions.setWebPage3Modify(request.getParameter("w3_modify") != null ? true : false);
			permissions.setWebPage3Read(request.getParameter("w3_read") != null ? true : false);
			boolean userRegistered = false;
			try {
				userRegistered = userService.addUserPermissions(permissions, user.getUserName(), user.getCreatorUser());
				logger.info("User "+ request.getParameter("firstName") + " permissions are successfully stored in database.");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				logger.error("User "+ request.getParameter("firstName") + " permissions are failed to store in database.");
			}
			if (userRegistered) {
				request.setAttribute("registerMessage", "User successfully registered.");
				logger.info("User "+ request.getParameter("firstName") + " information is completely stored in database");
			}
		}

		request.getRequestDispatcher("newuser").forward(request, response);
	}

}
