<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
	<title>Product</title>
</head>
<body>

		<%

			if(null == session.getAttribute("name")) {
		
		%>
			<div class="nologin">
				<script> alert("First you have to login to system."); </script>
				<% request.getRequestDispatcher("/Backend/login.jsp").forward(request, response);%>
			</div>			
		<% } else { %>		
			
			<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img alt="" src="../css/logo.jpg" width="100%;">
					</div>
					<div class="col-md-1 offset-md-1"></div>
					<div class="col-md-3" style="margin-top: 20px;">
						<form method="post" action="${pageContext.request.contextPath}/findServlet">
							<input type="text" name="search" placeholder=" Search by Item Name">
							<input type="submit" name="submit" value="Search" class="btn btn-success btn-sm">
						</form>
					</div>
					<div class="col-md-1 offset-md-1"></div>


						<div class="col-md-2" style="margin-top: 20px;">
					
						<a href="http://localhost:8080/auction/Backend/logout.jsp"> Logout</a>
						</div>

				</div>
				<div class="row">

					<div class="col-md-12" style="margin-top: 20px;">

					<a href="addProduct.jsp" class="btn btn-primary">Add Product</a>


						<center>
							<h2 style="margin-bottom: 30px;">View Product</h2>
						</center>

						<sql:setDataSource var="myDatabase"
							driver="com.matisse.sql.MtDriver"
							url="jdbc:mt://localhost/auction" user="" password="" />
						<sql:query dataSource="${myDatabase}" var="resultSet">
            SELECT * from product;
   		</sql:query>
						<div class="table-responsive">
							<table class="table  table-hover" id="myTable">
								<thead>
									<tr>
										<th>Name</th>
										<th>Artist Name</th>
										<th>Category</th>
										<th>Auction Date</th>
										<th>Estimated Price</th>
										<th>Description</th>
										<th>Produced Year</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${resultSet.rows}">
										<tr>
											<td><c:out value="${row.item_name}" /></td>
											<td><c:out value="${row.artist_name}" /></td>
											<td><c:out value="${row.category}" /></td>
											<td><c:out value="${row.auction_date}" /></td>
											<td><c:out value="${row.estimated_price}" /></td>


											<td><c:out value="${row.description}" /></td>
											<td><c:out value="${row.produce_year}" /></td>

											<td>
												<a
												href="${pageContext.request.contextPath}/productServlet?edit=${row.OID}"><button
														class="btn btn-warning">Edit</button></a> <a
												href="${pageContext.request.contextPath}/productServlet?delete=${row.OID}"><button
														class="btn btn-danger" onclick="return confirm('Are you sure?')">Delete</button></a>
											</td>





										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						

					</div>
				</div>
			</div>
		<% } %>

</body>
</html>