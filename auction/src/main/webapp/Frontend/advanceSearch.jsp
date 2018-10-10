<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<script type='text/javascript' src='${pageContext.request.contextPath}/css/jquery.min.js'></script>
<script type='text/javascript' src="${pageContext.request.contextPath}/css/bootstrap.min.js"></script>
<title>Advance Search</title>


</head>
<body>

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
					<input type="text" name="search" placeholder=" Search by Item Name">
					<input type="submit" name="submit" value="Search"
						class="btn btn-success btn-sm">
				</form>

			</div>
			<div class="col-md-2" style="margin-top: 20px;">
				<a href="${pageContext.request.contextPath}/Frontend/advanceSearch.jsp">Advance Search</a>
			</div>


			<%
				if (null == session.getAttribute("name")) {
			%>
			<div class="col-md-2" style="margin-top: 20px;"><a href="${pageContext.request.contextPath}/Backend/login.jsp">Admin Login</a></div>
			
			<%
				} else {
			%>
			<div class="col-md-2" style="margin-top: 20px;">
				<a href="${pageContext.request.contextPath}/Backend/logout.jsp">
					Logout</a>
			</div>
			<%
				}
			%>

		</div>
		<div class="row">
			<div class="col-md-2" style="position: fixed; z-index:1; top: 100px;">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="layout.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="drawing.jsp">Drawing</a></li>
					<li class="nav-item"><a class="nav-link" href="painting.jsp">Painting</a></li>
					<li class="nav-item"><a class="nav-link" href="photographic.jsp">Photographic-image</a></li>
					<li class="nav-item"><a class="nav-link" href="sculpture.jsp">Sculpture</a></li>
					<li class="nav-item"><a class="nav-link" href="carving.jsp">Carvings</a></li>
				</ul>
			</div>
			<div class="col-md-4 col-centered"></div>
			<div class="col-md-6">
				<h1 style="margin: 35px 0 50px 0px;">Search Item</h1>
				<form action="${pageContext.request.contextPath}/advanceSearchServlet" method="post">


					<label>Item Name:</label> <input type="text"
						placeholder="Enter Item Name" class="form-control"
						name="item_name" />



					<label>Artist Name:</label> <input type="text"
						placeholder="Enter Artist Name" class="form-control"
						name="artist_name" /> 
						
					<label>Item Category:</label> 
					<select
						class="form-control" id="category" name="category">
						<option value="drawings">Drawing</option>
						<option value="paintings">Painting</option>
						<option value="photographic">Photographic</option>
						<option value="sculptures">Sculptures</option>
						<option value="carvings">Carvings</option>
					</select>


					<div class="form-group">
						<label>Item Classification:</label> 
						<select class="form-control" name="classification">
							<option value="landscape">Landscape</option>
							<option value="seascape">Seascape</option>
							<option value="stillLife">Still Life</option>
							<option value="nude">Nude</option>
							<option value="animal">Animal</option>
							<option value="portrait">Portrait</option>
							<option value="figure">Figure</option>
							<option value="abstract">Abstract</option>
							<option value="other">Others</option>

						</select>
					</div>


					<label>Produce Year:</label> 
						<input type="text" name="produce_year" placeholder="Produced Year" class="form-control" /> 
					<label>Estimated Price:</label> 
						<input type="number" class="form-control" name="estimated_price" placeholder="Enter estimated Price of an Item" /> 


					<br> 
					<input class="form-control btn btn-success" type="submit" name="submit" value="Advance Search">
			</div>

			</form>
			<br>
		</div>
	</div>


</body>
</html>