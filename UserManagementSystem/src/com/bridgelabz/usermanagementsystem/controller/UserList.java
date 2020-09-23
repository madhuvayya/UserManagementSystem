package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserDetails.class); 

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();
		List<User> userList = userService.getUsers();
		String message = "No data availble";

		if (userList.size() > 0) {
			message = "";
			logger.info("Users list size is not zero.");
		} else {
			logger.error("Users list is empty.");
		}
		request.setAttribute("message", message);
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("users").forward(request, response);
		logger.info("Request is forwarded to users page");
	}
}
