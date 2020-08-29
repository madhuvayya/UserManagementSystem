package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bridgelabz.usermanagementsystem.dao.UserDao;
import com.bridgelabz.usermanagementsystem.model.User;

@WebServlet("/register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String country = request.getParameter("country");
		String phoneNumber = request.getParameter("phoneNumber");
		String alternateNumber = request.getParameter("alternateNumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String userRole = request.getParameter("role");
		String userImage = request.getParameter("userImage");

		User user = new User();

		user.setFirstName(firstName);
		user.setMiddleName(middleName);
		user.setLastName(lastName);
		user.setDob(dob);
		user.setGender(gender);
		user.setCountry(country);
		user.setPhoneNumber(phoneNumber);
		user.setAlternateNumber(alternateNumber);
		user.setEmail(email);
		user.setAddress(address);
		user.setUserName(userName);
		user.setPassword(password);
		user.setRole(userRole);
		user.setUserImage(userImage);

		UserDao userDao = new UserDao();

		boolean userRegistered = userDao.registerUser(user);

		if (userRegistered) {
			request.setAttribute("registerMessage", "User successfully registered.");
		} else {
			request.setAttribute("registerMessage", "Failed to register.");
		}
		request.getRequestDispatcher("newuser").forward(request, response);
	}

}
