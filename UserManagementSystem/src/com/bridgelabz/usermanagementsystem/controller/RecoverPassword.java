package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.config.DBConnection;
import com.bridgelabz.usermanagementsystem.service.Email;

@WebServlet(value = "/RecoverPassword")
public class RecoverPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(RecoverPassword.class); 
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String message;
		String destinationPath;

		Connection connection = null;
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from user_info where email='" + email + "'");
			ResultSet resultSet = preparedStatement.executeQuery();

			if (!resultSet.next()) {
				message = "Enter registered email.";
				destinationPath = "forgotPassword";
				logger.error("Entered "+ email +" for password recovery is not registered email id.");
			} else {
				String emailBody = "Dear " + resultSet.getString("first_name") + " " + resultSet.getString("last_name")
						+ "," + "\n\nYou can log-in with following credentials: \n" + "\nPassword: "
						+ resultSet.getString("password") + "\n\nThanks and Regards, ";

				Email.sendEmail(email, "Password Recovery", emailBody);
				message = "Password sent your email.";
				destinationPath = "login";
				logger.info("Password is sent to "+ email + "email-id");
			}

			RequestDispatcher requestDispatcher = request.getRequestDispatcher(destinationPath);
			request.setAttribute("message", message);
			requestDispatcher.forward(request, response);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}
}