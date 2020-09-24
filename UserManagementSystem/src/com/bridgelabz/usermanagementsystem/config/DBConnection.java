package com.bridgelabz.usermanagementsystem.config;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.Properties;

import org.apache.log4j.Logger;

public class DBConnection {

	private static Connection connection = null;
	private static Logger logger = Logger.getLogger(DBConnection.class);

	static {
		InputStream propertiesInputStream = DBConnection.class.getClassLoader().getResourceAsStream("/resources/db.properties");
		logger.info("db.properties file is successfully read using file reader");
		Properties properties = new Properties();
		try {
			properties.load(propertiesInputStream);
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