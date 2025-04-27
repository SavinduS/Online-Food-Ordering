package com.foodordering.Util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConnect {
	
	public static Connection getConnection()throws ClassNotFoundException, SQLException{
	
	String url="jdbc:mysql://localhost:3306/onlinefoodordering";
	String user="root";
	String pass="12345";
			
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn= DriverManager.getConnection(url,user,pass);
	return conn;
	
	}
	
 	
}
