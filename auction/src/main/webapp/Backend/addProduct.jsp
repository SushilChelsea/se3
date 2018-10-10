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
<title>Add Product</title>

<script type="text/javascript">

	$(document).ready(function() {
		toggleFields();
		$("#category").change(function() {
			toggleFields();
		});		
	});

	function toggleFields() {
		
		if ($("#category").val() == 'drawings') {
			$("#drawings").show();
			$("#drawings :input").prop("disabled", false);
			$("#paintings :input").prop("disabled", true);
			$("#carvings :input").prop("disabled", true);
			$("#photographic :input").prop("disabled", true);
			$("#sculptures :input").prop("disabled", true);
		} 
		else {
			$("#drawings").hide();
		}
			
			

		if ($("#category").val() == 'paintings') {
			$("#paintings").show();
			$("#paintings :input").prop("disabled", false);
			$("#sculptures :input").prop("disabled", true);
			$("#carvings :input").prop("disabled", true);
			$("#drawings :input").prop("disabled", true);
			$("#photographic :input").prop("disabled", true);
		}
		else {
			$("#paintings").hide();
		}
			

		if ($("#category").val() == 'photographic') {
			$("#photographic").show();
			$("#photographic :input").prop("disabled", false);
			$("#drawings :input").prop("disabled", true);
			$("#carvings :input").prop("disabled", true);
			$("#paintings :input").prop("disabled", true);
			$("#sculptures :input").prop("disabled", true);
		}
		else {
			$("#photographic").hide();
		}
			

		if ($("#category").val() == 'sculptures') {
			$("#sculptures").show();
			$("#sculptures :input").prop("disabled", false);
			$("#drawings :input").prop("disabled", true);
			$("#carvings :input").prop("disabled", true);
			$("#paintings :input").prop("disabled", true);
			$("#photographic :input").prop("disabled", true);
		}
		else {
			$("#sculptures").hide();
		}
			

		if ($("#category").val() == 'carvings') {
			$("#carvings").show();
			$("#carvings :input").prop("disabled", false);
			$("#sculptures :input").prop("disabled", true);
			$("#photographic :input").prop("disabled", true);
			$("#drawings :input").prop("disabled", true);
			$("#paintings :input").prop("disabled", true);

		}
		else {
			$("#carvings").hide();
		}
			
	}
