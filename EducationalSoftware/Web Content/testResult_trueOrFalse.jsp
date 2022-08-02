<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="basic.Functions"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>

<head>
<title>Results</title>
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
			// get the randomly picked questions
	    	HttpSession httpSession = request.getSession();
	    	String q1 = httpSession.getAttribute("question1").toString();
	    	String q2 = httpSession.getAttribute("question2").toString();
	    	String q3 = httpSession.getAttribute("question3").toString();
	    	String q4 = httpSession.getAttribute("question4").toString();
	    	String q5 = httpSession.getAttribute("question5").toString();
	    	
	    	HttpSession httpSes = request.getSession();
	    	String useranswer1 = httpSes.getAttribute("useranswer1").toString();
	    	String useranswer2 = httpSes.getAttribute("useranswer2").toString();
	    	String useranswer3 = httpSes.getAttribute("useranswer3").toString();
	    	String useranswer4 = httpSes.getAttribute("useranswer4").toString();
	    	String useranswer5 = httpSes.getAttribute("useranswer5").toString();
	    	String answer1 = httpSes.getAttribute("answer1").toString();
	    	String answer2 = httpSes.getAttribute("answer2").toString();
	    	String answer3 = httpSes.getAttribute("answer3").toString();
	    	String answer4 = httpSes.getAttribute("answer4").toString();
	    	String answer5 = httpSes.getAttribute("answer5").toString();
	    	String description1 = httpSes.getAttribute("description1").toString();
	    	String description2 = httpSes.getAttribute("description2").toString();
	    	String description3 = httpSes.getAttribute("description3").toString();
	    	String description4 = httpSes.getAttribute("description4").toString();
	    	String description5 = httpSes.getAttribute("description5").toString();
	    	int mistakes = (Integer)httpSes.getAttribute("mistakes");

			/*
			 * set the color of the result of each question using a Functions class function
			 * if the answer is correct then set the color to green, otherwise red
			 */
	    	String color1, color2, color3, color4, color5;
	    	
	    	color1 = Functions.setColor(useranswer1, answer1);
	    	color2 = Functions.setColor(useranswer2, answer2);
	    	color3 = Functions.setColor(useranswer3, answer3);
	    	color4 = Functions.setColor(useranswer4, answer4);
	    	color5 = Functions.setColor(useranswer5, answer5);   
	    	
	    	if (mistakes >= 3) {
			%>
			<h3 style="color: #d63343"><b>TEST FAILED! &#x1F61F;</b></h3>
			<%
	    	} else {
			%>
			<h3 style="color: #26a242"><b>TEST SUCCEEDED! &#128512;</b></h3>
			<% } %>
			
			<br>
			<p style="color: #26a242"><b>Correct answers are colored in green<span style="color: #d63343"> and wrong answers are colored in red</span></b><p>

			<div class="card text-white <%=color1%> mb-3">
			  <div class="card-header"><b>Q.1) <%=q1%></b></div>
			  <% if (color1.equals("bg-danger")) { %>
				  <div class="card-body">
				    <p style="color: #fff"><%=description1%></p>
				  </div>
			  <% } %>
			</div>

			<div class="card text-white <%=color2%> mb-3">
			  <div class="card-header"><b>Q.2) <%=q2%></b></div>
			  <% if (color2.equals("bg-danger")) { %>
				  <div class="card-body">
				    <p style="color: #fff"><%=description2%></p>
				  </div>
			  <% } %>
			</div>

			<div class="card text-white <%=color3%> mb-3">
			  <div class="card-header"><b>Q.3) <%=q3%></b></div>
			  <% if (color3.equals("bg-danger")) { %>
				  <div class="card-body">
				    <p style="color: #fff"><%=description3%></p>
				  </div>
			  <% } %>
			</div>

			<div class="card text-white <%=color4%> mb-3">
			  <div class="card-header"><b>Q.4) <%=q4%></b></div>
			  <% if (color4.equals("bg-danger")) { %>
				  <div class="card-body">
				    <p style="color: #fff"><%=description4%></p>
				  </div>
			  <% } %>
			</div>

			<div class="card text-white <%=color5%> mb-3">
			  <div class="card-header"><b>Q.5) <%=q5%></b></div>
			  <% if (color5.equals("bg-danger")) { %>
				  <div class="card-body">
				    <p style="color: #fff"><%=description5%></p>
				  </div>
			  <% } %>
			</div> 
			  
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
