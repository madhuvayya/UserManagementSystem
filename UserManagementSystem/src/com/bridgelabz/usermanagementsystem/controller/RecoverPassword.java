package com.bridgelabz.usermanagementsystem.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Session;

import com.bridgelabz.usermanagementsystem.connection.DBConnection;
import com.bridgelabz.usermanagementsystem.util.Email;

/**
 * Servlet implementation class RecoverPassword
 */

@WebServlet(value="/jsp/RecoverPassword")
public class RecoverPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String message;
        String destinationPath;

        Connection connection = null;
        try {
            connection = DBConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement
                    ("select password from user_info where email='"+ email + "'");
            
            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.next()) {
            	message = "Enter registered email.";
            	destinationPath = "forgotPassword.jsp";
            } else{
            	String password = resultSet.getString("password");
            	System.out.println("Password: " + password);
            	String smtpHostServer = "localhost";
            	
            	Properties properties = System.getProperties();
            	properties.put("mail.smtp.host", smtpHostServer);
            	
        	    Session session = Session.getInstance(properties, null);
        	    
        	    Email.sendEmail(session, email,"User Management System", "Your passord: "+password);
        	    message = "Password sent your email.";
            	destinationPath = "login.jsp";
            }
            
            connection.close();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(destinationPath);

            request.setAttribute("message", message);

            requestDispatcher.forward(request, response);  
        }
        catch(Exception exception) {
            exception.printStackTrace();
        }
	}

}
