package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.bridgelabz.usermanagementsystem.service.UserService;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(Logout.class);
    
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Long userId = (Long) session.getAttribute("userId");
		
		UserService userService = new UserService();
		userService.setLogoutTime(userId);
		session.invalidate();

        request.setAttribute("message", "You successfully logged out.");
        response.sendRedirect("login");
        logger.info("User Successfully logout");
	}
}
