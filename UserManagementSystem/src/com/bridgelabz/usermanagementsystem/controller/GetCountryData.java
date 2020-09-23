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

@WebServlet("/GetCountryData")
public class GetCountryData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetCountryData.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = new UserService();
		List<String> countryNames =  userService.getCountryData();
		if (countryNames.size() != 0) {
			logger.info("Country Names list is not empty");
		}
		String json = new Gson().toJson(countryNames);
		response.getWriter().write(json);
	}
}
