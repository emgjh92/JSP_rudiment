public class Test1 {

	public static void main(String[] args) {
		CommandHandler cc;
	}
}

interface CommandHandler {
	public void process();
}

class TestHandler implements CommandHandler {

	@Override
	public void process() {
		
	}
}