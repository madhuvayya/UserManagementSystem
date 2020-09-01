package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		user.setUserImage(request.getParameter("userImage"));
		user.setCreatorUser((String) httpSession.getAttribute("username"));

		UserService userService = new UserService();

		boolean userRegistered = UserService.registerUser(user);

		if (userRegistered) {
			Permissions permissions = new Permissions();
			System.out.println(request.getParameter("dashboard_add"));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("dashboard_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("dashboard_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("dashboard_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("dashboard_read")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("settings_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("settings_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("settings_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("settings_read")));			
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("user_info_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("user_info_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("user_info_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("user_info_read")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w1_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w1_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w1_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w1_read")));	
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w2_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w2_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w2_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w2_read")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w3_add")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w3_delete")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w3_modify")));
			permissions.setDashboardAdd(Boolean.parseBoolean(request.getParameter("w3_read")));
			
			try {
				userService.addUserPermissions(permissions,user.getUserName(),user.getCreatorUser());
				request.setAttribute("registerMessage", "User successfully registered.");
			} catch (ClassNotFoundException | IOException e) {
				e.printStackTrace();
			}
		} else {
			request.setAttribute("registerMessage", "Failed to register.");
		}
		request.getRequestDispatcher("newuser").forward(request, response);
	}

}
