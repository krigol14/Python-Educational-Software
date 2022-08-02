package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import basic.Student;

public class Dao {
	
	// function that validates whether the users credentials for login are correct or not
	public boolean login(Student student) throws ClassNotFoundException {
		
		boolean login = false;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from student where email = ? and password = ?")
			)
		{
			preparedStatement.setString(1, student.getEmail());
			preparedStatement.setString(2, student.getPassword());
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			login = rs.next();		
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		// if the prepared statement gets executed, the boolean status is set to true and thus the validation is successful
		return login;		
	}
	
	// registration function
	public String register(Student student) throws ClassNotFoundException {
		
		String register = "ok";
			
		Class.forName("com.mysql.cj.jdbc.Driver");
				
		try (
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
				PreparedStatement preparedStatement = connection.prepareStatement("insert into student values (?, ?, ?, ?)")
			) {
				preparedStatement.setString(1, student.getEmail());
				preparedStatement.setString(2, student.getPassword());
				preparedStatement.setString(3, student.getFirst_name());
				preparedStatement.setString(4, student.getLast_name());
				preparedStatement.executeUpdate();	
			} 
		catch (SQLException e) {
				e.printStackTrace();
				register = "not_ok";
			}
		
		return register;
	}
	
	// function that gets a students first and last name from the db by using his email and password
	public String[] getStudentData(String email) throws ClassNotFoundException {
		
		String first_name = "";
		String last_name = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from student where email = ?")
			)
		{
			preparedStatement.setString(1, email);
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				first_name = rs.getString("first_name");
				last_name = rs.getString("last_name");
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		String[] studentData = new String[2];
		studentData[0] = first_name;
		studentData[1] = last_name;
		
		return studentData;	
	}
	
