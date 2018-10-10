package com.matisseDatabasse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CMatisseConnection {
	public Connection connection;	// connection variable of type class Connection
	
	public CMatisseConnection()		// constructor
	{
		try 
		{
			Class.forName("com.matisse.sql.MtDriver");
			connection = DriverManager.getConnection("jdbc:mt://localhost/auction");			
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
			System.out.println("Driver missing!");
			return;
		}
		catch (SQLException e) 
		{
			System.out.println("Failed to connect");
			e.printStackTrace();
			return;
		}		
	}
	
	public Connection getConnection() 
	{
		return connection;
	}
	
	public Connection closeConnection()
	{
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

}
