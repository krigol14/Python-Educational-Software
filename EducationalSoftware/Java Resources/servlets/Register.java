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

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// create an object of the Dao class in order to manage the connection with the database
	private Dao dao;
	
	// when this servlet gets initialized, the dao object gets instantiated
	public void init() {
		dao = new Dao();
	}
       
    public Register() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// request and store the user input from the registerStudent.jsp form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		
		// hash the password
		SecureRandom random = new SecureRandom();
		byte bytes[] = new byte[20];
		random.nextBytes(bytes);		
		String hashed_password = Encryption.getHashMD5(password, random.toString());
				
		// create a new student object using the user's input
		Student student = new Student();
		student.setEmail(email);
		student.setPassword(hashed_password);
		student.setFirst_name(first_name);
		student.setLast_name(last_name);
		
		try {		
			// if the registration is completed redirect to main page in order to login with new credentials
			if (dao.register(student) == "ok") {
		    	HttpSession session = request.getSession();
				session.setAttribute("email", email);
				
				// show message and redirect
				out.println("<script type=\"text/javascript\">");
				out.println("alert('You have been succesfully registered, now use your credentials to login!');");
				out.println("location='login.jsp';");
				out.println("</script>");
			}
			else {
				// show message about wrong credentials and redirect to initial login form
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Registration error, try again!');");
				out.println("location='register.jsp';");
				out.println("</script>");
			}
				
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
