<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>

<head>
<title>Chapter 1 Gap Fill</title>
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
			dao.increaseVisitedCounter(email, "chapter2_gapFill");
			
			// create an array of arrays, each array will store the data of a randomly picked question by calling Dao.pickRandomQuestions()
			String[][] questions = new String[5][];
			
			for (int i = 0; i < 5; i ++) {
				questions[i] = dao.pickRandomQuestions("chapter2_gapFill");
			}
			
			// send the questions randomly picked to TestResult.java servlet to check the users answers
	    	HttpSession httpSession = request.getSession();
			httpSession.setAttribute("question1", questions[0][0]);
			httpSession.setAttribute("question2", questions[1][0]);
			httpSession.setAttribute("question3", questions[2][0]);
			httpSession.setAttribute("question4", questions[3][0]);
			httpSession.setAttribute("question5", questions[4][0]);
			%>

			<form action="<%=request.getContextPath()%>/TestResult" method="post">
			
			<input type="hidden" name="gapFill" value="gapFill">
			<input type="hidden" name="chapter2" value="chapter2">
			<input type="hidden" name="email" value=<%=email%>>
			
			<h5 style="color:#f65868">Fill the gap test - Complete the sentence by filling the gap.</h5>
			<br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.1) <%=questions[0][0]%></b></div>
			  <div class="card-body">
				  <input type="text" name="useranswer1">
			  </div>
			</div>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.2) <%=questions[1][0]%></b></div>
			  <div class="card-body">
				  <input type="text" name="useranswer2">
			  </div>
			</div>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.3) <%=questions[2][0]%></b></div>
			  <div class="card-body">
				  <input type="text" name="useranswer3">
			  </div>
			</div>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.4) <%=questions[3][0]%></b></div>
			  <div class="card-body">
				  <input type="text" name="useranswer4">
			  </div>
			</div>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.5) <%=questions[4][0]%></b></div>
			  <div class="card-body">
				  <input type="text" name="useranswer5">
			  </div>
			</div> 
			  
			  <button type="submit" class="btn btn-sm test_option">Submit</button>
			
			</form>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
