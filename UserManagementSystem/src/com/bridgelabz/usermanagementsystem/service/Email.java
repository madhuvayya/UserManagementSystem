package com.bridgelabz.usermanagementsystem.service;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	public static void sendEmail(String toEmail, String subject, String body){
		
		Properties properties=new Properties();
		FileReader fileReader;
		try {
			fileReader = new FileReader("C:\\Users\\USER\\git\\UserManagementSystem\\UserManagementSystem\\WebContent\\resources\\db.properties");
			try {
				properties.load(fileReader);
			} catch (IOException ioException) {
				ioException.printStackTrace();
			}
		} catch (FileNotFoundException fileNotFoundException) {
			fileNotFoundException.printStackTrace();
		}
    	
    	Properties systemProperties = System.getProperties();
    	String smtpHostServer = "smtp.gmail.com";
    	systemProperties.put("mail.smtp.host", smtpHostServer);
    	systemProperties.put("mail.smtp.port", "465");
    	systemProperties.put("mail.smtp.ssl.enable", "true");
    	systemProperties.put("mail.smtp.auth", "true"); 
		
        Session session = Session.getInstance(systemProperties, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(properties.getProperty("fromEmail"), properties.getProperty("password"));
        	}
        });
        
		try {
            MimeMessage mimeMessage = new MimeMessage(session);
            
            mimeMessage.addHeader("Content-type", "text/HTML; charset=UTF-8");
            mimeMessage.addHeader("format", "flowed");
            mimeMessage.addHeader("Content-Transfer-Encoding", "8bit");
	      
            mimeMessage.setFrom(new InternetAddress(properties.getProperty("fromEmail")));  
            mimeMessage.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));  
            mimeMessage.setSubject(subject, "UTF-8");
            mimeMessage.setText(body, "UTF-8");
            mimeMessage.setSentDate(new Date());
            Transport.send(mimeMessage);  
		} catch (Exception exception) {
	    	exception.printStackTrace();
	    }
	}
}