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
 * Servlet implementation class findServlet
 */
@WebServlet("/findServlet")
public class findServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public findServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		CMatisseConnection obj=new CMatisseConnection();
		Connection connect=obj.getConnection();
		String table="product";
		CMatisseQueries query=new CMatisseQueries(table,connect);
		if(request.getParameter("search")==null)
		{
			request.getRequestDispatcher("/layout.jsp").forward(request, response);
		}
		else
		{
			ResultSet  myResult=query.find(request.getParameter("search"));
			ArrayList<CProductDetails> productsList=new ArrayList<CProductDetails>();
				try {
					while(myResult.next())					
					{
						
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