</script>
</head>
<body>

	<%
		if (null == session.getAttribute("name")) {
	%>
	<div class="nologin">
		<script>
			alert("First you have to login to system.");
		</script>
		<%
			request.getRequestDispatcher("/Backend/login.jsp").forward(request, response);
		%>
	</div>
	<%
		} else {
	%>


	<div class="container">
				<div class="row">
					<div class="col-md-2">
						<img alt="" src="${pageContext.request.contextPath}/css/logo.jpg" width="100%;">
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
		<div class="col-md-2">
			<a href="http://localhost:8080/auction/Backend/product.jsp">Back</a>
		</div>
		<div class="col-md-2 col-centered"></div>
		<div class="col-md-6">
			<h1 style="margin: 35px 0 50px 0px; ">Register Item</h1>
			<form action="${pageContext.request.contextPath}/productServlet"
				method="post">


				<label>Item Name:</label> <input type="text"
					placeholder="Item Name" class="form-control" name="item_name"
					value="<c:if test='${keyValue!=null}'>${keyValue.get('item_name')}</c:if>" required/>



				<label>Lot Number:</label> <input type="number"
					placeholder="Lot Number" name="lot_number"
					class="form-control"
					value="<c:if test='${keyValue!=null}'>${keyValue.get('lot_number')}</c:if>" required/>



				<label>Artist Name:</label> <input type="text"
					placeholder="Artist Name" class="form-control"
					name="artist_name"
					value="<c:if test='${keyValue!=null}'> ${keyValue.get('artist_name')} </c:if>" required/>



				<label>Item Category:</label> <select class="form-control"
					id="category" name="category">
					<c:choose>
						<c:when test="${keyValue.get('category')=='drawings'}">
							<option selected value="drawings">Drawings</option>
							<option value="paintings">Paintings</option>
							<option value="photographic">Photographic Image</option>
							<option value="sculptures">Sculptures</option>
							<option value="carvings">Carvings</option>

						</c:when>

						<c:when test="${keyValue.get('category')=='paintings'}">
							<option selected value="paintings">Paintings</option>
							<option value="drawings">Drawings</option>
							<option value="photographic">Photographic Image</option>
							<option value="sculptures">Sculptures</option>
							<option value="carvings">Carvings</option>
						</c:when>

						<c:when test="${keyValue.get('category')=='photographic'}">
							<option selected value="photographic">Photographic</option>
							<option value="drawings">Drawings</option>
							<option value="paintings">Paintings</option>
							<option value="sculptures">Sculptures</option>
							<option value="carvings">Carvings</option>
						</c:when>

						<c:when test="${keyValue.get('category')=='sculptures'}">
							<option selected value="sculptures">Sculptures</option>
							<option value="drawings">Drawings</option>
							<option value="paintings">Paintings</option>
							<option value="photographic">Photographic Image</option>
							<option value="carvings">Carvings</option>
						</c:when>

						<c:when test="${keyValue.get('category')=='carvings'}">
							<option selected value="carvings">Carvings</option>
							<option value="drawings">Drawings</option>
							<option value="paintings">Paintings</option>
							<option value="photographic">Photographic Image</option>
							<option value="sculptures">Sculptures</option>
						</c:when>

						<c:otherwise>
							<option selected disabled value="">Select a Category</option>
							<option value="drawings">Drawings</option>
							<option value="paintings">Paintings</option>
							<option value="photographic">Photographic Image</option>
							<option value="sculptures">Sculptures</option>
							<option value="carvings">Carvings</option>
						</c:otherwise>

					</c:choose>
				</select>

				<div id="drawings">
					<label>Medium:</label> <input type="text" name="medium"
						placeholder="Drawing Medium" class="form-control"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('medium')}</c:if>" />
					<label>Framed:</label> <input type="text" name="framed"
						placeholder="Framed Or Not" class="form-control"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('framed')}</c:if>" />
				</div>



				<div id="paintings">

					<label>Medium:</label> <input type="text" class="form-control"
						name="medium" placeholder="Painting Medium "
						value="<c:if test='${keyValue!=null}'>${keyValue.get('medium')}</c:if>" />
					<label>Framed:</label> <input type="text" class="form-control"
						name="framed" placeholder="Framed or Not"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('framed')}</c:if>" />

				</div>



				<div id="photographic">

					<label>Image Type:</label> <input type="text" name="image_type"
						class="form-control" placeholder="Images Types"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('image_type')}</c:if>" />

				</div>


				<div id="sculptures">

					<label>Materials Used:</label> <input type="text"
						name="material_used" class="form-control"
						placeholder="Materials Used on Sculptures"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('material_used')}</c:if>" />



					<label>Weight:</label> <input type="text" name="weight"
						placeholder="Approximiate Weight" class="form-control"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('weight')}</c:if>" />

				</div>

				<div id="carvings">

					<label>Materials Used:</label> <input type="text"
						name="material_used" class="form-control"
						placeholder="Materials Used on carvings"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('material_used')}</c:if>" />


					<label>Weight:</label> <input type="text" name="weight"
						class="form-control" placeholder="Approximiate Weight"
						value="<c:if test='${keyValue!=null}'>${keyValue.get('weight')}</c:if>" />

				</div>

				<div class="form-group">
					<label>Item Classification:</label> <select class="form-control"
						name="classification">
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


				<label>Dimension:</label> <input type="text" name="dimension"
					placeholder="Dimension in Cm" class="form-control"
					value="<c:if test='${keyValue!=null}'>${keyValue.get('dimension')}</c:if>" required/>



				<label>Auction Date:</label> <input type="Date" name="auction_date"
					placeholder="Auction Date" class="form-control"
					value="<c:if test='${keyValue!=null}'>${keyValue.get('auction_date')}</c:if>" required/>



				<label>Produce Year:</label> <input type="text" name="produce_year"
					class="form-control" placeholder="Year Produced "
					value="<c:if test='${keyValue!=null}'>${keyValue.get('produce_year')}</c:if>" required/>



				<label>Estimated Price:</label> <input type="number"
					class="form-control" name="estimated_price"
					placeholder="Estimated Price"
					value="<c:if test='${keyValue!=null}'>${keyValue.get('estimated_price')}</c:if>" required/>



				<label>Description:</label>
				<textarea type="text" class="form-control" name="description"><c:if
						test='${keyValue!=null}'>${keyValue.get('description')}</c:if></textarea>

				<c:if test="${keyValue!=null}">
					<input type="hidden" value="${editOID}" name="updateOID">
				</c:if>

				<br>
				<input class="form-control btn btn-success" type="submit" name="submit"
					value="Submit">
				
		</div>

		<div class="col-md-3 col-centered"></div>

		</form>
		<br>
	</div>
	</div>

	<% } %>
	
</body>
</html>