package com.bridgelabz.usermanagementsystem.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {

	/**
	 * Utility method to send simple HTML email
	 * @param session
	 * @param toEmail
	 * @param subject
	 * @param body
	 */
	public static void sendEmail(Session session, String toEmail, String subject, String body){
		try
	    {
	      MimeMessage mimeMessage = new MimeMessage(session);
	      //set message headers
	      mimeMessage.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      mimeMessage.addHeader("format", "flowed");
	      mimeMessage.addHeader("Content-Transfer-Encoding", "8bit");

	      mimeMessage.setFrom(new InternetAddress("no_reply@example.com", "NoReply-JD"));

	      mimeMessage.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

	      mimeMessage.setSubject(subject, "UTF-8");

	      mimeMessage.setText(body, "UTF-8");

	      mimeMessage.setSentDate(new Date());

	      mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      System.out.println("Message is ready");
    	  Transport.send(mimeMessage);  

	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
	}
}
