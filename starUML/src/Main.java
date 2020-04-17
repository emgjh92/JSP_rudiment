import java.util.*;

public class Main {

	public static void main(String[] args) {
		
		TvFactory factory = new TvFactory();
		
		System.out.println("어떤 TV를 사용하시겠습니까?");
		Scanner sc = new Scanner(System.in);
		String inputValue = sc.nextLine();
		
		TvUser user = new TvUser();
		user.useTv(factory.getTv(inputValue));
		// SamsungTv sTv = new SamsungTv();
		// sTv.turnOn();
		// sTv.turnOff();
//		SamsungTv sTv = new SamsungTv();
		
//		user.setsTv(sTv);
//		user.useTv();
	}
}

class TvUser {
	
	// private SamsungTv sTv; // 멤버로써 등록되어 있으면 포함관계(합성/복합관계)(생성도 해야함 - composition) or 집합관계(생성은 다른데서 하고 주입되는 경우 - aggregation), 멤버가 아니면 의존관계
	// private SamsungTv sTv = new SamsungTv();
	
	public TvUser() {
		// sTv = new SamsungTv();
	}
	
	public void useTv(Tv tv) {
//		Tv tv = null;
//		if(value.equals("Samsung")) {
//			SamsungTv sTv = new SamsungTv();
//			sTv.turnOn();
//			sTv.turnOff();
//			tv = new SamsungTv();
//			
//		} else if(value.equals("LG")) {
//			LgTv lTv = new LgTv();
//			lTv.powerOn();
//			lTv.powerOff();
//			tv = new LgTv();
//		}
		tv.powerOn();
		tv.powerOff();
	}
//	public void setsTv(SamsungTv sTv) {
//		this.sTv = sTv;
//	}
	
}

class TvFactory {
	private HashMap<String, Tv> map;
	
	public TvFactory() {
		map = new HashMap<String, Tv>();
		map.put("Samsung", new SamsungTv());
		map.put("LG", new LgTv());
		map.put("Apple", new AppleTv());
	}
	
	public Tv getTv(String value) {
		return map.get(value);
	}
}

interface Tv {
	public void powerOn();
	public void powerOff();
}

class SamsungTv implements Tv{
	public String modelName;
	private int price;
	
	public SamsungTv() {
		price = 50000;
		modelName = "삼성1티비";
	}
//	public void turnOn() {
//		System.out.println("삼성 TV를 켭니다.");
//	}
//	public void turnOff() {
//		System.out.println("삼성 TV를 끕니다.");
//	}
	public void powerOn() {
		System.out.println("Samsung TV를 켭니다.");
	}
	public void powerOff() {
		System.out.println("Samsung TV를 끕니다.");
	}
}

class LgTv implements Tv{
	public void powerOn() {
		System.out.println("LG TV를 켭니다.");
	}
	public void powerOff() {
		System.out.println("LG TV를 끕니다.");
	}
}

class AppleTv implements Tv{
	public void powerOn() {
		System.out.println("Apple TV를 켭니다.");
	}
	public void powerOff() {
		System.out.println("Apple TV를 끕니다.");
	}
}