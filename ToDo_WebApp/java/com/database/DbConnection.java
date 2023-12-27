package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
     public static Connection con;
     
	 public static Connection getConn() {
		 
		 try {
			 
				 Class.forName("com.mysql.cj.jdbc.Driver");
				   con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todoapp","root","@prakash123");
		   
		 } catch(Exception e) {
			 e.printStackTrace();
		 }
		 return con;
	 }
}
