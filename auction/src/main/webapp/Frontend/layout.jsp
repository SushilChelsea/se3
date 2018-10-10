<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<title>Layout</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"><img alt="" src="${pageContext.request.contextPath}/css/logo.jpg" width="100%;"></div>
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
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/layout.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/drawing.jsp">Drawing</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/painting.jsp">Painting</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/photographic.jsp">Photographic-image</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/sculpture.jsp">Sculpture</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/carving.jsp">Carvings</a></li>
				</ul>
			</div>
		<div class="col-md-3 col-centered"></div>
		<div class="col-md-7" style="margin-top: 50px;">
		
			<h3 style="color: #2f0f5e; padding: 3px; border-left: 5px solid red;">Welcome to Forthby's International Auction House.</h3>
			<br>
			<div class="para" style="text-align: justify;">
				<p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			 <p>An auction is a process of buying and selling goods or services
			 by offering them up for bid, taking bids, and then selling the item to the highest bidder.
			 The open ascending price auction is arguably the most common form of auction in use today.</p>
			</div>
			 
		</div>
		</div>
		<footer> Copyright & 2018, Sushil Pun </footer>
	</div>
</body>
</html>