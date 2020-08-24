package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.servlet.http.HttpSession;

import com.bridgelabz.usermanagementsystem.config.*;

import java.sql.PreparedStatement;

/*
 * Servlet implementation class Login
 */

@WebServlet(value="/login-process")
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
	            PreparedStatement ps = connection.prepareStatement
	                    ("select * from user_info where user_name ='" + userName + "' and password='"+password+"'");

	            ResultSet resultSet = ps.executeQuery();

	            if (!resultSet.next()) {
	                destinationPath = "login.jsp";
	            } else{
	                destinationPath = "dashboard.jsp"; 

	                HttpSession httpSession=request.getSession();
	                httpSession.setAttribute("username",userName);
	                httpSession.setAttribute("password",password);
	            }
	            
	            connection.close();
	            response.sendRedirect(destinationPath);
	        }
	        catch(Exception exception) {
	            exception.printStackTrace();
	        }
	    }
}