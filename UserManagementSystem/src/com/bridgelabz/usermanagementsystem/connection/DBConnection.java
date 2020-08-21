package com.bridgelabz.usermanagementsystem.connection;

import java.io.FileReader;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.util.Properties;

public class DBConnection {
    public static Connection getConnection() throws IOException {
    	 System.out.println("Db connection class");
        Connection connection = null;
        
        FileReader reader=new FileReader("/UserManagementSystem/WebContent/resources/db.properties");

        Properties p=new Properties();
        p.load(reader);

        String driver = p.getProperty("db.driver");
        String url = p.getProperty("db.url");
        String username = p.getProperty("db.username");
        String password = p.getProperty("db.password");

        try {
            try {
                Class.forName(driver);
            }
            catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Printing connection object "+ connection);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
