package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(DeleteUser.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long userId = Long.parseLong(request.getParameter("userId"));
		UserService userService = new UserService();
		boolean isUserDeleted = userService.deleteUser(userId);
		String message = "";
		if(isUserDeleted) {
			message = "User with id: "+ userId + " is deleted";
			logger.info("User data is deleted from database");
		} else {
			message = "User data is not deleted";
			logger.info("User data is not deleted");
		}
		request.setAttribute("message", message);
		request.getRequestDispatcher("UserList").forward(request, response);
	}
}
