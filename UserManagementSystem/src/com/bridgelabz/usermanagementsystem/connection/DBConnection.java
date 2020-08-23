package com.bridgelabz.usermanagementsystem.connection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.Properties;

public class DBConnection {
	
    public static Connection getConnection() throws IOException, ClassNotFoundException {
		
		FileReader fileReader=new FileReader("C:\\Users\\USER\\git\\UserManagementSystem\\UserManagementSystem\\WebContent\\resources\\db.properties");
		        
        
        Properties properties=new Properties();
        properties.load(fileReader);

        String driver = properties.getProperty("db.driver");
        String url = properties.getProperty("db.url");
        String username = properties.getProperty("db.username");
        String password = properties.getProperty("db.password");

        Connection connection = null;
        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
        }
        catch (Exception exception) {
        	exception.printStackTrace();
        }
        return connection;
    }
}
