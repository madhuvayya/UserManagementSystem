package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import com.bridgelabz.usermanagementsystem.config.*;

@WebServlet(value = "/login-process")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String destinationPath = "";

		Connection connection = null;
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"select * from user_info where user_name ='" + userName + "' and password='" + password + "'");

			ResultSet resultSet = preparedStatement.executeQuery();

			if (!resultSet.next()) {
				request.setAttribute("message", "Enter registred user name and password.");
				destinationPath = "login";
			} else {
				destinationPath = "dashboard";

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("username", userName);
				httpSession.setAttribute("password", password);
			}

			RequestDispatcher requestDispatcher = request.getRequestDispatcher(destinationPath);
			connection.close();
			requestDispatcher.forward(request, response);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
}