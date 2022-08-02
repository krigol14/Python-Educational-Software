<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="database.Dao"%>
<%@ page import="basic.Functions"%>

<%
// get students email from Login.java
HttpSession ses = request.getSession();
String email = ses.getAttribute("email").toString();

// the below code is used in order to colorize differently chapters that have been visited and them that have not been visited
Dao dao = new Dao();
int[] chaptersVisited = dao.checkTimesVisited(email);
String[] visitedOrNot = dao.helperVisitedOrNot(chaptersVisited); 

/*
 * all <a> elements have as class a variable
 * using the visitedOrNot[] array, we set the variable as 'visited' or 'not_visited'
 * in this way, each element uses a different class from the styles.css file so it's colorized differently
 */
String theory1 = visitedOrNot[0];
String theory2 = visitedOrNot[1];
String theory3 = visitedOrNot[2];
String theory4 = visitedOrNot[3];
String theory5 = visitedOrNot[4];
String theory6 = visitedOrNot[5];
String theory7 = visitedOrNot[6];
String multipleChoice1 = visitedOrNot[7];
String trueOrFalse1 = visitedOrNot[8];
String gapFill1 = visitedOrNot[9];
String multipleChoice2 = visitedOrNot[10];
String trueOrFalse2 = visitedOrNot[11];
String gapFill2 = visitedOrNot[12];

String tests1 = "not_visited";
String tests2 = "not_visited";

if (multipleChoice1.equals("visited") && trueOrFalse1.equals("visited") && gapFill1.equals("visited")) {
	tests1 = "visited";
}
if (multipleChoice2.equals("visited") && trueOrFalse2.equals("visited") && gapFill2.equals("visited")) {
	tests2 = "visited";
} 
%>

<nav id="sidebar">
	<div class="sidebar-header">
		<h3>Educational Software</h3>
		<h5>Python Operators</h5>
	</div>

	<ul class="list-unstyled components">
	
		<li><a href="general.jsp">General</a></li>	

		<li><a href="#chapter1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Arithmetic</a>
			<ul class="collapse list-unstyled" id="chapter1">
				<li><a class="<%=theory1%>" href="chapter1_theory.jsp">Theory</a></li>
				<li><a class="<%=tests1%>" data-toggle="modal" data-target="#chapter1_testOptions">Evaluation tests</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Assignment</a>
			<ul class="collapse list-unstyled" id="chapter2">
				<li><a class="<%=theory2%>" href="chapter2_theory.jsp">Theory</a></li>
				<li><a class="<%=tests2%>" data-toggle="modal" data-target="#chapter2_testOptions">Evaluation tests</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Comparison</a>
			<ul class="collapse list-unstyled" id="chapter3">
				<li><a class="<%=theory3%>" href="chapter3_theory.jsp">Theory</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Logical</a>
			<ul class="collapse list-unstyled" id="chapter4">
				<li><a class="<%=theory4%>" href="chapter4_theory.jsp">Theory</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Identity</a>
			<ul class="collapse list-unstyled" id="chapter5">
				<li><a class="<%=theory5%>" href="chapter5_theory.jsp">Theory</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter6" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Membership</a>
			<ul class="collapse list-unstyled" id="chapter6">
				<li><a class="<%=theory6%>" href="chapter6_theory.jsp">Theory</a></li>
			</ul>
		</li>
		
		<li><a href="#chapter7" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Bitwise</a>
			<ul class="collapse list-unstyled" id="chapter7">
				<li><a class="<%=theory7%>" href="chapter7_theory.jsp">Theory</a></li>
			</ul>
		</li>
				
		<li><a href="revisionTests.jsp">Revision tests</a></li>	
		<li><a href="progressAndStats.jsp">Progress and stats</a></li>	
		
		<li><a href="#helpManual" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Help manual</a>
			<ul class="collapse list-unstyled" id="helpManual">
				<li><a href="helpManual.pdf" download="helpManual.pdf">Download help manual</a></li>	
				<li><a href="helpManual.pdf">View help manual</a></li>	
			</ul>
		</li>	
	</ul>

	<ul class="list-unstyled CTAs">
		<li><a href="student.jsp" class="download">Main menu</a></li>
		<li><a href="logout.jsp" class="download">Logout</a></li>
	</ul>
</nav>

<!-- Modal window for chapter1 test types -->
<div class="modal fade" id="chapter1_testOptions" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Choose the exercise type you prefer:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<table align="center" style="border-collapse:separate; border-spacing:0.5em;">
					<tr>
						<td><a href="chapter1_multipleChoice.jsp" class="btn btn-sm <%="test" + multipleChoice1%>" role="button">Multiple Choice</a></td>
					</tr>
					<tr>
						<td><a href="chapter1_trueOrFalse.jsp" class="btn btn-sm <%="test" + trueOrFalse1%>" role="button">True or False</a></td>
					</tr>
					<tr>
						<td><a href="chapter1_gapFill.jsp" class="btn btn-sm <%="test" + gapFill1%>" role="button">Gap Fill</a></td>
					</tr>
					<tr>
						<td><a href=<%="chapter1_" + Functions.pickRandomly()%> class="btn btn-sm random" role="button">Pick Randomly</a></td>
					</tr>
				</table>
      </div>
    </div>
  </div>
</div>

<!-- Modal window for chapter2 test types -->
<div class="modal fade" id="chapter2_testOptions" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Choose the exercise type you prefer:</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<table align="center" style="border-collapse:separate; border-spacing:0.5em;">
					<tr>
						<td><a href="chapter2_multipleChoice.jsp" class="btn btn-sm <%="test" + multipleChoice2%>" role="button">Multiple Choice</a></td>
					</tr>
					<tr>
						<td><a href="chapter2_trueOrFalse.jsp" class="btn btn-sm <%="test" + trueOrFalse2%>" role="button">True or False</a></td>
					</tr>
					<tr>
						<td><a href="chapter2_gapFill.jsp" class="btn btn-sm <%="test" + gapFill2%>" role="button">Gap Fill</a></td>
					</tr>
					<tr>
						<td><a href=<%="chapter2_" + Functions.pickRandomly()%> class="btn btn-sm random" role="button">Pick Randomly</a></td>
					</tr>
				</table>
      </div>
    </div>
  </div>
</div>
