package basic;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Functions {
	
	// function which returns a random string representing a jsp page which contains a random test option
	public static String pickRandomly() {
		
	    List<String> options = Arrays.asList("multipleChoice.jsp", "trueOrFalse.jsp", "gapFill.jsp");
	    Random rand = new Random();
	    String randomChoice = options.get(rand.nextInt(options.size()));
	    
	    return randomChoice;
	}
	
	// function to set the color on the testResult.jsp page, based on whether the users answer was correct or not
	public static String setColor(String useranswer, String answer) {
		String color = "";
		
		// wrong answer - red color
		if (!useranswer.equals(answer)) {
			color = "bg-danger";
		}
		// correct answer - green color
		else {
			color = "bg-success";
		}
		
		return color;
	}
	
	// function to find the success ratio for a test chapter
	public static double findSuccessRatio(int times_succeeded, int times_failed) {
		double ratio = 0;

		if ((times_succeeded + times_failed) > 0) {
			ratio = (double) times_succeeded / (times_succeeded + times_failed);
		}
		
		return ratio*100;
	}
}
