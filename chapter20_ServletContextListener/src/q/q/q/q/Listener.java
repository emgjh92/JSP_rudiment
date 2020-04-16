package q.q.q.q;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class Listener
 *
 */
@WebListener
public class Listener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public Listener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    } //톰캣 서버를 정상 종료 시 딱 한번 실행

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }//톰캣 서버 정상 실행 시 (첫 가동 시) 딱 한번 실행 ==> 초기화 코드를 넣기가 가장 좋은 위치
	
}
