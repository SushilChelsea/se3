package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.matisseDatabasse.CMatisseConnection;
import com.matisseDatabasse.CMatisseQueries;
import com.product.CProductDetails;

/**
 * Servlet implementation class advanceSearchServlet
 */
@WebServlet("/advanceSearchServlet")
public class advanceSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public advanceSearchServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String item_name = request.getParameter("item_name");
		String artist_name = request.getParameter("artist_name");
		String category = request.getParameter("category");
		String classification = request.getParameter("classification");
		String produce_year = request.getParameter("produce_year");
		String estimated_price = request.getParameter("estimated_price");

//		
		if(item_name== "" || artist_name=="" || category=="" || classification=="" || estimated_price=="")
		{
			response.sendRedirect("Frontend/layout.jsp");
		}
		else
		{
			int price = Integer.parseInt(estimated_price);
			String table="product";
			
			CMatisseConnection obj = new CMatisseConnection();
			Connection connect = obj.getConnection();
			CMatisseQueries query = new CMatisseQueries(table,connect);
			

//			ResultSet  myResult=query.find(item_name);
			ResultSet  myResult = query.selectFromMultipleColumn(item_name, artist_name, category, classification, produce_year, price);
			
			ArrayList<CProductDetails> productsList = new ArrayList<CProductDetails>();
				try {
					
					while(myResult.next())					
					{
						System.out.println(myResult.getString("item_name"));
						System.out.println(myResult.getString("artist_name"));
						System.out.println(myResult.getString("category"));
						System.out.println(myResult.getString("classification"));
						System.out.println(myResult.getString("produce_year"));
						System.out.println(myResult.getString("estimated_price"));
						System.out.println(myResult.getString("lot_number"));
						System.out.println(myResult.getString("auction_date"));
						
						CProductDetails product =new CProductDetails();
						product.setOID(myResult.getString("OID"));
						product.setItem_name(myResult.getString("item_name"));
						product.setLot_number(myResult.getString("lot_number"));
						product.setEstimated_price(myResult.getInt("estimated_price"));
						product.setAuction_date(myResult.getString("auction_date"));
						product.setArtist_name(myResult.getString("artist_name"));
						product.setClassification(myResult.getString("classification"));
						product.setCategory(myResult.getString("category"));
						product.setDescription(myResult.getString("description"));
						product.setDimension(myResult.getString("dimension"));
						product.setImage_type(myResult.getString("image_type"));
						product.setMaterial_used(myResult.getString("material_used"));
						product.setProduce_year(myResult.getString("produce_year"));
						product.setFramed(myResult.getString("framed"));
						product.setMedium(myResult.getString("medium"));
						product.setWeight(myResult.getString("weight"));
						
						productsList.add(product);
						
					}
					request.setAttribute("productsList", productsList);
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				connect=obj.closeConnection();
				request.getRequestDispatcher("/Frontend/display.jsp").forward(request, response);
			
			}

	}


}
