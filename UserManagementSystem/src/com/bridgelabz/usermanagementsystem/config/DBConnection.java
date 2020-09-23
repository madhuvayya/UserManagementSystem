package com.bridgelabz.usermanagementsystem.config;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.Properties;

import org.apache.log4j.Logger;

public class DBConnection {

	private static Connection connection = null;
	private static Logger logger = Logger.getLogger(DBConnection.class);

	static {
		FileReader fileReader = null;
		try {
			fileReader = new FileReader(
					"C:\\Users\\USER\\git\\UserManagementSystem\\UserManagementSystem\\WebContent\\resources\\db.properties");
			logger.info("db.properties file is successfully read using file reader");
		} catch (FileNotFoundException fileNotFoundException) {
			fileNotFoundException.printStackTrace();
			logger.info("db.properties file is not found");
		}
		
		Properties properties = new Properties();
		try {
			properties.load(fileReader);
			logger.info("Database properties are successfully loaded into properties object");
		} catch (IOException ioException) {
			ioException.printStackTrace();
		}

		String driver = properties.getProperty("db.driver");
		String url = properties.getProperty("db.url");
		String username = properties.getProperty("db.username");
		String password = properties.getProperty("db.password");

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, username, password);
			logger.info("Database connection established.");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			logger.info("Failed to connect to database beacuse driver class not found.");
		} catch (SQLException e) {
			e.printStackTrace();
			logger.info("Failed to connect to database beacuse of invalid database credentials.");
		}
	}

	public static Connection getConnection() {
		return connection;
	}
}