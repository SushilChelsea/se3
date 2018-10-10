<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn"%>    
    
<!DOCTYPE">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
<title>Searched Items</title>
<style>
	th, td {
		padding: 8px;
		text-align: left;
	}
	tr {
		border-top: 2px solid #ddd;
	}
</style>
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
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/layout.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/drawing.jsp">Drawing</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/painting.jsp">Painting</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/photographic.jsp">Photographic-image</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/sculpture.jsp">Sculpture</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Frontend/carving.jsp">Carvings</a></li>
				</ul>
			</div>	
		<div class="col-md-4 col-centered"></div>
		<div class="col-md-7" style="margin-top: 50px;">
		<h2 style="margin-bottom: 40px">Result: </h2>
			<c:choose>
				<c:when test="${fn:length(productsList)>0}">
				    <c:forEach var="obj" items="${productsList}">
				    	<table class="table table-hover" cellpadding="10" style="width:50%">
				    		<tbody>
				    			<tr>
				    				<td align="left">Product Lot Number: </td>
				    				<td align="right">${ obj.lot_number}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Product Name: </td>
				    				<td align="right">${ obj.item_name}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Artist Name: </td>
				    				<td align="right">${ obj.artist_name}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Category: </td>
				    				<td align="right">${ obj.category}</td>
				    			</tr>
				    							    			
				    			<c:if test='${obj.category=="drawings"}'>
				    				<tr>
				    					<td align="left">Medium: </td>
				    					<td align="right">${ obj.medium}</td>					    					
				    				</tr>
				    				<tr>
				    					<td align="left">Framed: </td>
				    					<td align="right">${ obj.framed}</td>
				    				</tr>
				    			</c:if>
				    			<c:if test='${obj.category=="paintings"}'>
				    				<tr>
				    					<td align="left">Medium: </td>
				    					<td align="right">${ obj.medium}</td>					    					
				    				</tr>
				    				<tr>
				    					<td align="left">Framed: </td>
				    					<td align="right">${ obj.framed}</td>
				    				</tr>
				    			</c:if>
				    			<c:if test='${obj.category=="sculptures"}'>
				    				<tr>
				    					<td align="left">Material-Used: </td>
				    					<td align="right">${ obj.material_used}</td>					    					
				    				</tr>
				    				<tr>
				    					<td align="left">Weight: </td>
				    					<td align="right">${ obj.weight}</td>
				    				</tr>
				    			</c:if>
				    			<c:if test='${obj.category=="carvings"}'>
				    				<tr>
				    					<td align="left">Material-Used: </td>
				    					<td align="right">${ obj.material_used}</td>					    					
				    				</tr>
				    				<tr>
				    					<td align="left">Weight: </td>
				    					<td align="right">${ obj.weight}</td>
				    				</tr>
				    			</c:if>
				    			<c:if test='${obj.category=="photographic"}'>
				    				<tr>
				    					<td align="left">Image-Type: </td>
				    					<td align="right">${ obj.image_type}</td>					    					
				    				</tr>
				    			</c:if>
				    				
				    			<tr>
				    				<td align="left">Classification: </td>
				    				<td align="right">${ obj.classification}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Description: </td>
				    				<td align="right">${ obj.description}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Produce year: </td>
				    				<td align="right">${ obj.produce_year}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Auction Date: </td>
				    				<td align="right">${ obj.auction_date}</td>
				    			</tr>
				    			<tr>
				    				<td align="left">Estimated Price: </td>
				    				<td align="right">${ obj.estimated_price}</td>
				    			</tr>
				    		</tbody>
				    	</table>
				    </c:forEach>
			   </c:when>
			   <c:otherwise>
						<c:out value="No Product Found!"/>
				</c:otherwise>
					
					
			</c:choose>
		</div>
		</div>
		
		<div class="row">
			<div class="col-md-2 offset-md-2"></div>
			<div class="col-md-8" >
				
			</div>
		
		</div>

	</div>
</body>
</html>