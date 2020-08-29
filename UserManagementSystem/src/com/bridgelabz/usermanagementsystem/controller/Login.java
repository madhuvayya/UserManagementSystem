package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bridgelabz.usermanagementsystem.dao.UserDao;
import com.bridgelabz.usermanagementsystem.model.User;

@WebServlet(value = "/login-process")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String destinationPath = "";

		User user = new User();
		user.setUserName(userName);
		user.setPassword(password);

		UserDao userDao = new UserDao();
		boolean isAuthorizedUser = userDao.checkUserAuthorization(user);
		
		if (isAuthorizedUser) {
			destinationPath = "dashboard";
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("username", userName);
			httpSession.setAttribute("password", password);			
		} else {
			request.setAttribute("message", "Enter registred user name and password.");
			destinationPath = "login";
		}
		request.getRequestDispatcher(destinationPath).forward(request, response);
	}
}