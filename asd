import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		String word = in.nextLine();
		
		//Достаём символы (/,+,-,*)
		String[] characters = word.split("\\s*(\\s|1|2|3|4|5|6|7|8|9|0)\\s*");
		String aC = "";
		String bC = "";
		boolean abc3 = false; //Boolean, если у нас 3 числа. 
		for (String i : characters) {
			if (!(i == "")) {
				if (aC.isEmpty()) {
					aC = i;
				} else {
					bC = i;
					abc3 = true;
				}
				
			}
		}
		//Достаём числа.
		String[] sub = word.split("\\s*(\\s|\\+|-|/|\\*)\\s*");
		int a = 0;
		int b = 0;
		int c = 0;
		for (String i : sub) {
			if (a == 0) {
				a = Integer.parseInt(i);
			} else if (b == 0) {
				b = Integer.parseInt(i);
			} else if ((abc3 = true)&(c == 0)) {
				c = Integer.parseInt(i);
			}
		}
		
		try {
			
		System.out.println(Mathematics.mathematics(a, b, c, aC, bC, abc3));
		}
		catch (Exception e) {
			System.out.println("Ты чо наделал??");
		}
	}

}

//Класс математики.
class Mathematics {
	
	static int mathematics(int a, int b, int c, String aC, String bC, boolean args3) {
		int result = 0;
		switch (aC) {
		case "*":
			result = a * resultbC(bC, b, c, args3);
			break;
		case "/":
			result = a / resultbC(bC, b, c, args3);
			break;
		case "+":
			result = a + resultbC(bC, b, c, args3);
			break;
		case "-":
			result = a - resultbC(bC, b, c, args3);
			break;
		}
		if (args3 == true) {
			switch (bC) {
			case "+":
				result = result + c;
				break;
			case "-":
				result = result - c;
				break;
			default:
				return result;
			}
		} else {
			return result;
		}
		return result;
		
	}
	
	// Метод на тот случай, если у нас 3 аргумента и если есть второй знак (*, /). 
	static int resultbC (String bC, int b, int c, boolean args3) {
		if (args3 == true) {
			switch (bC) {
			case "*":
				return b * c;
			case "/":
				return b / c;
			default:
				return b;
			} 
		} else {
		return b;
	}
}
	
}
