package t.t.t;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QQQ
 */
//@WebServlet("/test") //여길 변경하든, xml을 변경하든 둘 중 하나만 해야 한다.
public class QQQ extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static final String dbUser="SCOTT";
	private static final String dbPW="TIGER";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QQQ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("qqqqqqqq");
		
		//String dbUser="SCOTT";
		//String dbPW="TIGER";
		
		String dbuser = getInitParameter("dbUser");
		String dbPW = getInitParameter("dbPW");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
