package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserRoleController")
public class UserRoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		long userId = (long) httpSession.getAttribute("userId");
		UserService userService = new UserService();
		Permissions permissions = userService.getUserPermissions(userId);
		List<String>  userHistory = userService.getUserLoginHistory(userId);
		User user = userService.getUserGeneralDetails(userId);
		List<User> userList = userService.getUsers();
		request.setAttribute("user", user);
		request.setAttribute("userHistory", userHistory);
		request.setAttribute("permissions", permissions);	
		request.setAttribute("userList",userList);
		request.getRequestDispatcher("dashboard").forward(request, response);
	}

}
