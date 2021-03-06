package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet(value = "/login-process")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Login.class);

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String destinationPage = "";

		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);

		UserService userService = new UserService();
		long userId = userService.isRegisteredUser(user);

		logger.info("User " + userName + " is trying to login.");
		if (userId != 0) {
			logger.info(userName + " Valid user");
			destinationPage = "UserRoleController";

			userService.removeInactiveStatus(userId);
			userService.setLoginTime(userId);
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("username", userName);
			httpSession.setAttribute("userId", userId);
			logger.info("Session object is created and attrubutes are set.");
		} else {
			userService.updateFailedAttempts(userName);
			request.setAttribute("message", "Enter registred user name and password.");
			destinationPage = "login";
			logger.info(userName + "Invalid user / entered invalid user name or password");
		}
		request.getRequestDispatcher(destinationPage).forward(request, response);
	}
}