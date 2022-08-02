<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="basic.Functions"%>

<!DOCTYPE html>
<html>

<head>
<title>Arithmetic Operators Theory</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="style.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
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
			
			Dao dao = new Dao();
			
			// retrieve stats about theory chapters using Dao function
			int theory1 = dao.retrieveTheoryStats(email, "chapter1_theory");
			int theory2 = dao.retrieveTheoryStats(email, "chapter2_theory");
			int theory3 = dao.retrieveTheoryStats(email, "chapter3_theory");
			int theory4 = dao.retrieveTheoryStats(email, "chapter4_theory");
			int theory5 = dao.retrieveTheoryStats(email, "chapter5_theory");
			int theory6 = dao.retrieveTheoryStats(email, "chapter6_theory");
			int theory7 = dao.retrieveTheoryStats(email, "chapter7_theory");
			
			// retrieve stats about test chapters using Dao function
			int[] multipleChoice1 = dao.retrieveTestStats(email, "chapter1_multipleChoice");
			int[] multipleChoice2 = dao.retrieveTestStats(email, "chapter2_multipleChoice");
			int[] revisionTest = dao.retrieveTestStats(email, "revisionTest");

			int[] trueOrFalse1 = dao.retrieveTestStats(email, "chapter1_trueOrFalse");
			int[] trueOrFalse2 = dao.retrieveTestStats(email, "chapter2_trueOrFalse");

			int[] gapFill1 = dao.retrieveTestStats(email, "chapter1_gapFill");
			int[] gapFill2 = dao.retrieveTestStats(email, "chapter2_gapFill");

			// find the success ratio for each test chapter
			// success ratio = times_succeeded/times_succeeded + times_failed
			double multipleChoice1_ratio = Functions.findSuccessRatio(multipleChoice1[1], multipleChoice1[2]);
  			double multipleChoice2_ratio = Functions.findSuccessRatio(multipleChoice2[1], multipleChoice2[2]);
  			double revisionTest_ratio = Functions.findSuccessRatio(revisionTest[1], revisionTest[2]);

			double trueOrFalse1_ratio = Functions.findSuccessRatio(trueOrFalse1[1], trueOrFalse1[2]); 
			double trueOrFalse2_ratio = Functions.findSuccessRatio(trueOrFalse2[1], trueOrFalse2[2]); 

			double gapFill1_ratio = Functions.findSuccessRatio(gapFill1[1], gapFill1[2]); 
			double gapFill2_ratio = Functions.findSuccessRatio(gapFill2[1], gapFill2[2]); 
			
			double chapter1_ratio = (multipleChoice1_ratio + trueOrFalse1_ratio + gapFill1_ratio) / 3;
			double chapter2_ratio = (multipleChoice2_ratio + trueOrFalse2_ratio + gapFill2_ratio) / 3;
			%>
			
			<h5 style="color:#f65868">Choose any chapter from the list below to jump straight into its stats, or just scroll.</h5>
			<br>			    

			<div class="list-group" style="max-width:400px">
			  <a href="#1" class="list-group-item list-group-item-action">Chapter 1 - Arithmetic Operators</a>
			  <a href="#2" class="list-group-item list-group-item-action">Chapter 2 - Assignment Operators</a>
			  <a href="#3" class="list-group-item list-group-item-action">Chapters 3 - 7 Theory Stats</a>
			  <a href="#4" class="list-group-item list-group-item-action">Revision Tests</a>
			  <a href="#totalTestsRatio" class="list-group-item list-group-item-action">Explanatory Graphs</a>
			</div>
			
			<br>
			
			<div id="1" class="card bg-light mb-3">
			  <div style="background:#f65868;color:#fff"class="card-header"><b>CHAPTER 1 - ARITHMETIC OPERATORS</b></div>
			  <div class="card-body">
			  
			  <div class="row">
			  				  
				  <div class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Multiple Choice</h5>
				        <p class="card-text">Times succeeded: <%=multipleChoice1[1]%></p>
				        <p class="card-text">Times failed: <%=multipleChoice1[2]%></p>
				        <% if (multipleChoice1_ratio > 50) { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", multipleChoice1_ratio)%>% &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", multipleChoice1_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				  <div class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">True or False</h5>
				        <p class="card-text">Times succeeded: <%=trueOrFalse1[1]%></p>
				        <p class="card-text">Times failed: <%=trueOrFalse1[2]%></p>
				        <% if (trueOrFalse1_ratio > 50) { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", trueOrFalse1_ratio)%>% &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", trueOrFalse1_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				  <br>
				  
				  <div style="margin-top: 20px" class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Gap Fill</h5>
				        <p class="card-text">Times succeeded: <%=gapFill1[1]%></p>
				        <p class="card-text">Times failed: <%=gapFill1[2]%></p>
				        <% if (gapFill1_ratio > 50) { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", gapFill1_ratio)%>% &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", gapFill1_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				 <div style="margin-top: 20px" class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Theory</h5>
				        <p class="card-text">Times visited: <%=theory1%></p>
				      </div>
				    </div>
				  </div>
				   
				</div>
			  </div>
			</div>
			
			<br>
			
			<div id="2" class="card bg-light mb-3">
			  <div style="background:#f65868;color:#fff"class="card-header"><b>CHAPTER 2 - ASSIGNMENT OPERATORS</b></div>
			  <div class="card-body">
			  
			  <div class="row">
			  				  
				  <div class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Multiple Choice</h5>
				        <p class="card-text">Times succeeded: <%=multipleChoice2[1]%></p>
				        <p class="card-text">Times failed: <%=multipleChoice2[2]%></p>
				        <% if (multipleChoice2_ratio > 50) { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", multipleChoice2_ratio)%>% &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", multipleChoice2_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				  <div class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">True or False</h5>
				        <p class="card-text">Times succeeded: <%=trueOrFalse2[1]%></p>
				        <p class="card-text">Times failed: <%=trueOrFalse2[2]%></p>
				        <% if (trueOrFalse2_ratio > 50) { %>
						<p class="card-text">Success ratio: % &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", trueOrFalse2_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				  <br>
				  
				  <div style="margin-top: 20px" class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Gap Fill</h5>
				        <p class="card-text">Times succeeded: <%=gapFill2[1]%></p>
				        <p class="card-text">Times failed: <%=gapFill2[2]%></p>
				        <% if (gapFill2_ratio > 50) { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", gapFill2_ratio)%>% &#128512;</p>
						<%} else { %>
						<p class="card-text">Success ratio: <%=String.format("%.1f", gapFill2_ratio)%>% &#x1F61F;</p>
						<% } %>
				      </div>
				    </div>
				  </div>
				  
				 <div style="margin-top: 20px" class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				        <h5 class="card-title">Theory</h5>
				        <p class="card-text">Times visited: <%=theory2%></p>
				      </div>
				    </div>
				  </div>
				   
				</div>
			  </div>
			</div>
			
			<br>
			
			<div id="3" class="card bg-light mb-3">
			  <div style="background:#f65868;color:#fff"class="card-header"><b>THEORY CHAPTERS - TIMES VISITED EACH</b></div>
			  <div class="card-body">
			  
			  <div class="row">				  
				 <div class="col-sm-6">
				    <div class="card">
				      <div class="card-body">
				      	<table>
				      	<tr>
				      	<td><h6 class="card-title">CHAPTER 3 - COMPARISON OPERATORS: </h6></td>
				      	<td><p><%=theory3%></p></td>
				      	</tr>
				      	
				      	<tr>
				      	<td><h6 class="card-title">CHAPTER 4 - LOGICAL OPERATORS: </h6></td>
				      	<td><p><%=theory4%></p></td>
				      	</tr>
				      	
				      	<tr>
				      	<td><h6 class="card-title">CHAPTER 5 - IDENTITY OPERATORS: </h6></td>
				      	<td><p><%=theory5%></p></td>
				      	</tr>
				      	
				      	<tr>
				      	<td><h6 class="card-title">CHAPTER 6 - MEMBERSHIP OPERATORS: </h6></td>
				      	<td><p><%=theory6%></p></td>
				      	</tr>
				      	
				      	<tr>
				      	<td><h6 class="card-title">CHAPTER 7 - BITWISE OPERATORS: </h6></td>
				      	<td><p><%=theory7%></p></td>
				      	</tr>
				      	</table>
				      </div>
				    </div>
				  </div>
				</div>
				
			  </div>
			</div>	
			
			<br>
			
			<div id="4" class="card bg-light mb-3">
			  <div style="background:#f65868;color:#fff"class="card-header"><b>REVISION TESTS</b></div>
			  <div class="card-body">
			  
			  <div class="row">
			  				  
				  <div class="col-sm-6">
					<div style="max-width: 400px" class="card">
						<div class="card-body">
							<p class="card-text">Times succeeded: <%=revisionTest[1]%></p>
							<p class="card-text">Times failed: <%=revisionTest[2]%></p>
							<% if (revisionTest_ratio > 50) { %>
							<p class="card-text">Success ratio: <%=String.format("%.1f", revisionTest_ratio)%>% &#128512;</p>
							<%} else { %>
							<p class="card-text">Success ratio: <%=String.format("%.1f", revisionTest_ratio)%>% &#x1F61F;</p>
							<% } %>
						</div>	
					</div>
				  </div>				   
				</div>
			  </div>
			</div>
			
			<br>
			
			<div align="center">
				<table style="border-collapse:separate; border-spacing:5em;">
					<tr>
						<td><canvas id="totalTestsRatio" style="width: 100%; max-width: 500px"></canvas></td>
						<td><canvas id="theoryTimesVisited" style="width: 100%; max-width: 500px"></canvas></td>
					</tr>
					<tr>
						<td><canvas id="chapter1_tests" style="width: 100%; max-width: 500px"></canvas></td>
						<td><canvas id="chapter2_tests" style="width: 100%; max-width: 500px"></canvas></td>
					</tr>
				</table>
				<canvas id="revisionTests" style="width: 100%; max-width: 500px"></canvas>
			</div>
	
		</div>
	</div>
	
	<!-- script for creating graphs -->
		<script>
			var xValues = ["Arithmetic Operators", "Assignment Operators"];
			var yValues = [<%=String.format("%.1f", chapter1_ratio)%>, <%=String.format("%.1f", chapter2_ratio)%>];
			var barColors = ["#b30000", "#4421af"];
			
			new Chart("totalTestsRatio", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    title: {
			      display: true,
			      text: "Total Percentage of Tests Success Ratio per Chapter"
			    }
			  }
			});
			
			var xValues = ["Arithmetic", "Assignment", "Comparison", "Logical", "Identity", "Membership", "Bitwise"];
			var yValues = [<%=theory1%>, <%=theory2%>, <%=theory3%>, <%=theory4%>, <%=theory5%>, <%=theory6%>, <%=theory7%>];
			var barColors = ["#b30000", "#4421af", "#8be04e", "#1a53ff", "#00b7c7", "#ebdc78", "cyan"];
			
			new Chart("theoryTimesVisited", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    title: {
			      display: true,
			      text: "Times Visited Theory Chapters"
			    }
			  }
			});
			
			var xValues = ["Multiple Choice", "True or False", "Gap Fill"];
			var yValues = [<%=String.format("%.1f", multipleChoice1_ratio)%>, <%=String.format("%.1f", trueOrFalse1_ratio)%>, <%=String.format("%.1f", gapFill1_ratio)%>];
			var barColors = ["#b30000", "#4421af", "#8be04e"];
			
			new Chart("chapter1_tests", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    title: {
			      display: true,
			      text: "Success Ratio of Chapter 1 Different Test Types"
			    }
			  }
			});
			
			var xValues = ["Multiple Choice", "True or False", "Gap Fill"];
			var yValues = [<%=String.format("%.1f", multipleChoice2_ratio)%>, <%=String.format("%.1f", trueOrFalse2_ratio)%>, <%=String.format("%.1f", gapFill2_ratio)%>];
			var barColors = ["#b30000", "#4421af", "#8be04e"];
			
			new Chart("chapter2_tests", {
			  type: "bar",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    legend: {display: false},
			    title: {
			      display: true,
			      text: "Success Ratio of Chapter 2 Different Test Types"
			    }
			  }
			});
			
			var xValues = ["Times Succeeded", "Times Failed"];
			var yValues = [<%=revisionTest[1]%>, <%=revisionTest[2]%>];
			var barColors = ["#b91d47", "#00aba9"];

			new Chart("revisionTests", {
			  type: "pie",
			  data: {
			    labels: xValues,
			    datasets: [{
			      backgroundColor: barColors,
			      data: yValues
			    }]
			  },
			  options: {
			    title: {
			      display: true,
			      text: "Revision Tests"
			    }
			  }
			});
		</script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
