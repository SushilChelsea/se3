<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../css/custom.css"/>
<title>Drawings</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-2"><img alt="" src="../css/logo.jpg" width="100%;"></div>
			<div class="col-md-1 offset-md-1"></div>
			<div class="col-md-3" style="margin-top: 20px;">
			
				<form method="post" action="${pageContext.request.contextPath}/findServlet">
					<input type="text" name="search" placeholder=" Search by Item Name">
					<input type="submit" name="submit" value="Search" class="btn btn-success btn-sm">
				</form>
				
			</div>
			<div class="col-md-2" style="margin-top: 20px;">
				<a href="advanceSearch.jsp">Advance Search</a>
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
		<div class="col-md-3 col-centered"></div>
		<div class="col-md-7" style="margin-top: 30px;">
		
			<h3 style="color: #2f0f5e;">Painting Listing.</h3>
			<h4>Oil Paintings.</h4>
			<div class="row" style="margin-top: 30px;">
				
				<div class="col-md-5">
					<img alt="" src="../images/oil-painting.jpeg" width="400px;">
					Artist Name: xxx <br>
					Medium: Oil <br>					
				</div>
				<div class="col-md-2 col-centered"></div>
				<div class="col-md-5">
					<img alt="" src="../images/oil-painting1.jpeg" width="400px;">
					Artist Name: xxx <br>
					Medium: Oil <br>
				</div>
				
			</div>
			<h4>WaterColor Paintings.</h4>
			<div class="row" style="margin-top: 30px;">			
				<div class="col-md-5">
					<img alt="" src="../images/watercolor-painting.jpg" width="400px;">
					Artist Name: xxx <br>
					Medium: Water Color. <br>					
				</div>
				
			</div>
			
			 
		</div>
		</div>
		<footer> Copyright & 2018, Sushil Pun </footer>
	</div>
</body>
</html>