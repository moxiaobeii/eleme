package eleme.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.*; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession; 
import java.util.List; 
import java.util.ArrayList; 
import java.util.StringTokenizer; 
import java.io.IOException;

/** 
* 用于检测用户是否登陆的过滤器，如果未登录，则重定向到指的登录页面


* 配置参数


* checkSessionKey 需检查的在 Session 中保存的关键字

* redirectURL 如果用户未登录，则重定向到指定的页面，URL不包括 ContextPath

* notCheckURLList 不做检查的URL列表，以分号分开，并且 URL 中不包括 ContextPath

*/ 
public class CheckLoginFilter implements Filter { 
	/**
	 * 
	 * <!-- servlet 过滤器 -->
		 <filter>
		  <filter-name>CheckLoginFilter</filter-name>
		  <filter-class>com.start.util.CheckLoginFilter</filter-class>
		  <init-param> 
		       <param-name>checkSessionKey</param-name> 
		       <param-value>forUser</param-value> 
		  </init-param>
		  <init-param>
		  		<param-name>redirectURL</param-name>
		  		<param-value>/index.jsp</param-value>
		  </init-param>
		  <init-param> 
		       <param-name>notCheckURLList </param-name> 
		       <param-value>/error.jsp;/index.jsp;/m/file/login.action</param-value> 
		  </init-param> 
		 </filter>
		  <filter-mapping>
		  <filter-name>CheckLoginFilter</filter-name>
		  <url-pattern>/*</url-pattern>
		 </filter-mapping>
	 */
	protected FilterConfig filterConfig = null; 
	private String redirectURL = null; 
	private List notCheckURLList = new ArrayList();  
	private String sessionKey = null;
	
	public void init(FilterConfig filterConfig) throws ServletException 
	{ 
		this.filterConfig = filterConfig; 
		redirectURL = filterConfig.getInitParameter("redirectURL"); 
		sessionKey = filterConfig.getInitParameter("checkSessionKey");
		
		String notCheckURLListStr = filterConfig.getInitParameter("notCheckURLList");
		
		if(notCheckURLListStr != null) 
		{ 
			StringTokenizer st = new StringTokenizer(notCheckURLListStr, ";"); 
			notCheckURLList.clear(); 
			while(st.hasMoreTokens()) 
			{ 
				notCheckURLList.add(st.nextToken()); 
			} 
		} 
	} 
 
 
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException 
	{ 
		HttpServletRequest request = (HttpServletRequest) servletRequest; 
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		HttpSession session = request.getSession(); 
		if(sessionKey == null) 
		{ 
			filterChain.doFilter(request, response); 
			return; 
		} 
		if((!checkRequestURIIntNotFilterList(request)) && session.getAttribute(sessionKey) == null) 
		{ 
			response.sendRedirect(request.getContextPath() + redirectURL); 
			return; 
		} 
		filterChain.doFilter(servletRequest, servletResponse); 
	}
	
	private boolean checkRequestURIIntNotFilterList(HttpServletRequest request) 
	{ 
		String uri = request.getServletPath() + (request.getPathInfo() == null ? "" : request.getPathInfo()); 
		return notCheckURLList.contains(uri); 
	}

	public void destroy() 
	{ 
		notCheckURLList.clear(); 
	}

}

