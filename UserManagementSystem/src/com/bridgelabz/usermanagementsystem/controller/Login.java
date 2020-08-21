package com.bridgelabz.usermanagementsystem.controller;

import com.bridgelabz.usermanagementsystem.connection.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.servlet.http.HttpSession;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Login
 */
//@WebServlet(value="/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        PrintWriter out = response.getWriter();
	        
	        System.out.println("Login servlet");

	        String userName = request.getParameter("username");
	        String password = request.getParameter("password");
	        String destinationPath = "";

	        Connection connection = null;
	        try {
	            connection = DBConnection.getConnection();
	            PreparedStatement ps = connection.prepareStatement
	                    ("select * from user_info where user_name ='" + userName + "' and password='"+password+"'");

	            ResultSet rs = ps.executeQuery();

	            if (!rs.next()) {
	                destinationPath = "login.html";
//	                response.sendRedirect("index.jsp");
	            } else{
	                destinationPath = "dashBoard.jsp";

	                HttpSession session=request.getSession();
	                session.setAttribute("userName",userName);
	                session.setAttribute("password",password);
	            }

	            out.println("You successfully logged in...");
	            connection.close();

	            response.sendRedirect(destinationPath);
	        }
	        catch(Exception exception) {
	            exception.printStackTrace();
	        }
	    }
}