<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<title>Display Search Result</title>
</head>
<body>

	<%
		String medium = "";
		String material_used = "";
		String image_type = "";
		String item_name = request.getParameter("item_name");
		String artist_name = request.getParameter("artist_name");
		String category = request.getParameter("category");
		String classification = request.getParameter("classification");
		String auction_date = request.getParameter("auction_date");
		String estimated_price = request.getParameter("estimated_price");

		if (category.equals("drawings") || category.equals("paintings")) {
			medium = request.getParameter("medium");
		}
		if (category.equals("sculptures") || category.equals("carvings")) {
			material_used = request.getParameter("material_used");
		}
		if (category.equals("photographic")) {
			image_type = request.getParameter("image_type");
		}
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<img alt="" src="${pageContext.request.contextPath}/css/logo.jpg"
					width="100%;">
			</div>
			<div class="col-md-1 offset-md-1"></div>
			<div class="col-md-3" style="margin-top: 20px;">

				<form method="post"
					action="${pageContext.request.contextPath}/findServlet">
					<input type="text" name="search" placeholder=" Search...">
					<input type="submit" name="submit" value="Search"
						class="btn btn-success btn-sm">
				</form>

			</div>
			<div class="col-md-2" style="margin-top: 20px;">
				<a href="advanceSearch.jsp">Advance Search</a>
			</div>


			<div class="col-md-2" style="margin-top: 20px;">

				<a href="http://localhost:8080/auction/Backend/logout.jsp">
					Logout</a>
			</div>

		</div>
		
		<div class="row">
			<div class="col-md-2 offset-md-2"></div>
			<div class="col-md-4">

			</div>
		
		</div>

	</div>
</body>
</html>