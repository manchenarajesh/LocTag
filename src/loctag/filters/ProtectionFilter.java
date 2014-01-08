package loctag.filters;

import java.io.IOException;

 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Struts Filter to intercept requests and check whether a user session is present before proceeding  
 */
public class ProtectionFilter implements Filter {
	
   public void init(FilterConfig filterConfig) {
   }
   public void destroy() {
   }
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	   
		((HttpServletResponse) response).setHeader("Cache-Control", "no-cache"); // Forces caches to obtain a new copy of the page from the origin server
		((HttpServletResponse) response).setHeader("Cache-Control", "no-store"); // Directs caches not to store the page under any circumstance
		((HttpServletResponse) response).setDateHeader("Expires", 0); // Causes the proxy cache to see the page as "stale"
		((HttpServletResponse) response).setHeader("Pragma", "no-cache"); // HTTP 1.0 backward compatibility
		
	   String destination = "/signin.do";
	
	//if no session is present, forward the request to the login page
	if (((HttpServletRequest) request).getSession().getAttribute("userID")==null){
		System.out.println("No session");   
		RequestDispatcher rd = (((HttpServletRequest) request).getSession()).getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
			
	}
	else{
	//otherwise simply chain the request to proceed
	System.out.println("Session present");
	chain.doFilter(request, response); 

	}
	
   }
}