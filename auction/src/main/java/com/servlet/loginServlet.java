package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*storing post variable*/
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		
		// step 1: set the content type
		response.setContentType("text/html");
		// step 2: get the printwriter
		PrintWriter out = response.getWriter();
		
		/*if username and password match start session*/
		if (name.equals("sushil") && password.equals("sushil")) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);			// settin session attribute name
			
			String n=(String)session.getAttribute("name");	// getting session attribute name
			
//			request.setAttribute("name", n);
			
			response.sendRedirect("/auction/Backend/product.jsp");
//			request.getRequestDispatcher("/Backend/product.jsp").forward(request, response);
			
		} else {
		
			// step 3: generate HTML content
			out.println("<html><body>");
			out.println("<script> alert('Username or Passwor Incorrect!'); </script>");
			out.println("<a href=\"http://localhost:8080/auction/Backend/login.jsp\">Back To Login Page</a>");
			out.println("</body></html>");
			
		}
		out.close();
	}

}
