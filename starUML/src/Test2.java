public class Test2 {

	public static void main(String[] args) {

	}
}

abstract class SomeClass {
	private int a;
	private int b;
	
	public void test1() {
		// abstract class는 method를 구현 해도 되고
	}
	public abstract void test2(); // 구현 안해도 됨
}

class AAA extends SomeClass {

	@Override
	public void test2() {
		
	}
}