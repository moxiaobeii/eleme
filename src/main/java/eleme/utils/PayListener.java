//package eleme.utils;
//
//import java.io.IOException;
//
//import javax.servlet.ServletContext;
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionListener;
//
//import org.apache.catalina.SessionEvent;
//import org.apache.catalina.SessionListener;
///*@WebListener*/
//public class PayListener implements HttpSessionListener{
//
//	public void sessionCreated(HttpSessionEvent arg0) {
//		
//	}
//
//	public void sessionDestroyed(HttpSessionEvent event) {
//		//当销毁时候,触发页面跳转
//		System.out.println("监听器进行页面跳转");
//		HttpSession session =  event.getSession();
//		
//		ServletContext application = session.getServletContext();
//		HttpServletResponse response = (HttpServletResponse) application.getAttribute("RESPONSE2");
//		try {
//			response.sendRedirect("/reception/pay.jsp");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//	}
//
//	
//
//	
//
//}