	// function that increases the times a specific chapter has been visited
	public void increaseVisitedCounter(String email, String chapter_name) throws ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_stats where email = ? and chapter_name = ?")
			)
		{
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, chapter_name);
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			
			// this is the first time visiting this chapter
			if (!rs.isBeforeFirst()) {  
				
			    try (PreparedStatement statement = connection.prepareStatement("insert into chapter_stats (email, chapter_name, times_visited, times_succeeded, times_failed) values (?, ?, ?, ?, ?)")) 
			    {
			    	statement.setString(1, email);
			    	statement.setString(2, chapter_name);
			    	statement.setInt(3, 1);
			    	statement.setInt(4, 0);
			    	statement.setInt(5, 0);
			    	
			    	statement.executeUpdate();
			    }
				catch (SQLException e) {
					e.printStackTrace();
				}
			} 
			// this isn't the first time visiting this chapter
			else {
				// initialize variable
				int times_visited = 0;
				
				// retrieve how many times this specific chapter has been visited
				while (rs.next()) {
					times_visited = rs.getInt("times_visited");
				}
				
				// update the db increasing the times the chapter has been visited
			    try (PreparedStatement statement = connection.prepareStatement("update chapter_stats set times_visited = ? where email = ? and chapter_name = ?")) {
			    	statement.setInt(1, times_visited + 1);
			    	statement.setString(2, email);
			    	statement.setString(3, chapter_name);
			    	
			    	statement.executeUpdate();
			    }
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// function that will check how many times each chapter has been visited in order to color it differently
	public int[] checkTimesVisited(String email) throws ClassNotFoundException {

		/*
		 * save how many times each chapter has been visited
		 * initially each chapter has been visited zero times
		 * chapter1_theory = chaptersVisited[0]
		 * chapter2_theory = chaptersVisited[1]
		 * ...
		 * chapter2_gapFill = chaptersVisited[12]
		 */
		int[] chaptersVisited = new int[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_stats where email = ?")
			)
		{
			preparedStatement.setString(1, email);
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				/*
				 * get all the chapters that has been visited by the specific email
				 * for each visited chapter found, store it in its specific position in the chaptersVisited array
				 */
				String chapter_name = rs.getString("chapter_name");
				int times_visited = rs.getInt("times_visited");	
				
				switch (chapter_name) {
					case ("chapter1_theory"):
						chaptersVisited[0] = times_visited;
						break;
					case ("chapter2_theory"):
						chaptersVisited[1] = times_visited;
						break;
					case ("chapter3_theory"):
						chaptersVisited[2] = times_visited;
						break;
					case ("chapter4_theory"):
						chaptersVisited[3] = times_visited;
						break;
					case ("chapter5_theory"):
						chaptersVisited[4] = times_visited;
						break;
					case ("chapter6_theory"):
						chaptersVisited[5] = times_visited;
						break;
					case ("chapter7_theory"):
						chaptersVisited[6] = times_visited;
						break;
					case ("chapter1_multipleChoice"):
						chaptersVisited[7] = times_visited;
						break;
					case ("chapter1_trueOrFalse"):
						chaptersVisited[8] = times_visited;
						break;
					case ("chapter1_gapFill"):
						chaptersVisited[9] = times_visited;
						break;
					case ("chapter2_multipleChoice"):
						chaptersVisited[10] = times_visited;
						break;
					case ("chapter2_trueOrFalse"):
						chaptersVisited[11] = times_visited;
						break;
					case ("chapter2_gapFill"):
						chaptersVisited[12] = times_visited;
						break;
				}
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chaptersVisited;
	}

	// helper function to determine if a specific chapter has been visited or not
	public String[] helperVisitedOrNot(int[] chaptersVisited) {
		
		/*
		 * chaptersVisited[] stores how many times each chapter has been visited
		 * visitedOrNot[] stores whether a specific chapter has been visited or not
		 * if a chapter has been visited, in its position is stored the String 'visited', otherwise we store 'not_visited'
		 * chapter1_theory = visitedOrNot[0]
		 * chapter2_theory = visitedOrNot[1]
		 * ...
		 * chapter2_gapFill = visitedOrNot[12]
		 */
		String[] visitedOrNot = new String[13];
		
		// initialize all chapters as not visited yet
		for (int i = 0; i < 13; i++) {
			visitedOrNot[i] = "not_visited";
		}
		
		for (int j = 0; j < 13; j++) {
			if (chaptersVisited[j] >0) {
				visitedOrNot[j] = "visited";
			}
		}
		
		return visitedOrNot;
	}
	
	// function used to select random questions for each chapter 
	public String[] pickRandomQuestions(String chapter_name) throws ClassNotFoundException {
		
		String[] questionData = new String[5];
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_tests where chapter_name = ? order by RAND() limit 1")
			)
		{
			preparedStatement.setString(1, chapter_name);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				String question = rs.getString("question");
				String option1 = rs.getString("option1");
				String option2 = rs.getString("option2");
				String option3 = rs.getString("option3");
				String answer = rs.getString("answer");
				
				questionData[0] = question;
				questionData[1] = option1;
				questionData[2] = option2;
				questionData[3] = option3;
				questionData[4] = answer;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return questionData;
	}
	
	// function used to select random questions for revision tests
	public String[] pickRandomRevisionQuestions(String chapter_name1, String chapter_name2) throws ClassNotFoundException {
		
		String[] questionData = new String[5];
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_tests where chapter_name = ? or chapter_name = ? order by RAND() limit 1")
			)
		{
			preparedStatement.setString(1, chapter_name1);
			preparedStatement.setString(2, chapter_name2);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				String question = rs.getString("question");
				String option1 = rs.getString("option1");
				String option2 = rs.getString("option2");
				String option3 = rs.getString("option3");
				String answer = rs.getString("answer");
				
				questionData[0] = question;
				questionData[1] = option1;
				questionData[2] = option2;
				questionData[3] = option3;
				questionData[4] = answer;
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return questionData;
	}
	
	// function used to find the correct answer for a specific question
	public String findCorrectAnswer(String question) throws ClassNotFoundException {
		
		String answer = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_tests where question = ?")
			)
		{
			preparedStatement.setString(1, question);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				answer = rs.getString("answer");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return answer;
	}
	
	// function used to find the description of what's correct in case the user makes a mistake in a question of true or false
	public String findDescription(String question) throws ClassNotFoundException {
		
		String description = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_tests where question = ?")
			)
		{
			preparedStatement.setString(1, question);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				// the description in true or false questions is stored in column option3
				description = rs.getString("option3");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return description;
	}
	
	// function that increases the times a specific chapter has been visited
	public void succeededOrFailed(String email, String chapter_name, int mistakes) throws ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_stats where email = ? and chapter_name = ?")
			)
		{
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, chapter_name);
			
			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();
			
			int times_succeeded = 0;
			int times_failed = 0;
			
			while (rs.next()) {
				times_succeeded = rs.getInt("times_succeeded");
				times_failed = rs.getInt("times_failed");
			}

			// test failed so times_failed += 1
			if (mistakes >= 3) {
			    try (PreparedStatement statement = connection.prepareStatement("update chapter_stats set times_failed = ? where email = ? and chapter_name = ?")) 
			    {
			    	statement.setInt(1, times_failed + 1);
			    	statement.setString(2, email);
			    	statement.setString(3, chapter_name);
			    	
			    	statement.executeUpdate();
			    }
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			//  test succeeded so times_succeeded += 1 
			else {
			    try (PreparedStatement statement = connection.prepareStatement("update chapter_stats set times_succeeded = ? where email = ? and chapter_name = ?")) 
			    {
			    	statement.setInt(1, times_succeeded + 1);
			    	statement.setString(2, email);
			    	statement.setString(3, chapter_name);
			    	
			    	statement.executeUpdate();
			    }
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// function used to find how many times each theory chapter has been visited
	public int retrieveTheoryStats(String email, String theoryChapter_name) throws ClassNotFoundException {
		
		int times_visited = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_stats where chapter_name = ? and email = ?")
			)
		{
			preparedStatement.setString(1, theoryChapter_name);
			preparedStatement.setString(2, email);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				// the description in true or false questions is stored in column option3
				times_visited = rs.getInt("times_visited");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return times_visited;
	}
	
	// function used to find how many times each theory chapter has been visited
	public int[] retrieveTestStats(String email, String test_name) throws ClassNotFoundException {
		
		int[] testStats = new int[3];
		
		int times_visited, times_succeeded, times_failed;
		times_visited = times_succeeded = times_failed = 0;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		try (
			// establish the connection with the database giving the url and the database's username and password
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/educationalsoftware?useSSL = false", "root", "An534090");	
			PreparedStatement preparedStatement = connection.prepareStatement("select * from chapter_stats where chapter_name = ? and email = ?")
			)
		{
			preparedStatement.setString(1, test_name);
			preparedStatement.setString(2, email);

			// execute the prepared statement 
			ResultSet rs = preparedStatement.executeQuery();	
			
			while (rs.next()) {
				// the description in true or false questions is stored in column option3
				times_visited = rs.getInt("times_visited");
				times_succeeded = rs.getInt("times_succeeded");
				times_failed = rs.getInt("times_failed");
			}
			
			testStats[0] = times_visited;
			testStats[1] = times_succeeded;
			testStats[2] = times_failed;
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return testStats;
	}
}
