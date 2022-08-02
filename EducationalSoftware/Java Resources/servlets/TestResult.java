package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Dao;

@WebServlet("/TestResult")
public class TestResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}
       
    public TestResult() {
        super();
    }
	
	// doPost method used in order to manage the login data of the user from the login.jsp form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String answer1, answer2, answer3, answer4 ,answer5, useranswer1, useranswer2, useranswer3, useranswer4, useranswer5, description1, description2, description3, description4, description5;
		answer1 = answer2 = answer3 = answer4 = answer5 = useranswer1 = useranswer2 = useranswer3 = useranswer4 = useranswer5 = description1 = description2 = description3 = description4 = description5 = "";
		
		int mistakes = 0; 
		
		String email = request.getParameter("email");
		
		// get the randomly picked questions
    	HttpSession httpSession = request.getSession();
    	String q1 = httpSession.getAttribute("question1").toString();
    	String q2 = httpSession.getAttribute("question2").toString();
    	String q3 = httpSession.getAttribute("question3").toString();
    	String q4 = httpSession.getAttribute("question4").toString();
    	String q5 = httpSession.getAttribute("question5").toString();
    	
    	// using the questions find the correct answer to each one by calling the dao.findCorrectAnswer() function
    	try {
			answer1 = dao.findCorrectAnswer(q1);
			answer2 = dao.findCorrectAnswer(q2);
			answer3 = dao.findCorrectAnswer(q3);
			answer4 = dao.findCorrectAnswer(q4);
			answer5 = dao.findCorrectAnswer(q5);
			
			description1 = dao.findDescription(q1);
			description2 = dao.findDescription(q2);
			description3 = dao.findDescription(q3);
			description4 = dao.findDescription(q4);
			description5 = dao.findDescription(q5);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
    	
		// get users answers
		useranswer1 = request.getParameter("useranswer1");
		useranswer2 = request.getParameter("useranswer2");
		useranswer3 = request.getParameter("useranswer3");
		useranswer4 = request.getParameter("useranswer4");
		useranswer5 = request.getParameter("useranswer5");
		
    	// calculate how many mistakes the user made by comparing his answer to the correct answer
    	if (!useranswer1.equals(answer1)) {
    		mistakes++;
    	}
    	if (!useranswer2.equals(answer2)) {
    		mistakes++;
    	}
    	if (!useranswer3.equals(answer3)) {
    		mistakes++;
    	}
    	if (!useranswer4.equals(answer4)) {
    		mistakes++;
    	}
    	if (!useranswer5.equals(answer5)) {
    		mistakes++;
    	}
    	
    	HttpSession httpSes = request.getSession();
		httpSes.setAttribute("useranswer1", useranswer1);
		httpSes.setAttribute("useranswer2", useranswer2);
		httpSes.setAttribute("useranswer3", useranswer3);
		httpSes.setAttribute("useranswer4", useranswer4);
		httpSes.setAttribute("useranswer5", useranswer5);
		httpSes.setAttribute("answer1", answer1);
		httpSes.setAttribute("answer2", answer2);
		httpSes.setAttribute("answer3", answer3);
		httpSes.setAttribute("answer4", answer4);
		httpSes.setAttribute("answer5", answer5);
		httpSes.setAttribute("mistakes", mistakes);
		
		// USER SUBMITTED THE TRUE OR FALSE TEST
		if (request.getParameter("trueOrFalse") != null) {

			// check if the trueOrFalse test is for chapter2 or chapter1
			if (request.getParameter("chapter2") != null) {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter2_trueOrFalse", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			else {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter1_trueOrFalse", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}

			try {
				description1 = dao.findDescription(q1);
				description2 = dao.findDescription(q2);
				description3 = dao.findDescription(q3);
				description4 = dao.findDescription(q4);
				description5 = dao.findDescription(q5);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			httpSes.setAttribute("description1", description1);
			httpSes.setAttribute("description2", description2);
			httpSes.setAttribute("description3", description3);
			httpSes.setAttribute("description4", description4);
			httpSes.setAttribute("description5", description5);
			
			// show message and redirect to testResult.jps to see the results of the test
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Well done, you completed the test! Close this alert to see the results.');");
			out.println("location='testResult_trueOrFalse.jsp';");
			out.println("</script>");
		}
		
		// USER SUBMITTED THE GAP FILL TEST
		else if (request.getParameter("gapFill") != null) {
	    	    	
			// check if the gapFill test is for chapter2 or chapter1
			if (request.getParameter("chapter2") != null) {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter2_gapFill", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			else {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter1_gapFill", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
	    	
			// show message and redirect to testResult.jps to see the results of the test
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Well done, you completed the test! Close this alert to see the results.');");
			out.println("location='testResult.jsp';");
			out.println("</script>");
		}
		
		// USER SUBMITTED THE REVISION TEST
		else if (request.getParameter("revisionTest") != null) {
	    	    	
	    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
	    	try {
				dao.succeededOrFailed(email, "revisionTest", mistakes);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	    	
			// show message and redirect to testResult.jps to see the results of the test
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Well done, you completed the test! Close this alert to see the results.');");
			out.println("location='testResult.jsp';");
			out.println("</script>");
		}
		
		// USER SUBMITTED THE MULTIPLE CHOICE TEST
		else {
	    	
			// check if the multipleChoice test is for chapter2 or chapter1
			if (request.getParameter("chapter2") != null) {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter2_multipleChoice", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			else {
		    	// call dao.succeededOrFailed to update the db about if the user failed or succeeded in this specific test
		    	try {
					dao.succeededOrFailed(email, "chapter1_multipleChoice", mistakes);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
			
			// show message and redirect to testResult.jps to see the results of the test
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Well done, you completed the test! Close this alert to see the results.');");
			out.println("location='testResult.jsp';");
			out.println("</script>");
		}
	}	
}
