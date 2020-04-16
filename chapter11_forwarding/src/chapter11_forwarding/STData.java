package chapter11_forwarding;

public class STData {
	private String name;
	private int score;
	
	public STData(String name, int score) {
		this.name = name;
		this.score = score;
	}
	
	public String getName() { //반드시get+대문자 첫글자인이름 명명법을 따라야 한다.
		return name;
	}
	
	public int getScore() { //반드시get+대문자 첫글자인이름 명명법을 따라야 한다.
		return score;
	}
	
	//오버라이딩
	public String toString() {
		return "아무거나...";
	}
}
