<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="java.util.Arrays"%>

<!DOCTYPE html>
<html>

<head>
<title>Chapter 1 Multiple Choice</title>
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
			dao.increaseVisitedCounter(email, "chapter1_multipleChoice");
			
			// create an array of arrays, each array will store the data of a randomly picked question by calling Dao.pickRandomQuestions()
			String[][] questions = new String[5][];
			
			for (int i = 0; i < 5; i ++) {
				questions[i] = dao.pickRandomQuestions("chapter1_multipleChoice");
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
			
			<input type="hidden" name="email" value=<%=email%>>
			
			<h5 style="color:#f65868">Multiple choice test - Select the answer you think is correct from the options given.</h5>
			<br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.1) <%=questions[0][0]%></b></div>
			  <div class="card-body">
				  <input type="radio" id="option1" name="useranswer1" value=<%=questions[0][1]%>>
				  	<label for="option1"><%=questions[0][1]%></label><br>
				  
				  <input type="radio" id="option2" name="useranswer1" value=<%=questions[0][2]%>>
				  	<label for="option2"><%=questions[0][2]%></label><br>
				  
				  <input type="radio" id="option3" name="useranswer1" value=<%=questions[0][3]%>>
				  	<label for="option3"><%=questions[0][3]%></label>
			  </div>
			</div><br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.2) <%=questions[1][0]%></b></div>
			  <div class="card-body">
				  <input type="radio" id="option1" name="useranswer2" value=<%=questions[1][1]%>>
				  	<label for="option1"><%=questions[1][1]%></label><br>
				  
				  <input type="radio" id="option2" name="useranswer2" value=<%=questions[1][2]%>>
				  	<label for="option2"><%=questions[1][2]%></label><br>
				  
				  <input type="radio" id="option3" name="useranswer2" value=<%=questions[1][3]%>>
				  	<label for="option3"><%=questions[1][3]%></label>
			  </div>
			</div><br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.3) <%=questions[2][0]%></b></div>
			  <div class="card-body">
				  <input type="radio" id="option1" name="useranswer3" value=<%=questions[2][1]%>>
				  	<label for="option1"><%=questions[2][1]%></label><br>
				  
				  <input type="radio" id="option2" name="useranswer3" value=<%=questions[2][2]%>>
				  	<label for="option2"><%=questions[2][2]%></label><br>
				  
				  <input type="radio" id="option3" name="useranswer3" value=<%=questions[2][3]%>>
				  	<label for="option3"><%=questions[2][3]%></label>
			  </div>
			</div><br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.4) <%=questions[3][0]%></b></div>
			  <div class="card-body">
				  <input type="radio" id="option1" name="useranswer4" value=<%=questions[3][1]%>>
				  	<label for="option1"><%=questions[3][1]%></label><br>
				  
				  <input type="radio" id="option2" name="useranswer4" value=<%=questions[3][2]%>>
				  	<label for="option2"><%=questions[3][2]%></label><br>
				  
				  <input type="radio" id="option3" name="useranswer4" value=<%=questions[3][3]%>>
				  	<label for="option3"><%=questions[3][3]%></label>
			  </div>
			</div><br>
			
			<div class="card bg-light mb-3">
			  <div class="card-header"><b>Q.5) <%=questions[4][0]%></b></div>
			  <div class="card-body">
				  <input type="radio" id="option1" name="useranswer5" value=<%=questions[4][1]%>>
				  	<label for="option1"><%=questions[4][1]%></label><br>
				  
				  <input type="radio" id="option2" name="useranswer5" value=<%=questions[4][2]%>>
				  	<label for="option2"><%=questions[4][2]%></label><br>
				  
				  <input type="radio" id="option3" name="useranswer5" value=<%=questions[4][3]%>>
				  	<label for="option3"><%=questions[4][3]%></label>
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
