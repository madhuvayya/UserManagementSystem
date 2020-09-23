package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserDetails.class);

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();
		Long userId = Long.parseLong(request.getParameter("userId"));
		List<String> countrylist = new ArrayList<String>();

		User user = userService.getUserGeneralDetails(userId);
		if(user.equals(null)) {
			logger.error("User object is null.");
		} else {
			logger.info("User object is not null");
		}	
		Permissions permissions = userService.getUserPermissions(userId);
		if(permissions.equals(null)) {
			logger.error("Permissions object is null.");
		} else {
			logger.info("Permissions object is not null");
		}		
		countrylist = userService.getCountryData();
		request.setAttribute("user", user);
		request.setAttribute("countrylist", countrylist);
		request.setAttribute("permissions", permissions);
		request.getRequestDispatcher("update-user").forward(request, response);
		logger.info("Request forwarded to the update-user page with existing details");
	}
}
