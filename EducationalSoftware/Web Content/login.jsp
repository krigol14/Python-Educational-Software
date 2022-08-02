<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Log In</title>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div align="center">
	<br><br><br>
	
		<h1>Educational Software</h1>
		<h3>Python Operators</h3>
		<br>
		
		<form action="<%=request.getContextPath()%>/Login" method="post">
			<table>
				<tr>
					<td><input type="text" name="email" placeholder="E-mail" /></td>
				</tr>
				<tr>
					<td><input type="password" name="password" placeholder="Password" /></td>
				</tr>
			</table>
			
			<br>
			<button class="btn btn-sm test_option" type="submit" value="Log In">Log In</button>
			<br>
			<br>
			<div style="position: relative; display: inline-block">
				<a class="register" href="register.jsp">Register now!</a>
			</div>
		</form>
		
	</div>
</body>
</html>
