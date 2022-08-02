<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="basic.Functions"%>
<!DOCTYPE html>
<html>

<head>
<title>Hello Student</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="style.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
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
 			HttpSession ses = request.getSession();
			String email = ses.getAttribute("email").toString();
			String first_name = ses.getAttribute("first_name").toString();
			String last_name = ses.getAttribute("last_name").toString();
			
			Dao dao = new Dao();
			
			/*
			 * retrieve stats about test chapters using Dao function
			 * multipleChoice1[0] -> times visited this chapter
			 * multipleChoice1[1] -> times succeeded this chapter
			 * multipleChoice1[2] -> times failed this chapter
			 * and similarly for the other chapters
			 */
			// chapter1 stats
			int[] multipleChoice1 = dao.retrieveTestStats(email, "chapter1_multipleChoice");
			int[] trueOrFalse1 = dao.retrieveTestStats(email, "chapter1_trueOrFalse");
			int[] gapFill1 = dao.retrieveTestStats(email, "chapter1_gapFill");
			
			// success ratio = times_succeeded/times_succeeded + times_failed
			double multipleChoice1_ratio = Functions.findSuccessRatio(multipleChoice1[1], multipleChoice1[2]);
			double trueOrFalse1_ratio = Functions.findSuccessRatio(trueOrFalse1[1], trueOrFalse1[2]); 
			double gapFill1_ratio = Functions.findSuccessRatio(gapFill1[1], gapFill1[2]); 
			double chapter1_ratio = (multipleChoice1_ratio + trueOrFalse1_ratio + gapFill1_ratio) / 3;
			
			// chapter2 stats
			int[] multipleChoice2 = dao.retrieveTestStats(email, "chapter2_multipleChoice");
			int[] trueOrFalse2 = dao.retrieveTestStats(email, "chapter2_trueOrFalse");
			int[] gapFill2 = dao.retrieveTestStats(email, "chapter2_gapFill");
			
			// success ratio = times_succeeded/times_succeeded + times_failed
  			double multipleChoice2_ratio = Functions.findSuccessRatio(multipleChoice2[1], multipleChoice2[2]);
			double trueOrFalse2_ratio = Functions.findSuccessRatio(trueOrFalse2[1], trueOrFalse2[2]); 
			double gapFill2_ratio = Functions.findSuccessRatio(gapFill2[1], gapFill2[2]); 
			double chapter2_ratio = (multipleChoice2_ratio + trueOrFalse2_ratio + gapFill2_ratio) / 3;
			
			// by using the stats check if the user has taken a chapters test at least one time
			boolean chapter1 = false;
			boolean chapter2 = false;
			if ((multipleChoice1[1] + multipleChoice1[2] + trueOrFalse1[1] + trueOrFalse1[2] + gapFill1[1] + gapFill1[2]) > 0) {
				chapter1 = true;
			}
			if ((multipleChoice2[1] + multipleChoice2[2] + trueOrFalse2[1] + trueOrFalse2[2] + gapFill2[1] + gapFill2[2]) > 0) {
				chapter2 = true;
			}
			%>
			
			<!-- modal window about warning welcome message -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Hello <%= first_name + " " + last_name %>!</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <!-- 
						check if the user has taken any tests, or not 
						if he has, then display the chapter he has the worst success ratio
						with a message warning to try harder at that specific chapter
						 -->
						<% if ((chapter1 == true) && (chapter1_ratio < chapter2_ratio)) { %>
							<p style="font-size: 30px;text-align: center">&#9888;&#65039; &#9888;&#65039; &#9888;&#65039;</p>
							<p><b>Your biggest weakness is chapter: </b></p>
							<p style="color: #e2b603"><b>Arithmetic Operators (<%=String.format("%.1f", chapter1_ratio)%>% success ratio in tests).</b></p>
							<p><b>Study its theory and then try tests again!</b></p>
							
						<% } else if ((chapter2 == true) && (chapter2_ratio < chapter1_ratio)){ %>
							<p style="font-size: 30px;text-align: center">&#9888;&#65039; &#9888;&#65039; &#9888;&#65039;</p>
							<p><b>Your biggest weakness is chapter: </b></p>
							<p style="color: #e2b603"><b>Assignment Operators (<%=String.format("%.1f", chapter2_ratio)%>% success ratio in tests).</b></p>
							<p><b>Study its theory and then try tests again!</b></p>
						<% } %>
				      </div>
				    </div>
				  </div>
				</div>
			
			<!-- if the warning modal is shown then don't show Hello FirstName LastName -->
			<% if (chapter1 == false && chapter2 == false) { %>
				<h1>Hello <%= first_name + " " + last_name %>!</h1>
			<% } %>
			
			<br><br>
			
			<p style="font-size:25px"><b>Each chapter from the sidebar on the left consists of theory and evaluation tests,</b></p>
			<p style="font-size:25px"><b>choose anyone you want to start learning!</b><br><br><br>
			
			<p style="font-size:20px;color: #26a242" class="theory"><b>By clicking on each chapter, notice that chapters already visited are colored in green,</b></p>
			<p style="font-size:20px;color: #d63343" class="theory"><b>while those you have not visited yet are colored in red.</b></p>

	</div>
	</div>
	
	<!-- load warning welcome message if the user has submitted any tests -->
	<script>
	$(window).load(function()
		{
			// if the user has submitted any tests then load the warning modal
			if (<%=chapter1 == true%> || <%=chapter2 == true%>) {
				$('#myModal').modal('show');
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
