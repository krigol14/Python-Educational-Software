<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>

<!DOCTYPE html>
<html>

<head>
<title>Assignment Operators Theory</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="style.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
<script src="Javascript/loadSidebar.js"></script>

</head>

<body onload='loadHtml("side", "studentSidebar.jsp")'>
	
	<div class="wrapper">
	
		<div id='side' class='side'></div>

		<div id="content">
		
			<div class="container-fluid">
				<button type="button" id="sidebarCollapse" class="btn btn-info" style="background:#f65868; border-color:#f65868">
					<i class="fas fa-align-left"></i> 
					<span>Toggle Sidebar</span>
				</button>	
			</div>
			
			<br><br>
			
			<%	
			// get students email from Login.java
 			HttpSession ses = request.getSession();
			String email = ses.getAttribute("email").toString();

			// call Dao function in order to increase counter about times this specific chapter was visited
			Dao dao = new Dao();
			dao.increaseVisitedCounter(email, "chapter2_theory");
			%>
			
			<p class="theory"><b style="font-size: 25px">Assignment operators</b> are used to assign values to variables:</p>
			<br>
			
			<table class="table table-bordered table-sm">
			  <thead>
			    <tr style="background:#f65868;color:#fff">
			      <th>Operator </th>
			      <th>Example</th>
			      <th>Same As</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>=</td>
			      <td>x = 5</td>
			      <td>x = 5</td>
			    </tr>
			    <tr>
			      <td>+=</td>
			      <td>x += 3</td>
			      <td>x = x + 3</td>
			    </tr>
				<tr>
			      <td>-=</td>
			      <td>x -= 3</td>
			      <td>x = x - 3</td>
			    </tr>
			    <tr>
			      <td>*=</td>
			      <td>x *= 3</td>
			      <td>x = x * 3</td>
			    </tr>
			    <tr>
			      <td>/=</td>
			      <td>x /= 3</td>
			      <td>x = x / 3</td>
			    </tr>
			    <tr>
			      <td>%=</td>
			      <td>x %= 3</td>
			      <td>x = x % 3</td>
			    </tr>
			    <tr>
			      <td>//=</td>
			      <td>x //= 3</td>
			      <td>x = x // 3</td>
			    </tr>
			  	<tr>
			      <td>**=</td>
			      <td>x **= 3</td>
			      <td>x = x ** 3</td>
			    </tr>
			    <tr>
			      <td>&=</td>
			      <td>x &= 3</td>
			      <td>x = x & 3</td>
			    </tr>
			    <tr>
			      <td>|=</td>
			      <td>x |= 3</td>
			      <td>x = x | 3</td>
			    </tr>
				<tr>
			      <td>^=</td>
			      <td>x ^= 3</td>
			      <td>x = x ^ 3</td>
			    </tr>
			    <tr>
			      <td>>>=</td>
			      <td>x >>= 3</td>
			      <td>x = x >> 3</td>
			    </tr>
			    <tr>
			      <td><<=</td>
			      <td>x <<= 3</td>
			      <td>x = x << 3</td>
			    </tr>
			  </tbody>
			</table>
				
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
