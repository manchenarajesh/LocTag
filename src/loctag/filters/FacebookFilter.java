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

/**
 * Struts Filter that intercepts requests made to a specific path
 */
public class FacebookFilter implements Filter {
	
   public void init(FilterConfig filterConfig) {
   }
   public void destroy() {
   }
   
   /**
    * Handle requests coming from the Facebook server and forward them to the FBloginAction
    */
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	   
	   String destination = "/facebooklogin.do";
	   
	   RequestDispatcher rd = (((HttpServletRequest) request).getSession()).getServletContext().getRequestDispatcher(destination);
	   rd.forward(request, response);


   }
}