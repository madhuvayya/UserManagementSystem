package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.service.UserService;
import com.google.gson.Gson;

@WebServlet("/GetUsersPercentageBasedOnGender")
public class GetUsersPercentageBasedOnGender extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetUsersPercentageBasedOnGender.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		List<Double> percentegeOfUsersBasedOnGender = userService.getNumberOfUsersBasedOnGender();
		if(percentegeOfUsersBasedOnGender.size() == 0)
			logger.error("Percentege Of Users Based On Gender list is empty.");
		String json = new Gson().toJson(percentegeOfUsersBasedOnGender);
		response.getWriter().write(json);
	}

}
