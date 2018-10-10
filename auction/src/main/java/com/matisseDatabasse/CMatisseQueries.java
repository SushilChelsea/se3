package com.matisseDatabasse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import java.io.IOException;
import java.util.ArrayList;

public class CMatisseQueries {
	private String table;
	private Connection connection;
	public CMatisseQueries(String table,Connection connection)
	{
		this.table=table;
		this.connection=connection;
	}
	public void insert(HashMap<String,String> keyValue) 
	{
		String column="";
		String columnValues="";
		Set keys = keyValue.keySet();
        Iterator it = keys.iterator();
        while(it.hasNext())
        {
            String key = (String) it.next();
            if(column!="")
            {
            	column=column+","+key;
            	columnValues=columnValues+","+"?";
            }
            else
            {
            	column=column+key;
            	columnValues=columnValues+"?";
            }
      
        }
       
		String insertQuery="INSERT INTO "+table+"("+column+") VALUES("+columnValues+")";
		System.out.println(insertQuery);
		System.out.println(keyValue.get("weight"));
		System.out.println(keyValue.get("classification"));
		System.out.println(keyValue.get("medium"));
		try {
			
			PreparedStatement stmt=connection.prepareStatement(insertQuery);
			int counter=1;
			Set myKey = keyValue.keySet();
	        Iterator it1 = myKey.iterator();
			while(it1.hasNext())
	        {
	            String key = (String) it1.next();
	            
	            if(key.equals("estimated_price"))
	            {
	            	stmt.setInt(counter,Integer.parseInt(keyValue.get("estimated_price")));
	            }
	            else
	            {
	            	stmt.setString(counter,keyValue.get(key));
	            }
	            
	            counter++;
	        }
			
			stmt.executeUpdate();
		} catch (SQLException e) 
		{
			
			System.out.println("Query  Error: " + e.getMessage());
			
		}
		
	}
	public ResultSet selectFromOID(String OID) {
		String myStatment="Select * FROM "+table+" WHERE OID=?";
		try {
			PreparedStatement stmt=connection.prepareStatement(myStatment);
			stmt.setString(1, OID);
			ResultSet rs=stmt.executeQuery();
			return rs;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ResultSet find(String product)
	{
		
		String myStatement="Select * FROM "+table+" where item_name LIKE ?";
		System.out.println(myStatement);
		try {
			PreparedStatement stmt=connection.prepareStatement(myStatement);
			stmt.setString(1, "%"+product+"%");
			ResultSet result=stmt.executeQuery();
			return result;
			
		}catch(SQLException e){
			System.out.println("Query Error:"+e.getMessage());
			return null;
		}
		
	}
	
	public ResultSet selectFromMultipleColumn(String item_name, String artist_name, String category, String classification, String produce_year,  int estimated_price)
	{
		
		/*String mystatement = "SELECT * FROM "+ table + " WHERE item_name = ? AND artist_name = ? AND category = ? AND classification = ?" 
				+ " AND estimated_price = ?";*/
		String mystatement = "SELECT * FROM "+ table + " WHERE item_name = ? AND artist_name = ? AND category = ? AND classification = ?" 
				+ " AND produce_year = ? AND estimated_price = ?";
		System.out.println(mystatement);
		try {
			PreparedStatement stmt = connection.prepareStatement(mystatement);
			stmt.setString(1, item_name);
			stmt.setString(2, artist_name);
			stmt.setString(3, category);
			stmt.setString(4, classification);
			stmt.setString(5, produce_year);
			stmt.setInt(6, estimated_price); //assuming estimated_price ko datatype is integer
			ResultSet result = stmt.executeQuery();
			

			/*while(result.next()) {
				System.out.println(result.getString("item_name"));
				System.out.println(result.getString("artist_name"));
				System.out.println(result.getString("category"));
				System.out.println(result.getString("classification"));
				System.out.println(result.getString("produce_year"));
				System.out.println(result.getString("estimated_price"));
				System.out.println(result.getString("lot_number"));
				System.out.println(result.getString("auction_date"));
			}*/
			return result;
			
		}catch(SQLException e){
			System.out.println("Query Error:"+e.getMessage());
			return null;
		}
		
	}
	
	public ResultSet selectAll(String table)
	{
		
		String myStatement="SELECT * FROM " + table;
		System.out.println(myStatement);
		try {
			PreparedStatement stmt=connection.prepareStatement(myStatement);
			ResultSet result=stmt.executeQuery();
			return result;
			
		}catch(SQLException e){
			System.out.println("Query Error:"+e.getMessage());
			return null;
		}
		
	}
	public void delete(String OID)
	{
		String sql="Delete FROM "+table+" WHERE OID= ?";
		try {
			PreparedStatement stmt=connection.prepareStatement(sql);
			stmt.setString(1, OID);
			stmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Query Error: " + e.getMessage());
		}
	}
	
	
	
	public void update(HashMap<String,String> keyValue,String OID) 
	{
		String column="";
		String withComma="";
		
		Set keys = keyValue.keySet();
        Iterator it = keys.iterator();
       
        while(it.hasNext())
        {
            String key = (String) it.next();
            if(column!="")
            {
            		
            	column=column+","+key+"=?";
            }
            else
            {
            	column=column+key+"=?";
            }
      
        }     
			String query="UPDATE "+table+" SET "+column+" WHERE OID=?";
			System.out.println(query);
			int counter=1;
			try{
					
					PreparedStatement stmt=connection.prepareStatement(query);
					Set myKey = keyValue.keySet();
			        Iterator it1 = myKey.iterator();
					while(it1.hasNext())
			        {
				            String key = (String) it1.next();
				            
				             
				            if(key.equals("estimated_price"))
				            {
				            	stmt.setInt(counter,Integer.parseInt(keyValue.get("estimated_price")));
				            }
				            else
				            {
				            	stmt.setString(counter,keyValue.get(key));
				            }
				            
				            counter++;
			        }			
					stmt.setString(counter,OID);
					stmt.executeUpdate();
		} catch (SQLException e) 
		{
			System.out.println("Query Error: " + e.getMessage());
		}
		
	}

}
