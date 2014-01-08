package loctag.filters;

import java.io.IOException;
 
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Struts Filter to intercept requests to check whether they are direct requests to annotation IDs
 */

public class IDFilter implements Filter {
	
   public void init(FilterConfig filterConfig) {
   }
   public void destroy() {
   }
   
   /**
    * Extracts the annotation ID from the path and if it's an integer it redirects the request to the actual
    * annotation action URL
    */
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	   
	   StringBuffer pathInfo = ((HttpServletRequest) request).getRequestURL();
	   int lastSlashPos = pathInfo.toString().lastIndexOf("/");
	   int len = pathInfo.length();
	   String theID = pathInfo.substring(lastSlashPos + 1,len);
	   
	      
	   try{
		   int checkID = Integer.parseInt(theID);
		   String destination = "http://loctag.mobi/annotation.loc?id="+theID;
		   HttpServletResponse res = (HttpServletResponse) response;
		   res.sendRedirect(destination);
	   }
	   catch (NumberFormatException n){
			//if not an integer simply chain the request to proceed
			chain.doFilter(request, response); 
	   }
	   

	   



		
 	   


   }
}