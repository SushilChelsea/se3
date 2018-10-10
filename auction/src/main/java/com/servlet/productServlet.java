package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.matisseDatabasse.CMatisseConnection;
import com.matisseDatabasse.CMatisseQueries;

/**
 * Servlet implementation class productServlet
 */
@WebServlet(urlPatterns="/productServlet")
public class productServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String table="product";
		CMatisseConnection obj=new CMatisseConnection ();
		Connection connect=obj.getConnection();
		
		
		CMatisseQueries sql=new CMatisseQueries(table, connect);
		
		
		if(request.getParameter("edit") != null)
		{
			
			String OID=request.getParameter("edit");
			CMatisseQueries query=new CMatisseQueries(table, connect);//making instance of CMatisseQueries
			ResultSet result=query.selectFromOID(OID);
			
			try {
				result.next();
				HashMap<String,String> keyValue=new HashMap<String,String>();
				
				keyValue.put("item_name", result.getString("item_name"));
				keyValue.put("lot_number", result.getString("lot_number"));
				keyValue.put("classification", result.getString("classification"));
				keyValue.put("auction_date", result.getString("auction_date"));
				keyValue.put("artist_name", result.getString("artist_name"));
				keyValue.put("category", result.getString("category"));
				keyValue.put("produce_year", result.getString("produce_year"));
				keyValue.put("estimated_price", result.getString("estimated_price"));
				keyValue.put("description", result.getString("description"));
				keyValue.put("dimension", result.getString("dimension"));
				
				
				
				if(result.getString("category").equals("sculptures")||result.getString("category").equals("carvings"))
				{
					keyValue.put("material_used", result.getString("material_used"));
					keyValue.put("weight", result.getString("weight"));
				}
				else if(result.getString("category").equals("photographic"))
				{
					keyValue.put("image_type", result.getString("image_type"));
				}
				else if(result.getString("category").equals("drawings")||result.getString("category").equals("paintings"))
				{
					
						keyValue.put("medium", result.getString("medium"));
						keyValue.put("framed", result.getString("framed"));
				}
					
				request.setAttribute("editOID", request.getParameter("edit"));
				request.setAttribute("keyValue", keyValue);
				
	
			} catch (SQLException e) {
				System.out.println("Query Error: " + e.getMessage());
			}	
			System.out.println("<script> alert('Product Edited'); </script>");
			
		}
		if(request.getParameter("delete") != null)
		{
			String OID=request.getParameter("delete");
			sql.delete(OID);
		}
		connect=obj.closeConnection();//Don't forget to close connection after CRUD operation
		request.getRequestDispatcher("/Backend/addProduct.jsp").forward(request, response);
//		response.sendRedirect("/auction/Backend/addProduct.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		System.out.println("Material Used: " + request.getParameter("material_used"));
		System.out.println("Medium : " + request.getParameter("medium"));
		System.out.println("Framed : " + request.getParameter("framed"));
		System.out.println("Weight : " + request.getParameter("weight"));
		System.out.println("Image type : " + request.getParameter("image_type"));
		String table="product";
		CMatisseConnection obj=new CMatisseConnection();
		Connection connection=obj.getConnection();
		
		HashMap<String,String> keyValue=new HashMap<String,String>();//custom key value array  of both type string
		keyValue.put("item_name", request.getParameter("item_name"));
		keyValue.put("lot_number",request.getParameter("lot_number"));
		keyValue.put("estimated_price",request.getParameter("estimated_price"));
		keyValue.put("auction_date",request.getParameter("auction_date"));
		keyValue.put("artist_name",request.getParameter("artist_name"));
		keyValue.put("produce_year",request.getParameter("produce_year"));
		keyValue.put("category",request.getParameter("category"));
		keyValue.put("classification",request.getParameter("classification"));
		keyValue.put("description",request.getParameter("description"));
		keyValue.put("dimension",request.getParameter("dimension"));
		keyValue.put("material_used", request.getParameter("material_used"));
		keyValue.put("framed", request.getParameter("framed"));
		keyValue.put("weight", request.getParameter("weight"));
		keyValue.put("image_type", request.getParameter("image_type"));
		keyValue.put("medium",request.getParameter("medium"));
		
		
		CMatisseQueries queryObj=new CMatisseQueries(table,connection);//making instance of CDatabaseQueries
		if(request.getParameter("updateOID")!=null) {
			
			String oid=request.getParameter("updateOID");
			queryObj.update(keyValue,oid);
		}
			
		else
		{
			queryObj.insert(keyValue);
		}
			
		
		connection=obj.closeConnection();
//		request.getRequestDispatcher("/Backend/NewFile.jsp").forward(request, response);
	}
	

}
