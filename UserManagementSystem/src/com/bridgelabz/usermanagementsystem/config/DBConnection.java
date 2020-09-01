package com.bridgelabz.usermanagementsystem.config;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.Properties;

public class DBConnection {

	private static Connection connection = null;

	static {
		FileReader fileReader = null;
		try {
			fileReader = new FileReader(
					"C:\\Users\\USER\\git\\UserManagementSystem\\UserManagementSystem\\WebContent\\resources\\db.properties");
		} catch (FileNotFoundException fileNotFoundException) {
			fileNotFoundException.printStackTrace();
		}

		Properties properties = new Properties();
		try {
			properties.load(fileReader);
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
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		return connection;
	}
}