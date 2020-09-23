package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.model.Country;
import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserRoleController")
public class UserRoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserRoleController.class);

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpSession = request.getSession();
		long userId = (long) httpSession.getAttribute("userId");
		UserService userService = new UserService();
		Permissions permissions = userService.getUserPermissions(userId);
		List<String> userHistory = userService.getUserLoginHistory(userId);
		User user = userService.getUserGeneralDetails(userId);
		List<User> userList = userService.getUsers();
		httpSession.setAttribute("user", user);
		httpSession.setAttribute("userHistory", userHistory);
		httpSession.setAttribute("permissions", permissions);
		httpSession.setAttribute("userList", userList);
		if (user.getRole().equals("User")) {
			request.getRequestDispatcher("profile").forward(request, response);
		} else {
			List<Integer> usersCounter = userService.getUserCounts();
			List<Country> numberOfUsersByCountry = userService.getNumberOfUsersBasedOnCountry();
			List<Double> usersPercentegeListBasedOnGender = userService.getNumberOfUsersBasedOnGender();
			List<Integer> numberOfUsersByAgeGroup = userService.getNumberOfUsersBasedOnAgeGroup();
			Map<Integer, String> numberOfUsersByALLTimeRegistrations = userService.getNumberOfUsersByALLTimeRegistrations();
			Map<Integer, String> numberOfUsersByCurretYearRegistrations = userService.getNumberOfUsersBasedOnCurrentYearRegistrations();
			Map<Integer, String> numberOfUsersByCurretMonthRegistrations = userService.getNumberOfUsersBasedOnCurrentMonthRegistrations();			
			List<String> registeredMonths = new ArrayList<String>(numberOfUsersByALLTimeRegistrations.values());
			List<Integer> registeredUsersByMonths = new ArrayList<Integer>(numberOfUsersByALLTimeRegistrations.keySet());
			List<String> registeredByCurrentYearMonths = new ArrayList<String>(numberOfUsersByCurretYearRegistrations.values());
			List<Integer> registeredUsersByCurrentYearMonths = new ArrayList<Integer>(numberOfUsersByCurretYearRegistrations.keySet());			
			List<String> registeredByCurrentMonthDates = new ArrayList<String>(numberOfUsersByCurretMonthRegistrations.values());
			List<Integer> registeredUsersByCurrentMonth = new ArrayList<Integer>(numberOfUsersByCurretMonthRegistrations.keySet());			
			httpSession.setAttribute("usersCounter", usersCounter);
			httpSession.setAttribute("numberOfUsersByCountry", numberOfUsersByCountry);
			httpSession.setAttribute("usersPercentegeListBasedOnGender", usersPercentegeListBasedOnGender);
			httpSession.setAttribute("numberOfUsersByAgeGroup", numberOfUsersByAgeGroup);
			httpSession.setAttribute("registeredMonths", registeredMonths);
			httpSession.setAttribute("registeredUsersByMonths", registeredUsersByMonths);
			httpSession.setAttribute("registeredByCurrentYearMonths", registeredByCurrentYearMonths);
			httpSession.setAttribute("registeredUsersByCurrentYearMonths", registeredUsersByCurrentYearMonths);
			httpSession.setAttribute("registeredByCurrentMonthDates", registeredByCurrentMonthDates);
			httpSession.setAttribute("registeredUsersByCurrentMonth", registeredUsersByCurrentMonth);			
			request.getRequestDispatcher("dashboard").forward(request, response);
			logger.info("Data send to the dashboard page");
		}
	}
}
