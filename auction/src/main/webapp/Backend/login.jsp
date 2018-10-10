<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>

<style>
	.form {
		background-color: grey; margin: auto; width: 30%; padding: 10px;
	}
	.form td {
		padding: 10px;
	}
	input[type=text], input[type=password] {
		height: 30px;
		width: 180px;
	}
	input[type=reset], input[type=submit] {
		margin-top: 20px;
		height: 40px;
		width: 100px;
	}

</style>
</head>
<body>
	
	<div class="form">
	<center><h2>Admin Login</h2></center>
		<form action="${pageContext.request.contextPath}/loginServlet" method="post">
			<table>
				<tbody>
					<tr>
						<td><h3>Username:</h3></td>
						<td><input type="text" name="username"
							placeholder=" Enter Username"></td>
					</tr>
					<tr>
						<td><h3>Password:</h3></td>
						<td><input type="password" name="password"
							placeholder=" Enter Password"></td>
					</tr>
					<tr>
						<td align="right"><input type="reset" name="reset" value="Clear"></td>
						<td align="left"><input type="submit" name="submit" value="Submit">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>