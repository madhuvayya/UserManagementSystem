package com.bridgelabz.usermanagementsystem.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bridgelabz.usermanagementsystem.model.Permissions;
import com.bridgelabz.usermanagementsystem.model.User;
import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserService userService = new UserService();
		Long userId = Long.parseLong(request.getParameter("userId"));
		ArrayList<String> countrylist = new ArrayList<String>();
		BufferedReader bufferedReader = null;

		try {
			File f = new File(
					"C:\\Users\\USER\\git\\UserManagementSystem\\UserManagementSystem\\WebContent\\resources\\countries.txt");
			bufferedReader = new BufferedReader(new FileReader(f));

			String readLine = "";
			while ((readLine = bufferedReader.readLine()) != null) {
				countrylist.add(readLine);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		User user = userService.getUserGeneralDetails(userId);
		Permissions permissions = userService.getUserPermissions(userId);
		request.setAttribute("user", user);
		request.setAttribute("countrylist", countrylist);
		request.setAttribute("permissions", permissions);
		request.getRequestDispatcher("update-user").forward(request, response);
	}
}
