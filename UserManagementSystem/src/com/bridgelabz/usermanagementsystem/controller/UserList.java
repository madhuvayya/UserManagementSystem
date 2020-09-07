package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserList")
public class UserList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();
		List<User> userList = userService.getUsers();
		String message = "No data availble";

		if (userList.size() > 0) {
			message = "";
		}
		request.setAttribute("message", message);
		request.setAttribute("userList", userList);
		RequestDispatcher rd = request.getRequestDispatcher("users");
		rd.forward(request, response);
	}
}
