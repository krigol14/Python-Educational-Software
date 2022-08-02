package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import basic.Encryption;
import basic.Student;
import database.Dao;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}
       
    public Login() {
        super();
    }
	
	// doPost method used in order to manage the login data of the user from the login.jsp form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// request and store the user input from the login.jsp form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
		
		Student student = new Student();
		student.setEmail(email);
		student.setPassword(hashed_password);
		
		// get students first and last name from the db, using his email
		String[] studentData = new String[2];
		try {
			studentData = dao.getStudentData(email);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		String first_name = studentData[0];
		String last_name = studentData[1];
		
		try {			
			// if the students credentials are valid, redirect him to the main page
			if (dao.login(student)) {				
		    	HttpSession ses = request.getSession();
				ses.setAttribute("email", email);
				ses.setAttribute("first_name", first_name);
				ses.setAttribute("last_name", last_name);
				
				response.sendRedirect("student.jsp");
			}
			else {
				// show message about wrong credentials and redirect to initial login form
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Email or password incorrect, try again!');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
	}	
}
